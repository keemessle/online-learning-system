<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<script type="text/javascript" src="./resources/js/updateValidation.js"></script>
<title>Sign in</title>
</head>
<body>
<%
	//String name = (String) session.getAttribute("name");
	String userId = (String) session.getAttribute("user_number");
	//String role = (String) session.getAttribute("role");
%>
<div class="container py-4" style="text-align: right;">
		<%@ include file="nav.jsp"%>
</div>
<div class="container" style="margin-top: 40px;">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">회원정보 수정</h4>
        <div class="text-end">
        <form name="deleteForm" action="./processDelete.jsp" class="form-horizontal" method="post">
    		<input type="hidden" id="role" name="role" value="<%=role %>" >
    		<input type="hidden" id="user_number" name="user_number" value="<%=userId %>" >
    		<input type="button" class="btn btn-danger" value="탈퇴" onclick="CheckDelete()">
    	</form>
      	</div>
        <form name="updateInfo" action="./processUpdateInfo.jsp" class="form-horizontal" 
    	method="post">
    		<div class="mb-3 row">
    			<label class="col-sm-2">아이디</label>
    			<div class="col-sm-3">
    			<input type="text" id="id" name="id" class="form-control">
    			</div>
    		</div>
    		<div class="mb-3 row">
    			<label class="col-sm-2">비밀번호</label>
    			<div class="col-sm-3">
    			<input type="password" id="passwd" name="passwd" class="form-control">
    			</div>
    		</div>
    		<div class="mb-3 row">
    			<label class="col-sm-2">비밀번호 확인</label>
    			<div class="col-sm-3">
    			<input type="password" id="check_passwd" name="check_passwd" class="form-control">
    			</div>
    		</div>
    		<div class="mb-3 row">
    			<label class="col-sm-2">이름</label>
    			<div class="col-sm-3">
    			<input type="text" id="name" name="name" value="<%=name %>" class="form-control" readonly>
    			</div>
    		</div>
    		<div class="mb-3 row">
    			<label class="col-sm-2">학번</label>
    			<div class="col-sm-3">
    			<input type="text" id="user_number" name="user_number" value="<%=userId %>"class="form-control" readonly>
    			</div>
    		</div>
    		<div class="mb-3 row">
    			<label class="col-sm-2">이메일</label>
    			<div class="col-sm-3">
    			<input type="text" id="email" name="email" class="form-control" >
    			</div>
    		</div>
    		<div class="mb-3 row">
    			<label class="col-sm-2">전화번호</label>
    			<div class="col-sm-3">
    			<input type="text" id="phone_number" name="phone_number" class="form-control" placeholder="숫자만 입력해주세요">
    			</div>
    		</div>
    		<div class="mb-3 row">
    			<label class="col-sm-2">생년월일</label>
    			<div class="col-sm-3">
    			<input type="text" name="birth_date" id="birth_date" class="form-control" placeholder="yyyy-mm-dd">
    			</div>
    		</div>
    		<div class="mb-3 row">
    			<label class="col-sm-2">역할</label>
    			<div class="col-sm-5">
    			<%
    				if(role.equals("Professor")){
    			%>
    				<input type="radio" id="role_teacher" name="role" value="Professor" checked readonly> 교수
    				<input type="radio" id="role_student" name="role" value="Student" readonly> 학생
    				
   				<%
    				}else if(role.equals("Student")){
   				%>
   					<input type="radio" id="role_teacher" name="role" value="Professor" readonly> 교수
    				<input type="radio" id="role_student" name="role" value="Student" checked readonly> 학생
    			<%
    				}
    			%>
    			</div>
    		</div>
    		<div class="mb-5 row">
    			<div class="col-sm-offset-2 col-sm-10">
    			<input type="button" class="btn btn-primary" value="확인" onclick="CheckUpdate()">
    			</div>
    		</div>
    	</form>
      </div>
    </div>
  </div>
  <script>
  	function CheckDelete() {
  		if(confirm("정말로 탈퇴하시겠씁니까?")){
  			document.deleteForm.submit();
  		}
  		return false;
  	}
  </script>
</body>
</html>