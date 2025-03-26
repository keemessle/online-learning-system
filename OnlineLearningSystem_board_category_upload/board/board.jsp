<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="mvc.model.BoardDAO" %>
<%@ page import="mvc.model.BoardDTO" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.lang.Math" %>
<%
	String id = (String) session.getAttribute("id");
	List boardList = (List) request.getAttribute("boardlist");
	if (boardList == null) {
        boardList = new ArrayList();
    }
	
	Integer totalRecordObj = (Integer) request.getAttribute("total_record");
    int total_record = (totalRecordObj != null) ? totalRecordObj.intValue() : 0;
    
    Integer pageNumObj = (Integer) request.getAttribute("pageNum");
    int pageNum = (pageNumObj != null) ? pageNumObj.intValue() : 1;
    
    Integer totalPageObj = (Integer) request.getAttribute("total_page");
    int total_page = (totalPageObj != null) ? totalPageObj.intValue() : 1;

	
	int boardID = 0;
	if (request.getParameter("boardID") != null) {
		boardID = Integer.parseInt(request.getParameter("boardID"));
	}
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'/>">
<meta charset="UTF-8">
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
		<jsp:include page="../nav.jsp" />
		
		<div class="container">
		  <div class="row">
		   <form action="<c:url value="./BoardListAction.do" />" method="post" class="w-100">	
			 	<div class="container py-4">
    				<div class="panel panel-default">
        				<h1 class="text-center fw-bold board-title">
  							<% if (boardID == 1) { %>
									자유게시판
							<% } else if (boardID == 2) { %>
									자료실
							<% } else if (boardID == 3) { %>
									Q & A
							<% } %>
						</h1>
						<p class="text-center board-description">
							<% if (boardID == 1) { %>
								자유롭게 글을 쓰는 공간입니다. 서로 존중하며 글과 댓글을 남깁시다!<br><br>
							<% } else if (boardID == 2) { %>
								강의 교안 및 다양한 자료를 공유하는 공간입니다. 과제 제출도 가능합니다 :)<br><br>
							<% } else if (boardID == 3) { %>
								궁금한 점을 묻고 답하는 공간입니다. 다양한 질문들을 올려주세요.<br><br>
							<% } %>
						</p>  				
    				</div>
				</div>
				<div>
				<table class="table table-striped board-table">
					<thead>
						<tr>
							<th style="background-color: #eeeeee;">글 번호</th>
							<th style="background-color: #eeeeee;">제목</th>
							<th style="background-color: #eeeeee;">작성자</th>
							<th style="background-color: #eeeeee;">작성일</th>
							<th style="background-color: #eeeeee;">조회수</th>
							<!--  th style="background-color: #eeeeee; text-align: center;">게시판</th  -->
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
	             </div>
	             <div class="text-center">
	             	<c:set var="pageNum" value="<%=pageNum%>" />
	             	<c:forEach var="i" begin="1" end="<%=total_page%>">
	             		<a href="<c:url value='./BoardListAction.do?pageNum=${i}' /> ">
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
	             	<a href="writeForm.jsp?boardID=<%=boardID%>" onclick="checkForm(); return false;" class="btn btn-primary">&laquo;글쓰기</a>
	             	<!-- <a href="<c:url value='/BoardWriteForm.do' />" class="btn btn-primary pull-right">&laquo;글쓰기</a> -->
	             </div>
	             <div class="py-3 text-start">
	             	<select name="items" class="form-select d-inline-block w-auto">
	             		<option value="title">제목</option>
	             		<option value="content">본문</option>
	             		<option value="name">작성자</option>
	             	</select> 
	             	<input name="text" type="text" class="form-control d-inline-block w-auto"/> 
	             	<input type="submit" id="btnAdd" class="btn btn-primary " value="검색 " />
	             </div>
	          </form>
		  </div>
		</div>
		<%@ include file="../footer.jsp" %>
	</div>
	<script src="<c:url value='/resources/js/bootstrap.bundle.min.js'/>"></script>
</body>
</html>