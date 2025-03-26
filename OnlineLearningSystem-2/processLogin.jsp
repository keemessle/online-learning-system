<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		String sql1 = "SELECT * FROM Students WHERE login_id = ? AND login_password = ?";
		String sql2 = "SELECT * FROM Professors WHERE login_id = ? AND login_password = ?";
		pstmt = conn.prepareStatement(sql1);
		
		pstmt.setString(1, id);
		pstmt.setString(2, password);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			session.setAttribute("user_id", rs.getString("student_id"));
			session.setAttribute("name", rs.getString("name"));
			session.setAttribute("login_id", rs.getString("login_id"));
			session.setAttribute("login_password", rs.getString("login_password"));
			session.setAttribute("user_number", rs.getString("student_number"));
			session.setAttribute("role", rs.getString("role"));
			
			response.sendRedirect("index.jsp");
		}
		else{
			pstmt = conn.prepareStatement(sql2);
			
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				session.setAttribute("user_id", rs.getString("professor_id"));
				session.setAttribute("name", rs.getString("name"));
				session.setAttribute("login_id", rs.getString("login_id"));
				session.setAttribute("login_password", rs.getString("login_password"));
				session.setAttribute("user_number", rs.getString("professor_number"));
				session.setAttribute("role", rs.getString("role"));
				
				response.sendRedirect("index.jsp");
			}
			else{
				out.println("로그인에 실패했습니다. 아이디 또는 비밀번호를 확인하세요.");
			}
		}
	} catch(Exception e){
		e.printStackTrace();
		System.out.println("오류가 발생했습니다: " + e.getMessage());
	} finally{
		if(rs != null) {
			try{
				rs.close();
			}catch(SQLException e){}
		}
		if(pstmt != null) {
			try{
				pstmt.close();
			}catch(SQLException e){}
		}
		if(conn != null) {
			try{
				conn.close();
			}catch(SQLException e){}
		}
	}
	
%>