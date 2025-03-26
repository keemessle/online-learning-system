<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="mvc.model.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.PrintWriter" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<body>
	<%
		//String name = (String) session.getAttribute("name");
    	//String role = (String) session.getAttribute("role");
    	
    	String login_id = (String) session.getAttribute("login_id");
        if (login_id == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int boardID = 0;
        if (request.getParameter("boardID") != null) {
            boardID = Integer.parseInt(request.getParameter("boardID"));
        }

        int num = 0;
        if (request.getParameter("num") != null) {
            num = Integer.parseInt(request.getParameter("num"));
        }

        BoardDAO boardDAO = BoardDAO.getInstance();
        BoardDTO board = boardDAO.getBoardByNum(num, 1);
        if (board == null || !login_id.equals(board.getLogin_id())) {
            response.sendRedirect("board.jsp");
            return;
        }
	
	%>
	<div class="container py-4">
	<jsp:include page="../nav.jsp" />
	<div class="container">
		<div class="row">
			<form method="post" encType="multipart/form-data" action="updateAction.jsp?num=<%= num %>&boardID=<%= boardID %>" onsubmit="return checkForm()" class="w-100">
				<div class="card">
					<div class="card-header board-title">
						게시글 수정
					</div>
					<div class="card-body">
						<div class="mb-3">
							<label for="name" class="form-label">이름</label>
							<input name="name" type="text" class="form-control" id="name" value="<%= board.getName() %>">
						</div>
						<div class="mb-3">
							<label for="title" class="form-label">제목</label>
							<input name="title" type="text" class="form-control" id="title" value="<%= board.getTitle() %>">
						</div>
						<div class="mb-3">
							<label for="content" class="form-label">내용</label>
							<textarea name="content" class="form-control" id="content" maxlength="2048" style="height: 350px;"><%= board.getContent() %></textarea>
						</div>
						<div class="mb-3">
							<label for="fileName" class="form-label">파일 업로드</label>
							<input type="file" name="fileName" class="form-control" id="fileName">
						</div>
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
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>