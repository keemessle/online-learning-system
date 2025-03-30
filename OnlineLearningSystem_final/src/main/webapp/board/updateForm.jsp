<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="mvc.model.BoardDTO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    BoardDTO notice = (BoardDTO) request.getAttribute("board");
    Integer numObj = (Integer) request.getAttribute("num");
    Integer pageObj = (Integer) request.getAttribute("page");
    
    HttpSession user = request.getSession();
    String username = (String) session.getAttribute("name");

    if (notice == null || numObj == null || pageObj == null) {
        out.println("<script>alert('필요한 데이터가 없습니다.'); history.back();</script>");
        return;
    }

    int num = numObj.intValue();
    int nowpage = pageObj.intValue();
    boolean isAuthor = (username != null && username.equals(notice.getName()));
%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/board.css">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/nav.css">
	<meta charset="UTF-8">
	<title>게시글 수정</title>
</head>
<body>
	<div class="container">
	    <jsp:include page="/common/nav.jsp" />
	    
	    
	    <div class="board-content">
	      	<form class="board-form" action="<c:url value="./BoardUpdateAction.do" />" method="post">
	      		<input type="hidden" name="num" value="<%=notice.getNum()%>">
	    		<input type="hidden" name="pageNum" value="<%=pageObj%>">
	    		<input type="hidden" name="name" value="<%= notice.getName() %>">
	      			
	      			
	      		<div class="card">
	      			<div class="card-header">
	      				<input type="text" name="title" class="form-control board-content-title" value="<%= notice.getTitle() %>" required>
	      			</div>
	      				
					<div class="card-body">
						<div class="board-content-date mb-2">
							<p style="margin: 0;"><strong>작성자:</strong> <%= notice.getName() %></p>
		                	<p style="margin: 0;"><strong>작성일:</strong> <%= notice.getPostdate() %></p>
						</div>
		                <div class="board-content-text">
		                	<textarea name="content" class="form-control" style="width: 100%; height: 100%; resize: none;" rows="13" required><%= notice.getContent() %></textarea>
	  					</div>
	  				</div>
	  			</div>
	  			
	  			<div class="mt-3 text-end">
					<button type="submit" class="btn modify-btn">수정 완료</button>
					<a href="<%= request.getContextPath() %>/BoardListAction.do?pageNum=<%= nowpage %>" class="btn back-btn">취소</a>
				</div>
	  		</form>
		</div>
	
		<jsp:include page="/common/footer.jsp" />
	</div>
</body>
</html>
