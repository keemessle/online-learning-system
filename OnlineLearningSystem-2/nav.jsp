<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page session="true" %>
<%
	int boardID = 0;
	String name = (String) session.getAttribute("name");
	String role = (String) session.getAttribute("role");
%>
<nav class="navbar navbar-expand-lg navbar-light bg-light" style="align-items: center; display: flex; margin: 0 auto; flex-direction: row; justify-content: center;">
  <a class="nav-link" href="index.jsp" style="font-size: 35px; color: GREEN;"> 온라인 교육 시스템&nbsp;&nbsp;&nbsp;</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav" >
    <ul class="navbar-nav ml-auto ">
      <li class="nav-item">
        <a class="nav-link" href="subject.dat" name="command" value="viewVideos" style="font-size: 30px; color: GRAY;">과목/강의&nbsp;</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="board.jsp?pageNum=1" style="font-size: 25px; color: GRAY;">게시판</a>
      </li>
      <li>
      <li class="nav-item">
        <a class="nav-link" href="managementSubject.jsp" style="font-size: 30px; color: GRAY;">과목 관리&nbsp;</a>
      </li>
      
      <li class="nav-item">
      <%
      	if(role.equals("Student")){
      %>
        <a class="nav-link" href="studentAttendance.jsp" style="font-size: 30px; color: GRAY;">출결&nbsp;</a>
      <%
      	} else if(role.equals("Professor")){
      %>
      	<a class="nav-link" href="professorAttendance.jsp" style="font-size: 30px; color: GRAY;">출결&nbsp;</a>
      <%
      	}
      %>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="updateInfo.jsp" style="font-size: 30px; color: GRAY;">정보수정</a>
      </li>
    </ul>
    <% 
    	if(role.equals("Student")){
    %>
    	<a class="right" style="font-size: 20px; color: BLACK; text-decoration-line:none">&nbsp;&nbsp;&nbsp;&nbsp;
    	<strong><%=name %>(학생)</strong>님&ensp;</a>
    <%
    	}
    	else if(role.equals("Professor")){
    %>
    	<a class="right" style="font-size: 20px; color: BLACK; text-decoration-line:none">&nbsp;&nbsp;&nbsp;&nbsp;
    	<strong><%=name %>(교수)</strong>님&ensp;</a>
    <%
    	}
    %>
    <div class="form-inline my-2 my-lg-0 ml-auto">
     	<a href="logout.jsp" class="btn btn-secondary" style="text-align: right;">로그아웃</a>
       </div>
	</div>
</nav>