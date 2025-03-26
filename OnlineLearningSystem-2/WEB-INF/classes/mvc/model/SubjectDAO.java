package mvc.model;

import java.sql.*;
import java.util.ArrayList;
import mvc.database.DBConnection;

public class SubjectDAO {
    private static SubjectDAO instance = new SubjectDAO();

    public static SubjectDAO getInstance() {
        return instance;
    }

    public ArrayList<SubjectDTO> getSubjectsByStudent(String studentName) throws SQLException, ClassNotFoundException {
        ArrayList<SubjectDTO> subjectList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT s.subject_id, s.subject_name, s.subject_code, s.subject_credit, p.name AS user_name " +
                         "FROM Subjects s " +
                         "JOIN Student_subjects ss ON s.subject_id = ss.subject_id " +
                         "JOIN Students st ON ss.student_id = st.student_id " +
                         "JOIN Professor_subjects ps ON s.subject_id = ps.subject_id " +
                         "JOIN Professors p ON ps.professor_id = p.professor_id " +
                         "WHERE st.name = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, studentName);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                SubjectDTO subject = new SubjectDTO();
                subject.setSubjectId(rs.getInt("subject_id"));
                subject.setSubjectName(rs.getString("subject_name"));
                subject.setSubjectCode(rs.getString("subject_code"));
                subject.setSubjectCredit(rs.getInt("subject_credit"));
                subject.setUserName(rs.getString("user_name"));
                subjectList.add(subject);
            }
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) {}
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
            if (conn != null) try { conn.close(); } catch (SQLException e) {}
        }
        return subjectList;
    }

    public ArrayList<SubjectDTO> getSubjectsByProfessor(String professorName) throws SQLException, ClassNotFoundException {
        ArrayList<SubjectDTO> subjectList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT s.subject_id, s.subject_name, s.subject_code, s.subject_credit, p.name AS user_name " +
                         "FROM Subjects s " +
                         "JOIN Professor_subjects ps ON s.subject_id = ps.subject_id " +
                         "JOIN Professors p ON ps.professor_id = p.professor_id " +
                         "WHERE p.name = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, professorName);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                SubjectDTO subject = new SubjectDTO();
                subject.setSubjectId(rs.getInt("subject_id"));
                subject.setSubjectName(rs.getString("subject_name"));
                subject.setSubjectCode(rs.getString("subject_code"));
                subject.setSubjectCredit(rs.getInt("subject_credit"));
                subject.setUserName(rs.getString("user_name"));
                subjectList.add(subject);
            }
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) {}
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
            if (conn != null) try { conn.close(); } catch (SQLException e) {}
        }
        return subjectList;
    }
    
}
