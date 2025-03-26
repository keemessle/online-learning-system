<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	HttpSession id = request.getSession();
	String login_id = (String) session.getAttribute("login_id");
	
	HttpSession user = request.getSession();
    String username = (String) session.getAttribute("name");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>게시글 작성 페이지</title>
<style>
    .board-title {
        font-size: 20px;
        color: GREEN;
        border: 2px solid #ddd;
        padding: 10px;
        margin-bottom: 20px;
    }
    .board-description {
        margin-bottom: 20px;
    }
    .board-table th, .board-table td {
        text-align: center;
        vertical-align: middle;
    }
    .form-label {
        font-weight: bold;
    }
</style>
</head>
<script type="text/javascript">
	function checkForm() {
		if (document.newWrite.title.value.length == 0) {
			alert("제목을 입력하세요.");
			return false;
		}
		if (document.newWrite.content.value.length == 0) {
			alert("내용을 입력하세요.");
			return false;
		}
		
		/* 취소 버튼 클릭 시 게시판 목록으로 돌아가기 */
		function goToList() {
		    location.href = "/BoardListAction.do";
		 }
	}
</script>
<body>
<div class="container py-4">
	<jsp:include page="nav.jsp" />
	  <div class="container">
		<div class="row">												
			<form method="post" name="newWrite" action="./BoardWriteAction.do" enctype="multipart/form-data" onsubmit="return checkForm()" class="w-100"> 
			<!-- <form name="newImage" action="./processUpload.jsp" class="form-horizontal" method="post" enctype="multipart/form-data" > -->
			<input type="hidden" name="login_id" value="${id}" />
			<input type="hidden" name="name" value="${username}" />
			<input type="hidden" name="login_id" value="${title}" />
			<input type="hidden" name="name" value="${content}" />
				<div class="card">
					<div class="card-header board-title">
						게시글 작성하기
					</div>
					<div class="card-body">
						<div class="mb-3">
							<label for="name" class="form-label">글쓴이</label>
							<input name="name" type="text" class="form-control" id="name" value="<%=username%>" readonly>
						</div>
						<div class="mb-3">
							<label for="title" class="form-label">제목</label>
							<input name="title" type="text" class="form-control" id="title" placeholder="제목을 입력하세요.">
						</div>
						<div class="mb-3">
							<label for="content" class="form-label">내용</label>
							<textarea name="content" class="form-control" id="content" maxlength="2048" style="height: 350px;" placeholder="내용을 입력하세요."></textarea>
						</div>
						<div class="mb-3">
							<label for="fileName" class="form-label">파일 업로드</label>
							<input type="file" name="fileName" class="form-control" id="fileName">
						</div>
						<div id="btn" class="d-grid gap-2 d-sm-flex justify-content-sm-center">
	  						<input type="submit" class="btn btn-primary btn-sm px-3 gap-3" value="등록">
	  						<!-- <input type="hidden" name="login_id">
	  						<input type="hidden" name="name">
	  						<input type="hidden" name="title">
	  						<input type="hidden" name="content">  -->
	  						<input type="button" class="btn btn-outline-secondary btn-sm px-3" value="취소" onclick="goToList()">
                		</div>
					</div>
				</div>  	
	  		</form>
	  	</div>
	 </div>
</div>
<jsp:include page="footer.jsp" />
<script src="<c:url value='/resources/js/bootstrap.bundle.min.js'/>"></script>
</body>
</html>