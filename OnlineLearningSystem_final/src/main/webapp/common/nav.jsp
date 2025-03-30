<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page session="true" %>
<%
	int boardID = 0;
	String name = (String) session.getAttribute("name");
	String role = (String) session.getAttribute("role");
%>

<nav class="navbar navbar-expand-md navbar-light custom-navbar">
	<div class="container-fluid">
		<a class="nav-link logo-text" href="<%= request.getContextPath() %>/index.jsp"> 온라인 교육 시스템&nbsp;&nbsp;&nbsp;</a>
  	
  		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    		<span class="navbar-toggler-icon"></span>
  		</button>
  	
  		<div class="collapse navbar-collapse justify-content-between" id="navbarNav" >
    		<ul class="navbar-nav justify-content-around">
      			<li class="nav-item"><a class="nav-link nav-menu" href="<%= request.getContextPath() %>/subject.dat?command=viewVideos&subject_id=1" name="command" value="viewVideos">과목/강의&nbsp;</a></li>
      			<li class="nav-item"><a class="nav-link nav-menu" href="<%= request.getContextPath() %>/BoardListAction.do?pageNum=1">게시판</a></li>
      			<li class="nav-item"><a class="nav-link nav-menu" href="<%= request.getContextPath() %>/subject/managementSubject.jsp">과목 관리&nbsp;</a></li>
      			<li class="nav-item">
      				<%	if ("Student".equals(role)) { %>
        			<a class="nav-link nav-menu" href="<%= request.getContextPath() %>/attendance/studentAttendance.jsp">출결&nbsp;</a>
      				<%	} else if ("Professor".equals(role)) { %>
      				<a class="nav-link nav-menu" href="<%= request.getContextPath() %>/attendance/professorAttendance.jsp">출결&nbsp;</a>
      				<%	} %>
      			</li>
       			<li class="nav-item">
        			<a class="nav-link nav-menu" href="<%= request.getContextPath() %>/user/updateInfo.jsp">정보수정</a>
     			</li> 
    		</ul>
    	
    		
    		<div class="d-flex align-items-center">
    			<% if (role != null && name != null) { %>
    			<span class="me-3 user-info fw-bold">
    				<%=name %><%= "Student".equals(role) ? "(학생)" : "(교수)" %>님
    			</span>
    			<%	} %>
    			<a href="<%= request.getContextPath() %>/user/logout.jsp" class="btn btn-secondary logout-btn">로그아웃</a>
    		</div>
   		</div>
	</div>
</nav>