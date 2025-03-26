<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>게시판 목록 페이지</title>
<style>
    .board-title {
        font-size: 20px;
        color: GREEN;
        border: 2px solid #ddd;
        padding: 10px;
        margin-bottom: 20px;
    }
    .board-description {
        margin-bottom: 5px;
    }
    .board-table th, .board-table td {
        text-align: center;
        vertical-align: middle;
    }
</style>
</head>
<body>
<div class="container py-4">
	<jsp:include page="nav.jsp" />
		
	<div class="container">
		<div class="row">
			<form action="<c:url value="./BoardListAction.do" />" method="post" class="w-100">
				<div class="container py-4">
    		  		<div class="panel panel-default">
        				<h2 class="text-left fw-bold bold-title">
        					자유게시판<br>
        				</h2>
        				<p class="text-left board-description">
        					자유롭게 글을 쓰는 공간입니다. 서로 존중하며 글과 댓글을 남깁시다!<br>
        				</p>
    				</div>
			  	</div>
			  	<table class="table table-striped board-table">
			    	<thead>
				    	<tr>
					  		<th style="background-color: #eeeeee; text-align: center;">글 번호</th>
							<th style="background-color: #eeeeee; text-align: center;">제목</th>
							<th style="background-color: #eeeeee; text-align: center;">작성자</th>
							<th style="background-color: #eeeeee; text-align: center;">작성일</th>
							<th style="background-color: #eeeeee; text-align: center;">조회수</th>
					  	</tr>
					  	<% 
						 	for (int j=0; j<boardList.size(); j++) {
								BoardDTO notice = (BoardDTO) boardList.get(j);
					  	%>
					  	<tr>
					    	<td><%=notice.getNum() %></td>
							<td><a href="./BoardViewAction.do?num=<%=notice.getNum()%>&pageNum=<%=pageNum%>"><%=notice.getTitle()%></a></td>
							<td><%=notice.getName() %></td>
							<td><%=notice.getPostdate() %></td>
							<td><%=notice.getHit() %></td>
					  	</tr>
					  	<%
						  	}
					  	%>
					</thead>
	  			</table>
	            <div align="center">
	             	<c:set var="pageNum" value="<%=pageNum%>" />
	             	<c:forEach var="i" begin="1" end="<%=total_page%>">
	             		<a href="<c:url value="./BoardListAction.do?pageNum=${i}" /> ">
	             			<c:choose>
	             				<c:when test="${pageNum==i}">
	             				 	<font color='4C5317'><b>[${i}]</b></font>
	             				</c:when>
	             				<c:otherwise>
	             					<font color='4C5317'>[${i}]</font>
	             				</c:otherwise>
	             			</c:choose>
	             		</a>
	              	</c:forEach>
	            </div>
	            <div class="py-3" align="right">
	             	<a href="<c:url value='/BoardWriteForm.do' />" class="btn btn-primary pull-right">&laquo;글쓰기</a>
	            </div>
	            <div align="left">
	             	<select name="items" class="txt">
	             		<option value="title">제목</option>
	             		<option value="content">본문</option>
	             		<option value="name">작성자</option>
	             	</select> <input name="text" type="text" /> <input type="submit" id="btnAdd" class="btn btn-primary " value="검색 " />
	             </div>
	          </form>
		  </div>
	</div>
</div>
<%@ include file="footer.jsp" %>
<script src="<c:url value='/resources/js/bootstrap.bundle.min.js'/>"></script>
</body>
</html>