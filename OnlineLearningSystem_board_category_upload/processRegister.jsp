<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String name = request.getParameter("name");
	String id = request.getParameter("id"); 
	String password = request.getParameter("passwd");
	String user_number = request.getParameter("user_number");
	String email = request.getParameter("email");
	String phone_number = request.getParameter("phone_number");
	String birth_date = request.getParameter("birth_date");
	String role = request.getParameter("role");
	
	PreparedStatement pstmt = null;
	
	try{
		if(role.equals("professor")){
			String sql = "INSERT INTO Professors (name, login_id, login_password, professor_number, email, phone_number, birth_date, role) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setString(2, id);
			pstmt.setString(3, password);
			pstmt.setInt(4, Integer.parseInt(user_number));
			pstmt.setString(5, email);
			pstmt.setString(6, phone_number);
			pstmt.setDate(7, java.sql.Date.valueOf(birth_date));
			pstmt.setString(8, role);
		}
		else if(role.equals("student")){
			String sql = "INSERT INTO Students (name, login_id, login_password, student_number, email, phone_number, birth_date, role) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setString(2, id);
			pstmt.setString(3, password);
			pstmt.setInt(4, Integer.parseInt(user_number));
			pstmt.setString(5, email);
			pstmt.setString(6, phone_number);
			pstmt.setDate(7, java.sql.Date.valueOf(birth_date));
			pstmt.setString(8, role);
		}
		
		int count = pstmt.executeUpdate();
		
		if(count > 0) {
			out.println("회원가입이 성공적으로 완료되었씁니다.");
		}
		else{
			out.println("회원가압에 실패했습니다.");
		}
	
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
	
	response.sendRedirect("login.jsp");
%>