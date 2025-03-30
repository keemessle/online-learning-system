<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/updateInfo.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/nav.css">
	<meta charset="UTF-8">
	<script type="text/javascript" src="./resources/js/updateValidation.js"></script>
	<title>정보 수정</title>
	<%
	String name = (String) session.getAttribute("name");
	String userId = (String) session.getAttribute("user_number");
	String role = (String) session.getAttribute("role");
	%>
</head>
<body>

	<div class="container">
		<jsp:include page="/common/nav.jsp" />
      	
      	<div class="info-form">
      		<div class="info-header">
      			<h1 class="info-title">정보 수정</h1>
      		</div>
        

	        <form name="deleteForm" action="processDelete.jsp" class="form-horizontal clear-form" method="post">
	    		<input type="hidden" id="role" name="role" value="<%=role %>" >
	    		<input type="hidden" id="user_number" name="user_number" value="<%=userId %>" >
	    		<input type="button" class="btn clear-btn" value="탈퇴" onclick="CheckDelete()">
	    	</form>
      	
      	
      		<div class="update-content">
      			<form name="updateInfo" action="processUpdateInfo.jsp" class="form-horizontal update-form" method="post">
		    		<div class="mb-3 row">
		    			<label class="col-sm-3 col-form-label form-label">아이디</label>
		    			<div class="col-sm-8">
		    				<input type="text" id="id" name="id" class="form-control">
		    			</div>
		    		</div>
	    		
		    		<div class="mb-3 row">
		    			<label class="col-sm-3 col-form-label form-label">비밀번호</label>
		    			<div class="col-sm-8">
		    				<input type="password" id="passwd" name="passwd" class="form-control">
		    			</div>
		    		</div>
	    		
		    		<div class="mb-3 row">
		    			<label class="col-sm-3 col-form-label form-label">비밀번호 확인</label>
		    			<div class="col-sm-8">
		    				<input type="password" id="check_passwd" name="check_passwd" class="form-control">
		    			</div>
		    		</div>
	    		
		    		<div class="mb-3 row">
		    			<label class="col-sm-3 col-form-label form-label">이름</label>
		    			<div class="col-sm-8">
		    				<input type="text" id="name" name="name" value="<%= name %>" class="form-control" readonly>
		    			</div>
		    		</div>
	    		
		    		<div class="mb-3 row">
		    			<label class="col-sm-3 col-form-label form-label">학번</label>
		    			<div class="col-sm-8">
		    				<input type="text" id="user_number" name="user_number" value="<%=userId %>" class="form-control" readonly>
		    			</div>
		    		</div>
	    		
		    		<div class="mb-3 row">
		    			<label class="col-sm-3 col-form-label form-label">이메일</label>
		    			<div class="col-sm-8">
		    				<input type="text" id="email" name="email" class="form-control" >
		    			</div>
		    		</div>
	    		
		    		<div class="mb-3 row">
		    			<label class="col-sm-3 col-form-label form-label">전화번호</label>
		    			<div class="col-sm-8">
		    				<input type="text" id="phone_number" name="phone_number" class="form-control" placeholder="숫자만 입력해주세요">
		    			</div>
		    		</div>
	    		
		    		<div class="mb-3 row">
		    			<label class="col-sm-3 col-form-label form-label">생년월일</label>
		    			<div class="col-sm-8">
		    				<input type="text" name="birth_date" id="birth_date" class="form-control" placeholder="yyyy-mm-dd">
		    			</div>
		    		</div>
	    		
		    		<div class="row">
		    			<label class="col-sm-3 col-form-label form-label">역할</label>
		    			<div class="col-sm-3 d-flex align-items-center">
			    			<%
			    				if (role.equals("Professor")) {
			    			%>
			    				<input type="radio" id="role_teacher" name="role" value="Professor" style="margin-right: 2px;" checked readonly> 교수
			    				<input type="radio" id="role_student" name="role" value="Student" style="margin-left: 15px; margin-right: 2px;" readonly> 학생
			    				
			   				<%
			    				} else if (role.equals("Student")) {
			   				%>
			   					<input type="radio" id="role_teacher" name="role" value="Professor" style="margin-right: 2px;" readonly> 교수
			    				<input type="radio" id="role_student" name="role" value="Student" style="margin-left: 15px; margin-right: 2px;" checked readonly> 학생
			    			<%
			    				}
			    			%>
		    			</div>
	    			</div>
	    			
	    			
		    		<div class="form-actions">
		    			<input type="button" class="btn confirm-btn" value="확인" onclick="CheckUpdate()">
		    		</div>
	    		</form>
      		</div>
		</div>
      	
    	<jsp:include page="/common/footer.jsp" />
    </div>
    
    <script>
  		function CheckDelete() {
  			if(confirm("정말로 탈퇴하시겠습니까?")){
  				document.deleteForm.submit();
  			}
  			return false;
  	}
	</script>
</body>
</html>