package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import mvc.database.DBConnection;

public class BoardDAO {

	private static BoardDAO instance;
	
	private BoardDAO() {}
	
	public static BoardDAO getInstance() {
		if (instance == null)
		  instance = new BoardDAO();
		return instance;
	}
	
	
	// 게시글 개수 가져오기
	public int getListCount(String items, String text) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = 0;
		String sql;
		
		if (items == null && text == null)
			sql = "select count(*) from board";
		else
			sql = "SELECT count(*) FROM board where" + items + " like '%" + text + "%'";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next())
				x = rs.getInt(1);
			
		} catch (Exception ex) {
			System.out.println("getListCount() 예외 발생" + ex.getMessage());
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
	
		}
		return x;
			
	}
	
	
	
	
	// 게시글 목록 가져오기
	public ArrayList<BoardDTO> getBoardList(int page, int limit, String items, String text) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int total_record = getListCount(items, text);
		int start = (page - 1) * limit;
		int index = start + 1;
		String sql;
		
		if (items == null && text == null)
			sql = "select * from board ORDER BY num DESC";
		else
			sql = "SELECT * FROM board where " + items + " like '%" + text + "%' ORDER BY num DESC ";
		
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			rs = pstmt.executeQuery();
			
			while (rs.absolute(index)) {
				BoardDTO board = new BoardDTO();
				board.setNum(rs.getInt("num"));
				board.setLogin_id(rs.getString("login_id"));
				board.setName(rs.getString("name"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setPostdate(rs.getString("postdate"));
				board.setHit(rs.getInt("hit"));
				board.setIp(rs.getString("ip"));
				list.add(board);
				
				if (index < (start + limit) && index <= total_record)
					index++;
				else break;
			}
			return list;
			
		} catch (Exception ex) {
			System.out.println("getBoardList() 예외발생: " + ex);
		} finally {
			try {
				if (rs!=null) rs.close();
				if (pstmt!=null) pstmt.close();
				if (conn!=null) conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
		return list;
	}
	
	
	
	// 로그인 사용자 이름 가져오기
	public String getLoginNameById(String login_id) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	
		String name = null;
		
		String sql1 = "select * from Students where login_id = ? ";
		String sql2 = "select * from Professors where login_id = ? ";

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, login_id);
			rs = pstmt.executeQuery();

			if (rs.next()) name = rs.getString("name");
			
			if (name == null) {
	            pstmt = conn.prepareStatement(sql2);
	            pstmt.setString(1, login_id);
	            rs = pstmt.executeQuery();
	            if (rs.next()) name = rs.getString("name");
	        }
			
		} catch (Exception ex) {
			System.out.println("getBoardByNum() 예외발생: " + ex);
		} finally {
			try {				
				if (rs != null) rs.close();							
				if (pstmt != null) pstmt.close();				
				if (conn != null) conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}		
		}
		return name;
	}
	
	// 게시글 삽입
	public void insertBoard(BoardDTO board) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.getConnection();		
			String sql = "insert into board values(?, ?, ?, ?, ?, ?, ?, ?)";
		
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board.getNum());
			pstmt.setString(2, board.getLogin_id());
			pstmt.setString(3, board.getName());
			pstmt.setString(4, board.getTitle());
			pstmt.setString(5, board.getContent());
			pstmt.setString(6, board.getPostdate());
			pstmt.setInt(7, board.getHit());
			pstmt.setString(8, board.getIp());

			pstmt.executeUpdate();
			
		} catch (Exception ex) {
			System.out.println("insertBoard() 예외발생: " + ex);
		} finally {
			try {									
				if (pstmt != null) pstmt.close();				
				if (conn != null) conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}		
		}		
	}
	
	// 조회수 증가
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
			if (rs.next()) hit = rs.getInt("hit") + 1;

			sql = "update board set hit=? where num=?";
			pstmt = conn.prepareStatement(sql);		
			pstmt.setInt(1, hit);
			pstmt.setInt(2, num);
			pstmt.executeUpdate();
			
		} catch (Exception ex) {
			System.out.println("updateHit() 예외발생: " + ex);
		} finally {
			try {
				if (rs != null) rs.close();							
				if (pstmt != null) pstmt.close();				
				if (conn != null) conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}			
		}
	}
	
	
	
	
	// 게시글 번호 상세 보기
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
			
		} catch (Exception ex) {
			System.out.println("getBoardByNum() 예외발생: " + ex);
		} finally {
			try {
				if (rs != null) rs.close();							
				if (pstmt != null) pstmt.close();				
				if (conn != null) conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}		
		}
		return board;
	}
	
	
	
	// 게시글 수정
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
				if (pstmt != null) pstmt.close();				
				if (conn != null) conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}		
		}
	}
	
	
	
	// 게시글 삭제
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
				if (pstmt != null) pstmt.close();				
				if (conn != null) conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}		
		}
	}
}
