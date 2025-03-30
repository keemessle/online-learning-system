<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/bootstrap.min.css" />
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/register.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
	<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/registerValidation.js"></script>
	<title>SIGN UP</title>
</head>
<body>
	<fmt:setLocale value='<%=request.getParameter("language") %>' />
	<fmt:bundle basename="bundle.message">

	<div class="container">
      		<div class="input-form">
        		<h2 class="form-title"><fmt:message key="register" /></h2>
        		
        		
        		<div class="text-end">
      				<a href="?language=ko">Korean</a> | <a href="?language=en">English</a>
      			</div>
      			
      			
        		<form name="newUser" action="processRegister.jsp" method="post">
    				<div class="register-form">
    					<input class="form-control" type="text" id="id" name="id" placeholder="<fmt:message key='id' />">
    				</div>
    				<div class="register-form">
    					<input class="form-control" type="password" id="passwd" name="passwd" placeholder="<fmt:message key="passwd" />">
    				</div>
    				<div class="register-form">
    					<input class="form-control" type="password" id="check_passwd" name="check_passwd" placeholder="<fmt:message key="check_passwd" />">
    				</div>
    				<div class="register-form">
    					<input  class="form-control" type="text" id="name" name="name" placeholder="<fmt:message key="name" />">
    				</div>
    				<div class="register-form">
    					<input class="form-control" type="text" id="user_number" name="user_number" placeholder="<fmt:message key="user_number" />">
    				</div>
    				<div class="register-form">
    					<input class="form-control" type="text" id="email" name="email" placeholder="<fmt:message key="email" />">
    				</div>
    				<div class="register-form">
    					<input class="form-control" type="text" id="phone_number" name="phone_number" placeholder="<fmt:message key="phone_number" />">
    				</div>
    				<div class="register-form">
    					<input class="form-control" type="date" name="birth_date" id="birth_date" placeholder="<fmt:message key="birth_date" />">
    				</div>
    				<div class="register-form radio-box-form">
    					<input type="radio" id="role_teacher" name="role" value="Professor"> <fmt:message key="role_professor" />
    					<input type="radio" id="role_student" name="role" value="Student"> <fmt:message key="role_student" />
    				</div>
    				<div class="btn-box-form">
    					<button type="button" class="btn-confirm" onclick="CheckAddUser()"><fmt:message key="button" /></button>
    					<a href="logout.jsp" class="btn-cancel"><fmt:message key="go_back"></fmt:message></a>
    				</div>
    			</form>
      		</div>
    	</div>
	</fmt:bundle>
</body>
</html>