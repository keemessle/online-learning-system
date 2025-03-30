<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/login.css">
	<meta charset="UTF-8">
	<title>Login</title>
</head>
<body>

	<% if ("true".equals(request.getParameter("error"))) { %>
    <script>
        alert("로그인에 실패했습니다. 아이디 또는 비밀번호를 확인해주세요.");
    </script>
    <% } %>
    
	<div class="container">
        <h2 class="form-title">로그인</h2>
        <form class="form-box" name="login" action="processLogin.jsp" method="post">
    		<div class="mb-3">
      			<input type="text" class="form-control form-input" name="id" placeholder="아이디" required>
    		</div>
    		<div class="mb-3">      
     	 		<input type="password" class="form-control form-input" name="password" placeholder="비밀번호" required>
			</div>
			<div class="btn-box">
				<button class="btn-signin mt-3" type="submit">로그인</button>
			</div>
		</form>
			
		<div class="btn-box">
  			<a href="register.jsp" class="btn-signup mt-2">회원가입</a>
		</div>
    </div>
</body>
</html>