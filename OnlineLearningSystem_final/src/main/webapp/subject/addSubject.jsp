<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="/WEB-INF/dbconn.jsp" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/subject.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/nav.css">
    <title>과목 추가</title>
</head>
<body>
    <div class="container">
    <jsp:include page="/common/nav.jsp" />
    
    	<div class="subject-content">
	        <div class="subject-header">
	        	<h1 class="subject-title">과목 추가</h1>
	        </div>
	        
        	<form class="subject-form" action="processAddSubject.jsp" method="post">
            	<div class="subject-name-form" style="padding: 1em;">
                	<label for="subject_name" class="form-label">과목 이름</label>
                	<input type="text" class="form-control input-form" id="subject_name" name="subject_name" required>
            	</div> 
	            <div class="subject-credit-form" style="padding: 1em;">
	                <label for="subject_credit" class="form-label">과목 학점</label>
	                <input type="number" class="form-control input-form" id="subject_credit" name="subject_credit" min="2" max="3" required>
	            </div>
	            <div class="subject-code-form" style="padding: 1em;">
	                <label for="subject_code" class="form-label">과목 코드</label>
	                <input type="text" class="form-control input-form" id="subject_code" name="subject_code" required>
	            </div>
	            
	            <button type="submit" class="btn plus-btn">추가</button>
	        </form>
	        
	        <div class="subject-btn text-end mt-4">
	            	<a href="<%= request.getContextPath() %>/index.jsp" class="btn btn-dark back-btn">뒤로</a>
	        </div>
	    </div>
	    
        <jsp:include page="/common/footer.jsp" />
    </div>
</body>
</html>
