<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.User" %>
<%@ page import="dao.Repository" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/users.css">
	<meta charset="UTF-8">
	<title>유저 목록</title>
</head>
<body>
	<%
		Repository dao = Repository.getInstance();
		ArrayList<User> userList = dao.getAllUsers();
	%>
	
	
	<div class="row align-items-md-stretch text-center">
    	<%
    		for(int i = 0; i < userList.size(); i++){
    			User user = userList.get(i);
    	%>
    	<div class="col-md-4">
	    	<div class="h-100 p-2">
	    		<h5><b><%=user.getName() %></b></h5>
	    		<p> <%=user.getPasswd() %>
	    		<br><%=user.getEmail() %>
	    		<p> <%=user.getPhoneNumber()%>
	    		<p> <%=user.getBirthDate() %>
	    		<p> <%=user.getRole() %>
	    	</div>
    	</div>
    
    <%
    	}
    %>
    </div>
</body>
</html>