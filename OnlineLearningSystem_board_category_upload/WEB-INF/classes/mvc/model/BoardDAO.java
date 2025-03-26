package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import mvc.database.DBConnection;

public class BoardDAO {

	private static BoardDAO instance = new BoardDAO();
	// private String itmes;
	//private String boardID;
	
	private BoardDAO() {
		
	}
	
	public static BoardDAO getInstance() {
		if (instance==null)
		  instance=new BoardDAO();
	      return instance;
	}
	
	// board 테이블의 레코드 개수
	public int getListCount(String items, String text, int boardID) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		int x = 0;
		
		String sql;
		
		if (items==null && text==null)
			sql = "select count(*) from board where boardID=?";
		else
			sql = "SELECT count(*) FROM board where " + items + " like '%" + text + "%' AND boardID = ?";
		
		try {
			conn=DBConnection.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, boardID);
			rs=pstmt.executeQuery();
			
			if (rs.next())
				x = rs.getInt(1);
			
		} catch (Exception ex) {
			System.out.println("getListCount() 예외 발생");
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
	
		}
		return x;
			
	}
	
	// board 테이블의 레코드 가져오기
	public ArrayList<BoardDTO> getBoardList(int boardID, int page, int limit, String items, String text) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		// int total_record = getListCount(items, text, boardID );
		int start = (page - 1) * limit;
		// int index = start + 1;
		String sql;
		
		if (items==null && text==null)
			sql = "select * from board where boardID=? and num < ? order by num desc limit 10";
		else
			sql = "SELECT * FROM board where booardID = ? and " + items + " like '%" + text + "%' ORDER BY num DESC LIMIT 10";
		
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		
		try {
			conn=DBConnection.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,  boardID);
			pstmt.setInt(2, start);
			pstmt.setInt(3, limit);
			rs=pstmt.executeQuery();
			
			while (rs.next()) {
				BoardDTO board = new BoardDTO();
				board.setNum(rs.getInt("num"));
				board.setBoardID(rs.getInt("boardID"));
				board.setLogin_id(rs.getString("login_id"));
				board.setName(rs.getString("name"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setPostdate(rs.getString("postdate"));
				board.setHit(rs.getInt("hit"));
				board.setIp(rs.getString("ip"));
				list.add(board);
				
			}
			return list;
			
		} catch (Exception ex) {
			System.out.println("getBoardList() 예외발생: " + ex);
		} finally {
			try {
				if (rs!=null)
					rs.close();
				if (pstmt!=null)
					pstmt.close();
				if (conn!=null)
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
		return null;
	}
	
	
	
	// 회원 테이블에서 인증된 id의 사용자명 가져오기
	public String getLoginNameById(String login_id) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	

		String name=null;
		String sql1 = "select * from Students where login_id = ? ";
		String sql2 = "select * from Professors where login_id = ? ";

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql1);
			pstmt = conn.prepareStatement(sql2);
			pstmt.setString(1, login_id);
			rs = pstmt.executeQuery();

			if (rs.next()) 
				name = rs.getString("name");	
			
			return name;
		} catch (Exception ex) {
			System.out.println("getBoardByNum() 예외발생: " + ex);
		} finally {
			try {				
				if (rs != null) 
					rs.close();							
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}		
		}
		return null;
	}
	
	// board 테이블에 새로운 글 삽입하기
	public void insertBoard(BoardDTO board) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.getConnection();		

			String sql = "insert into board values(?, ?, ?, ?, ?, ?, ?, ?)";
		
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board.getNum());
			pstmt.setInt(2, board.getBoardID());
			pstmt.setString(3, board.getLogin_id());
			pstmt.setString(4, board.getName());
			pstmt.setString(5, board.getTitle());
			pstmt.setString(6, board.getContent());
			pstmt.setString(7, board.getPostdate());
			pstmt.setInt(8, board.getHit());
			pstmt.setString(9, board.getIp());
			

			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("insertBoard() 예외발생: " + ex);
		} finally {
			try {									
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}		
		}		
	}
	
	// 선택된 글의 조회수 증가시키기
	public void updateHit(int num) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.getConnection();

			String sql = "select hit from board where num = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			int hit = 0;

			if (rs.next())
				hit = rs.getInt("hit") + 1;
		

			sql = "update board set hit=? where num=?";
			pstmt = conn.prepareStatement(sql);		
			pstmt.setInt(1, hit);
			pstmt.setInt(2, num);
			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("updateHit() 예외발생: " + ex);
		} finally {
			try {
				if (rs != null) 
					rs.close();							
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}			
		}
	}
	
	// 선택된 글 상세 내용 가져오기
	public BoardDTO getBoardByNum(int num, int page) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDTO board = null;

		updateHit(num);
		String sql = "select * from board where num = ? ";

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				board = new BoardDTO();
				board.setNum(rs.getInt("num"));
				board.setLogin_id(rs.getString("login_id"));
				board.setName(rs.getString("name"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setPostdate(rs.getString("postdate"));
				board.setHit(rs.getInt("hit"));
				board.setIp(rs.getString("ip"));
			}
			
			return board;
		} catch (Exception ex) {
			System.out.println("getBoardByNum() 예외발생: " + ex);
		} finally {
			try {
				if (rs != null) 
					rs.close();							
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}		
		}
		return null;
	}
	
	// 선택된 글 내용 수정하기
	public void updateBoard(BoardDTO board) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
	
		try {
			String sql = "update board set name=?, title=?, content=? where num=?";

			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			conn.setAutoCommit(false);

			pstmt.setString(1, board.getName());
			pstmt.setString(2, board.getTitle());
			pstmt.setString(3, board.getContent());
			pstmt.setInt(4, board.getNum());

			pstmt.executeUpdate();		
			conn.commit();

		} catch (Exception ex) {
			System.out.println("updateBoard() 예외발생: " + ex);
		} finally {
			try {										
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}		
		}
	}
	
	// 선택된 글 삭제하기
	public void deleteBoard(int num) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;		

		String sql = "delete from board where num=?";	

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println("deleteBoard() 예외발생: " + ex);
		} finally {
			try {										
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}		
		}
	}


}
