<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String password = request.getParameter("passwd");
	String user_number = request.getParameter("user_number");
	String role = request.getParameter("role");
	
	PreparedStatement pstmt = null;
	
	try{
		String professor_sql = "DELETE FROM Professors " + 
							   "WHERE professor_number = ?";
		String student_sql = "DELETE FROM Students " + 
				   			 "WHERE student_number = ?";
		
		if(role.equals("Professor")){
			pstmt = conn.prepareStatement(professor_sql);
			
			pstmt.setInt(1, Integer.parseInt(user_number));
		}
		else if(role.equals("Student")){
			pstmt = conn.prepareStatement(student_sql);
			
			pstmt.setInt(1, Integer.parseInt(user_number));
		}
		
		pstmt.executeUpdate();
	} catch(Exception e){
		e.printStackTrace();
		out.println("오류가 발생했씁니다: " + e.getMessage());
	} finally{
		if(pstmt != null) {
			try{
				pstmt.close();
			} catch(SQLException e){}
		}
		if(conn != null) {
			try{
				conn.close();
			} catch(SQLException e){}
		}
	
	}	
	
	response.sendRedirect("logout.jsp");
%>