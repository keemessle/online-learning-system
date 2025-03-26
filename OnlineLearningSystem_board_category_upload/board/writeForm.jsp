<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="mvc.model.*" %>
 
<%@ page import="java.io.PrintWriter" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String login_id = null;
	if (session.getAttribute("login_id") != null) {
		login_id = (String) session.getAttribute("login_id");
	}
	
	int boardID = 0;
	if (request.getParameter("boardID") != null) {
		boardID = Integer.parseInt(request.getParameter("boardID"));
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>게시판</title>
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
		if (!document.newWrite.name.value) {
			alert("이름을 입력하세요.");
			return false;
		}
		if (!document.newWrite.title.value) {
			alert("제목을 입력하세요.");
			return false;
		}
		if (!document.newWrite.content.value) {
			alert("내용을 입력하세요.");
			return false;
		}
		return true;
	}
</script>
<body>
<div class="container py-4">
	<jsp:include page="../nav.jsp" />
	
	<!--  <div class="row align-items-md-stretch text-center"> -->
	  <!-- <input name="id" type="hidden" class="form-control" value="${id}"> -->
	<div class="container">
		<div class="row">
			<form method="post" encType="multipart/form-data" action="./BoardWriteAction.do?boardID=<%=boardID%>&keyValue=multipart" onsubmit="return checkForm()">
				<div class="card">
					<div class="card-header board-title">
						게시글 작성
					</div>
					<div class="card-body">
						<div class="mb-3">
							<label for="name" class="form-label">이름</label>
							<input name="name" type="text" class="form-control" id="name" placeholder="이름을 입력하세요.">
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
						<input type="hidden" name="login_id" value="<%=login_id%>">
						<input type="hidden" name="boardID" value="<%=request.getParameter("boardID")%>">
						<div class="d-flex justify-content-end">
							<input type="submit" class="btn btn-primary me-2" value="등록">
							<input type="reset" class="btn btn-secondary" value="취소">
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<jsp:include page="../footer.jsp" />
<script src="<c:url value='/resources/js/bootstrap.bundle.min.js'/>"></script>
</body>
</html>