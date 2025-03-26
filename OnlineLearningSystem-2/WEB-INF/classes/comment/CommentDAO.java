package comment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import mvc.database.DBConnection;

public class CommentDAO {
	
	private Connection conn;	
	private ResultSet rs;
	
	public CommentDAO() {
		try {
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ""; 
	}
	public int getNext() {
		String SQL = "SELECT commentID FROM comment ORDER BY commentID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 1;
	}
	public int write(int boardID, int num, String login_id, String commenttxt) {
		String SQL = "INSERT INTO comment VALUES(?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardID);
			pstmt.setInt(2, getNext());
			pstmt.setInt(3, num);
			pstmt.setString(4, login_id);
			pstmt.setString(5, getDate());
			pstmt.setString(6, commenttxt);
			pstmt.executeUpdate();
			return getNext();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; 
	}
	public String getUpdateComment(int commentID) {
		String SQL = "SELECT commenttxt FROM comment WHERE commentID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, commentID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ""; //����
	}
	public ArrayList<CommentDTO> getList(int boardID, int num){
		String SQL = "SELECT * FROM comment WHERE boardID = ? AND num= ? ORDER BY num DESC"; 
		ArrayList<CommentDTO> list = new ArrayList<CommentDTO>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardID);
			pstmt.setInt(2,  num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				CommentDTO cmt = new CommentDTO();
				cmt.setBoardID(rs.getInt(1));
				cmt.setCommentID(rs.getInt(2));
				cmt.setNum(rs.getInt(3));
				cmt.setLogin_id(rs.getString(4));
				cmt.setCommentdate(rs.getString(5));
				cmt.setCommenttxt(rs.getString(6));
				list.add(cmt);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; 
	}
	
	public int update(int commentID, String commenttxt) {
		String SQL = "UPDATE comment SET commenttxt = ? WHERE commentID LIKE ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, commenttxt);
			pstmt.setInt(2, commentID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // �����ͺ��̽� ����
	}
	public CommentDTO getComment(int commentID) {
		String SQL = "SELECT * FROM comment WHERE commentID = ? ORDER BY commentID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  commentID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				CommentDTO cmt = new CommentDTO();
				cmt.setBoardID(rs.getInt(1));
				cmt.setCommentID(rs.getInt(2));
				cmt.setNum(rs.getInt(3));
				cmt.setLogin_id(rs.getString(4));
				cmt.setCommentdate(rs.getString(5));
				cmt.setCommenttxt(rs.getString(6));
				return cmt;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public int delete(int commentID) {
		String SQL = "DELETE FROM comment WHERE commentID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, commentID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; 
	}
}
