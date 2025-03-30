<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="mvc.model.BoardDTO" %>
<%
	String login_id = (String) session.getAttribute("login_id");
	List boardList = (List) request.getAttribute("boardlist");
	if (boardList == null) {
        boardList = new ArrayList<>();
    }
    
	Integer totalRecordObj = (Integer) request.getAttribute("total_record");
    int total_record = (totalRecordObj != null) ? totalRecordObj.intValue() : 0;
    
    Integer pageNumObj = (Integer) request.getAttribute("pageNum");
    int pageNum = (pageNumObj != null) ? pageNumObj.intValue() : 1;
    
    Integer totalPageObj = (Integer) request.getAttribute("total_page");
    int total_page = (totalPageObj != null) ? totalPageObj.intValue() : 1;

%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/board.css">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/nav.css">
	<meta charset="UTF-8">
	<title>게시판</title>
</head>
<body>
<div class="container">
	<jsp:include page="/common/nav.jsp" />
		
		
	<div class="board-content">
		<form class="board-form" action="<c:url value="./BoardListAction.do" />" method="post">
			<div class="board-header">
        		<h1 class="board-title">자유게시판<br></h1>
        			<p class="board-description">
        				자유롭게 글을 쓰는 공간입니다. 서로 존중하며 글과 댓글을 남깁시다!<br>
        			</p>
    		</div>
    		
    		
			<table class="table table-striped board-table">
			    <thead>
				    <tr>
						<td style="width: 10%; padding: 3px;">글 번호</td>
						<td style="width: 40%; padding: 3px;">제목</td>
						<td style="width: 15%; padding: 3px;">작성자</td>
						<td style="width: 20%; padding: 3px;">작성일</td>
						<td style="width: 10%; padding: 3px;">조회수</td>
					</tr>
				</thead>
				<tbody>
				<% 
					for (int j=0; j<boardList.size(); j++) {
					BoardDTO notice = (BoardDTO) boardList.get(j);
				%>
					<tr>
					   	<td><%=notice.getNum() %></td>
						<td>
							<a href="<%= request.getContextPath() %>/BoardViewAction.do?num=<%=notice.getNum()%>&pageNum=<%=pageNum%>" 
								style="text-decoration: none; font-weight: bold; color: #000;">
								<%= notice.getTitle() %>
							</a>
						</td>
						<td><%=notice.getName() %></td>
						<td><%=notice.getPostdate() %></td>
						<td><%=notice.getHit() %></td>
					</tr>
				<% } %>
				</tbody>
	  		</table>
	  			
	  			
	        <div class="board-page">
	             <c:set var="pageNum" value="<%=pageNum%>" />
	             <c:forEach var="i" begin="1" end="<%=total_page%>">
	             	<a href="<c:url value='./BoardListAction.do?pageNum=${i}' />" class="page-link">
	             		<c:choose>
	             			<c:when test="${pageNum == i}">
	             				 <strong class="current-page">[${i}]</strong>
	             			</c:when>
	             			<c:otherwise>
	             				<span class="other-page">[${i}]</span>
	             			</c:otherwise>
	             		</c:choose>
	             	</a>
	             </c:forEach>
	        </div>
	            
	            
	        <div class="board-write-btn">
	        	<a href="<c:url value='/BoardWriteForm.do' />" class="btn write-btn">&laquo;글쓰기</a>
	        </div>
	            
	            
	        <div class="board-search">
	             <select name="items" class="form-select d-inline w-auto">
	             	<option value="title">제목</option>
	             	<option value="content">본문</option>
	             	<option value="name">작성자</option>
	             </select> 
	             <input name="text" type="text" class="form-control d-inline w-auto"/> 
	             <input type="submit" class="btn search-btn" value="검색 "/>
	        </div>
	    </form>
	</div>
	
	<%@ include file="/common/footer.jsp" %>
</div>

<script src="<c:url value='/resources/js/bootstrap.bundle.min.js'/>"></script>
</body>
</html>