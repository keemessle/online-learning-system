<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Lecture</title>
</head>
<body>
	<div class="container py-4" style="text-align: right;">
		<%@ include file="nav.jsp"%>
		<%
			if(role.equals("Professor"))
				response.sendRedirect("lecture_professor.jsp");
			else if(role.equals("Student"))
				response.sendRedirect("lecture_student.jsp");
			else{
				System.out.println("Redirect error");
				response.sendRedirect("index.jsp");
			}	
		%>
		<%@ include file="footer.jsp" %>
	</div>
</body>
</html>