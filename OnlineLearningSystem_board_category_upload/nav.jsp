<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String name = (String) session.getAttribute("name");
	String role = (String) session.getAttribute("role");
	
	int boardID = 0; // boardID 초기화
    if (request.getParameter("boardID") != null) {
        boardID = Integer.parseInt(request.getParameter("boardID"));
    }
%>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

<nav class="navbar navbar-expand-lg navbar-light bg-light" style="align-items: center; display: flex; margin: 0 auto; flex-direction: row; justify-content: center;">
  <a class="nav-link" href="index.jsp" style="font-size: 40px; font-weight: bold; color: GREEN;"> 온라인 교육 시스템&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  
  <div class="collapse navbar-collapse" id="navbarNav" >
    <ul class="navbar-nav ml-auto ">
      <li class="nav-item">
        <a class="nav-link" href="subject.jsp" style="font-size: 25px; color: GRAY;">과목</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="lecture.jsp" style="font-size: 25px; color: GRAY;">강의</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="quiz.jsp" style="font-size: 25px; color: GRAY;">퀴즈</a>
      </li>
      <li class="nav-item dropdown">
      	 <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 25px; color: GRAY;">
             게시판
         </a>
         <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
             <a class="dropdown-item <%= (boardID == 1) ? "active" : "" %>" href="<%= request.getContextPath() %>/board/board.jsp?boardID=1">자유게시판</a>
             <a class="dropdown-item <%= (boardID == 2) ? "active" : "" %>" href="<%= request.getContextPath() %>/board/board.jsp?boardID=2">자료실</a>
             <a class="dropdown-item <%= (boardID == 3) ? "active" : "" %>" href="<%= request.getContextPath() %>/board/board.jsp?boardID=3">Q&A</a>
         </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="manual.jsp" style="font-size: 25px; color: GRAY;">매뉴얼</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#" style="font-size: 25px; color: GRAY;">출결</a>
      </li>
    </ul>
    <% // 이름을 클릭하면 개인정보란이 보이며 수정, 탈퇴 등이 가능하게 만들기
    	if(role.equals("Student")){
    %>
    	<a href="#" class="right" style="font-size: 20px; color: BLACK; text-decoration-line:none">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><%=name %>(학생)</strong>님&ensp;</a>
    <%
    	}
    	else if(role.equals("Professor")){
    %>
    	<a href="#" class="right" style="font-size: 20px; color: BLACK; text-decoration-line:none">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><%=name %>(교수)</strong>님&ensp;</a>
    <%
    	}
    %>
    <div class="form-inline my-2 my-lg-0 ml-auto" align="right">
     	<a href="logout.jsp" class="btn btn-secondary" >로그아웃</a>
       </div>
	</div>
</nav>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>