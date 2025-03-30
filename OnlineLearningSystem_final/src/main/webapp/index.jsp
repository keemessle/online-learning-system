<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.util.Date" %>
<%
	String login_id = (String) session.getAttribute("login_id");
	String login_password = (String) session.getAttribute("login_password");
	String user_number = (String) session.getAttribute("user_number");
%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/index.css">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/nav.css">
	<meta charset="UTF-8">
	<title>Index</title>
</head>
<body>
 	<div class="container">
	 	<%@ include file="common/nav.jsp"%>

    		<div class="greeting-content">
    		
        		<h1>Online Learning System</h1>
    
    			<h3>Welcome to OnlineLearningSystem</h3> 
    			
    			<div class="current-time">
    				<%
	          			response.setIntHeader("Refresh", 10);
	          			Date day=new java.util.Date();
	          			String am_pm;
	          			int hour = day.getHours();
	          			int minute = day.getMinutes();
	          			int second = day.getSeconds();
	          			if (hour / 12 == 0) {
	          				am_pm="AM";
	          			}
	          			else {
	          				am_pm="PM";
	          				hour = hour - 12;
	          			}
	          			String CT = hour + ":" + minute + ":" + second + " " + am_pm;
	          			out.println("현재 접속 시각: " + CT + "\n");
          			%>
    			</div>	        
      		</div>    
    
    
    		<%@ include file="common/footer.jsp"%>
  	</div>
</body>
</html>