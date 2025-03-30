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
	<title>게시글 상세 페이지</title>
</head>
<body>
	<div class="container">
	    <jsp:include page="/common/nav.jsp" />
	    
	    
	    <div class="board-content">
	      	<form class="board-form" name="newUpdate" action="<c:url value="./BoardUpdateAction.do" />" method="post">
	      		<input type="hidden" name="num" value="<%=notice.getNum()%>">
	    		<input type="hidden" name="pageNum" value="<%=pageObj%>">
	      			
	      		<div class="card" style="flex: 1; text-align: left;">
	      			<div class="card-header">
	      				<h3 class="board-content-title"><%=notice.getTitle()%></h3>
	      			</div>
	      				
					<div class="card-body">
						<div class="board-content-date">
							<p style="margin: 0;"><%= notice.getName() %></p>
		                	<p style="margin: 0;"><%= notice.getPostdate() %></p>
						</div>
		                <div class="board-content-text" style="white-space: pre-wrap; height: 350px;"><%= notice.getContent() %></div>
							<!--  <div class="mb-3">
								<c:if test="${not empty board.fileName}">
	        						<p>첨부파일: <a href="${pageContext.request.contextPath}/FileDownload.do?fileName=${board.fileName}">${board.fileName}</a></p>
	    						</c:if>
							</div> -->
	  				</div>
	  			</div>
	  		</form>
	  				
	  				
	      	<div class="mt-3 text-end">
	      		<button class="btn back-btn" onclick="location.href='./BoardListAction.do?pageNum=<%= nowpage %>'">목록</button>

		       	<% if (isAuthor) { %>
		        	<button class="btn modify-btn" onclick="location.href='./BoardUpdateForm.do?num=<%= num %>&pageNum=<%= nowpage %>'">수정</button>
		            <button class="btn delete-btn" onclick="if(confirm('정말 삭제하시겠습니까?')) location.href='./BoardDeleteAction.do?num=<%= num %>&pageNum=<%= nowpage %>'">삭제</button>
		        <% } %>

	        </div>
		</div>
	
		<jsp:include page="/common/footer.jsp" />
	</div>
</body>
</html>
