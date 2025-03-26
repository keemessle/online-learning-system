<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<%
    String studentId = (String) session.getAttribute("student_id");
    String subjectCode = request.getParameter("student_id");

    PreparedStatement pstmt = null;

    try {
        String sql = "DELETE FROM Student_subjects " +
                     "WHERE student_id = (SELECT student_id FROM Students WHERE student_id = ?) " +
                     "AND subject_id = (SELECT subject_id FROM Subjects WHERE subject_code = ?)";

        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, studentId);
        pstmt.setString(2, subjectCode);
        int row = pstmt.executeUpdate();
        
        if(row > 0) {
            out.println("<script>alert('과목이 성공적으로 삭제되었습니다.'); location.href='subject.jsp';</script>");
        } else {
            out.println("<script>alert('과목 삭제에 실패했습니다.'); location.href='subject.jsp';</script>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<script>alert('오류가 발생했습니다.'); location.href='subject.jsp';</script>");
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
        if (conn != null) try { conn.close(); } catch (SQLException e) {}
    }
%>
