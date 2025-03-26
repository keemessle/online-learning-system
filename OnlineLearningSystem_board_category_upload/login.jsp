<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<div class="container">
        <h2>로그인</h2>
        <form class="form-signin" name="login" action="processLogin.jsp" method="post">
    		<div class="form-floating  mb-3 row">
      			<input type="text"  class="form-control" name="id" id = "id" required autofocus>
      			<label for="floatingInput">ID</label>      
    		</div>
    		<div class="form-floating  mb-3 row">      
     	 		<input type="password" class="form-control" name="password" id="password">
    			<label for="floatingInput">Password</label>
			 </div>
  			<button class="btn btn-secondary" type="submit">로그인</button>
  		</form>
  		<form class="form-signin" action="./register.jsp" method="post">
			<button class="btn btn-light">회원가입</button>
		</form>
    </div>
</body>
</html>