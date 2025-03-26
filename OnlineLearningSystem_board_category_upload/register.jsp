<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<script type="text/javascript" src="./resources/js/registerValidation.js"></script>
<title>Sign in</title>
</head>
<body>
<fmt:setLocale value='<%=request.getParameter("language") %>' />
<fmt:bundle basename="bundle.message">

<div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3"><fmt:message key="register" /></h4>
        <div class="text-end">
      	<a href="?language=ko">Korean</a> | <a href="?language=en">English</a>
      	<a href="logout.jsp" class="btn btn-dark" ><fmt:message key="go_back"></fmt:message></a>
      </div>
        <form name="newUser" action="./processRegister.jsp" class="form-horizontal" 
    	method="post">
    		<div class="mb-3 row">
    			<label class="col-sm-2"><fmt:message key="id" /></label>
    			<div class="col-sm-3">
    			<input type="text" id="id" name="id" class="form-control">
    			</div>
    		</div>
    		<div class="mb-3 row">
    			<label class="col-sm-2"><fmt:message key="passwd" /></label>
    			<div class="col-sm-3">
    			<input type="password" id="passwd" name="passwd" class="form-control">
    			</div>
    		</div>
    		<div class="mb-3 row">
    			<label class="col-sm-2"><fmt:message key="check_passwd" /></label>
    			<div class="col-sm-3">
    			<input type="password" id="check_passwd" name="check_passwd" class="form-control">
    			</div>
    		</div>
    		<div class="mb-3 row">
    			<label class="col-sm-2"><fmt:message key="name" /></label>
    			<div class="col-sm-3">
    			<input type="text" id="name" name="name" class="form-control">
    			</div>
    		</div>
    		<div class="mb-3 row">
    			<label class="col-sm-2"><fmt:message key="user_number" /></label>
    			<div class="col-sm-3">
    			<input type="text" id="user_number" name="user_number" class="form-control">
    			</div>
    		</div>
    		<div class="mb-3 row">
    			<label class="col-sm-2"><fmt:message key="email" /></label>
    			<div class="col-sm-3">
    			<input type="text" id="email" name="email" class="form-control" >
    			</div>
    		</div>
    		<div class="mb-3 row">
    			<label class="col-sm-2"><fmt:message key="phone_number" /></label>
    			<div class="col-sm-3">
    			<input type="text" id="phone_number" name="phone_number" class="form-control" placeholder="숫자만 입력해주세요">
    			</div>
    		</div>
    		<div class="mb-3 row">
    			<label class="col-sm-2"><fmt:message key="birth_date" /></label>
    			<div class="col-sm-3">
    			<input type="text" name="birth_date" id="birth_date" class="form-control" placeholder="yyyy-mm-dd">
    			</div>
    		</div>
    		<div class="mb-3 row">
    			<label class="col-sm-2"><fmt:message key="role" /></label>
    			<div class="col-sm-5">
    				<input type="radio" id="role_teacher" name="role" value="professor"> <fmt:message key="role_professor" />
    				<input type="radio" id="role_student" name="role" value="student"> <fmt:message key="role_student" />
    			</div>
    		</div>
    		<div class="mb-5 row">
    			<div class="col-sm-offset-2 col-sm-10">
    			<input type="button" class="btn btn-primary" value="<fmt:message key="button" />" onclick="CheckAddUser()">
    			</div>
    		</div>
    	</form>
      </div>
    </div>
  </div>
</fmt:bundle>
</body>
</html>