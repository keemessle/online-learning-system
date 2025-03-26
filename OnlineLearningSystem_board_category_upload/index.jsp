<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
	//String name = (String) session.getAttribute("name");
	String login_id = (String) session.getAttribute("login_id");
	String login_password = (String) session.getAttribute("login_password");
	String user_number = (String) session.getAttribute("user_number");
	//String role = (String) session.getAttribute("role");
	/*
	if (name == null || role == null) {
	    response.sendRedirect("login.jsp");
	}
	*/
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>index</title>
</head>
<body>
 	<div class="container py-4" style="text-align: right;">
	  <%@ include file="nav.jsp"%>
      <%! String greeting="Online Learning System";
		  String tagline="Welcome to OnlineLearningSystem"; %>
      <div class="p-5 mb-4 bg-body-tertiary rounded-3 text-center">
      <div class="container-fluid py-5 text-center">
        <h1 class="display-5 fw-bold"><%=greeting%></h1>
        <!-- 
        <p class="col-md-8 fs-4 text-center"></p>      
         -->
      </div>
      </div>
      <%@ page import="java.util.Date" %>
      <div class="row align-items-md-stretch text-center">
      <div class="col-md-12">
        <div class="h-100 p-5">
          <h3><%=tagline%></h3> 
          	<%
          	 	response.setIntHeader("Refresh", 10);
          		Date day=new java.util.Date();
          		String am_pm;
          		int hour = day.getHours();
          		int minute = day.getMinutes();
          		int second = day.getSeconds();
          		if(hour / 12 == 0){
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
      </div> 
      <%@ include file="footer.jsp"%>
    </div>
</body>
</html>