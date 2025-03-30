<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ include file="/WEB-INF/dbconn.jsp" %>
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
	
	try {
		if (role.equals("Professor")) {
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
		else if (role.equals("Student")) {
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
		
		if (count > 0) {
		%>
			<script>
				alert("회원가입 성공!");
				location.href = "login.jsp"
;			</script>
		<%
		} else {
		%>
			<script>
				alert("회원가입 실패!");
				history.back();
			</script>
		<%
		}
	
	} catch (Exception e) {
		e.printStackTrace();
%>
	    <script>
	        alert("알 수 없는 오류가 발생했습니다. 관리자에게 문의하세요.");
	        history.back();
	    </script>
<%

	} finally {
		if (pstmt != null) {
			try{
				pstmt.close();
			} catch (SQLException e) {}
		}
		if (conn != null) {
			try{
				conn.close();
			} catch(SQLException e){}
		}
	
	}	

%>