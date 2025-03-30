<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="/WEB-INF/dbconn.jsp" %>
<%@ page import="java.io.*" %>
<%
    request.setCharacterEncoding("utf-8");

    String subjectName = request.getParameter("subject_name");
    int subjectCredit = Integer.parseInt(request.getParameter("subject_credit"));
    String subjectCode = request.getParameter("subject_code");
    String professorId = (String) session.getAttribute("login_id"); // 교수의 user_id

    PreparedStatement pstmt = null;

    try {
        // Subjects 테이블에 과목 추가
        String sql = "INSERT INTO Subjects (subject_name, subject_credit, subject_code) VALUES (?, ?, ?)";
        pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        pstmt.setString(1, subjectName);
        pstmt.setInt(2, subjectCredit);
        pstmt.setString(3, subjectCode);
        int count = pstmt.executeUpdate();

        if (count > 0) {
            ResultSet generatedKeys = pstmt.getGeneratedKeys();
            if (generatedKeys.next()) {
                int subjectId = generatedKeys.getInt(1);

                // Professor_subjects 테이블에 추가
                sql = "INSERT INTO Professor_subjects (professor_id, subject_id) VALUES ((SELECT professor_id FROM Professors WHERE login_id = ?), ?)";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, professorId);
                pstmt.setInt(2, subjectId);
                pstmt.executeUpdate();
            }
        }

        response.sendRedirect("index.jsp");
    } catch (Exception e) {
        e.printStackTrace();
        out.println("오류가 발생했습니다: " + e.getMessage());
    } finally {
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
