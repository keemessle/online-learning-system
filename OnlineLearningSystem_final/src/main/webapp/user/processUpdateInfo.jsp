<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%@ include file="/WEB-INF/dbconn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String password = request.getParameter("passwd");
	String user_number = request.getParameter("user_number");
	String email = request.getParameter("email");
	String phone_number = request.getParameter("phone_number");
	String birth_date = request.getParameter("birth_date");
	String role = request.getParameter("role");
	
	PreparedStatement pstmt = null;
	
	try{
		String professor_sql = "UPDATE Professors SET login_id = ?, login_password = ?, email = ?, phone_number = ?, birth_date = ? " +
								"WHERE professor_number = ?";
		String student_sql = "UPDATE Students SET login_id = ?, login_password = ?, email = ?, phone_number = ?, birth_date = ? " +
				"WHERE students.student_number = ?";
		
		if(role.equals("Professor")){
			pstmt = conn.prepareStatement(professor_sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			pstmt.setString(3, email);
			pstmt.setString(4, phone_number);
			pstmt.setDate(5, java.sql.Date.valueOf(birth_date));
			pstmt.setInt(6, Integer.parseInt(user_number));
		}
		else if(role.equals("Student")){
			pstmt = conn.prepareStatement(student_sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			pstmt.setString(3, email);
			pstmt.setString(4, phone_number);
			pstmt.setDate(5, java.sql.Date.valueOf(birth_date));
			pstmt.setInt(6, Integer.parseInt(user_number));
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
	
	response.sendRedirect("logout.jsp");
%>