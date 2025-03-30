package mvc.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mvc.database.DBConnection;

public class AttendanceController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        int subjectId = Integer.parseInt(request.getParameter("subjectId"));
        int videoId = Integer.parseInt(request.getParameter("videoId"));

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
        	try {
        		conn = DBConnection.getConnection();
        	} catch(Exception e) {}
            
            String sql = "INSERT INTO Attendance (student_id, subject_id, video_id, watched, watched_date) " +
                         "VALUES (?, ?, ?, TRUE, NOW()) " +
                         "ON DUPLICATE KEY UPDATE watched = VALUES(watched), watched_date = VALUES(watched_date)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, studentId);
            pstmt.setInt(2, subjectId);
            pstmt.setInt(3, videoId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
            if (conn != null) try { conn.close(); } catch (SQLException e) {}
        }
    }
    
}
