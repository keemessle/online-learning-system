<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="/WEB-INF/dbconn.jsp" %>
<%
    String videoId = request.getParameter("video_id");
    String subjectId = request.getParameter("subject_id");

    PreparedStatement pstmt = null;

    try {
        String delete_sql = "DELETE FROM SubjectVideos WHERE video_id = ?";
        pstmt = conn.prepareStatement(delete_sql);
        pstmt.setInt(1, Integer.parseInt(videoId));
        pstmt.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
        if (conn != null) try { conn.close(); } catch (SQLException e) {}
    }
    response.sendRedirect("subject.dat?command=viewVideos&subject_id=" + subjectId);
%>
