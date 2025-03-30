<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="/WEB-INF/dbconn.jsp" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/subject.css">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/nav.css">
	<title>과목 신청</title>
</head>
<body>
    <div class="container">
    <jsp:include page="/common/nav.jsp" />
    
    	
    	 <div class="subject-content">
	        	<div class="subject-header">   
	        		<h1 class="subject-title">과목 신청</h1>
	        		<p class="subject-request-decscription">
	        			수강을 원하시는 과목을 선택하여 신청해주시기 바랍니다.
	        		</p>
	        	</div>
        	
        	
            	<form class="subject-form" action="processRegisterSubject.jsp" method="post">
            		<label for="subject_id" class="subject-label">과목 선택</label>
	                <select class="subject-select text-center" id="subject_id" name="subject_id" required>
	                <%
	                	// subjects 테이블에서 과목 목록 가져오기
	                    Statement stmt = conn.createStatement();
	                    ResultSet rs = stmt.executeQuery("SELECT subject_id, subject_name FROM Subjects");
	                    while (rs.next()) {
	                    	int subjectId = rs.getInt("subject_id");
	                        String subjectName = rs.getString("subject_name");
	                %>
	                <option value="<%=subjectId%>"><%=subjectName%></option>
	                <%
	                    }
	                    rs.close();
	                    stmt.close();
	                %>
	               	</select>
	               	
	               	<div class="subject-btn text-center mt-4">
            			<button type="submit" class="btn select-btn">신청</button>
            		</div>
        		</form>
        		
        		<div class="subject-btn text-end mt-4">
	            	<a href="<%= request.getContextPath() %>/index.jsp" class="btn btn-dark back-btn">뒤로</a>
	        	</div>
        	</div>	
        
        	<jsp:include page="/common/footer.jsp" />
    </div>
</body>
</html>
