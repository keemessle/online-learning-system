<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ include file="/WEB-INF/dbconn.jsp" %>
<%
    request.setCharacterEncoding("utf-8");

    int subjectId = Integer.parseInt(request.getParameter("subject_id"));
    String loginId = (String) session.getAttribute("login_id"); 

    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        // login_id로 student_id 가져오기
        String getStudentIdSql = "SELECT student_id FROM Students WHERE login_id = ?";
        pstmt = conn.prepareStatement(getStudentIdSql);
        pstmt.setString(1, loginId);
        rs = pstmt.executeQuery();

        int studentId = -1;
        
        if (rs.next()) { studentId = rs.getInt("student_id"); }
        /* int studentId = rs.getInt("student_id"); */

	        // Student_subjects 테이블에 저장
	        String insertStudentSubjectSql = "INSERT INTO Student_subjects (student_id, subject_id) VALUES (?, ?)";
	        pstmt = conn.prepareStatement(insertStudentSubjectSql);
	        pstmt.setInt(1, studentId);
	        pstmt.setInt(2, subjectId);
	        int count = pstmt.executeUpdate();

	        if (count > 0) {
	            System.out.println("과목 신청이 성공적으로 완료되었습니다.");
	        } else {
	            System.out.println("과목 신청에 실패했습니다.");
	        }

	        response.sendRedirect("../index.jsp");
	    } catch (Exception e) {
	        e.printStackTrace();
	        out.println("오류가 발생했습니다: " + e.getMessage());
	    } finally {
	        if (rs != null) {
	            try {
	                rs.close();
	            } catch (SQLException e) { }
	        }
	        if (pstmt != null) {
	            try {
	                pstmt.close();
	            } catch (SQLException e) { }
	        }
	        if (conn != null) {
	            try {
	                conn.close();
	            } catch (SQLException e) { }
	        }
    	}
%>
