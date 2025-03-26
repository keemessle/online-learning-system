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
		<form action="upload.jsp" method="post" enctype="multipart/form-data">
		    <input type="file" name="videoFile" accept="video/*">
		    <input type="submit" value="업로드">
		</form>
		<!--
		<%-- 업로드된 동영상 재생 --%>
		<video width="320" height="240" controls>
		    <source src="uploaded_videos/my_video.mp4" type="video/mp4">
		</video>
		 -->
		<%@ include file="footer.jsp" %>
	</div>
</body>
</html>