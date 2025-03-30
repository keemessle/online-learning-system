<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="./resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/subject.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/nav.css">
    <meta charset="UTF-8">
    <title>강의 수강</title>
</head>
<body>

    <div class="container">
        <jsp:include page="/common/nav.jsp" />
        
        
        <div class="subject-content">
        	<div class="subject-header">
        		<h1 class="subject-title">수강 중인 강의</h1>
        	</div>
        
	        <table class="table table-hover table-sm table-striped subject-table">
	        	<thead>
		            <tr>
		                <td>번호</td>
		                <td>강의 제목</td>
		                <td>강의 보기</td>
		            </tr>
		        </thead>
		        <tbody>
		        	<c:forEach var="video" items="${videoList}" varStatus="status">
	            	<tr>
	                	<td><c:out value="${status.index + 1}" /></td>
	                	<td><c:out value="${video.videoTitle}" /></td>
	                	<td>
	                    	<video class="lecture-video" controls width="320" height="240" onended="updateAttendance(${studentId}, ${subjectId}, ${video.videoId})">
	                        	<source src="<c:out value="${video.videoPath}" />" type="video/mp4">
	                    	</video>
	                	</td>
	            	</tr>
	            	</c:forEach>
		        </tbody>
	        </table>


	        <div class="subject-btn text-end mt-4">
	            <a href="<%= request.getContextPath() %>/index.jsp" class="btn btn-dark back-btn">뒤로</a>
	        </div>
        </div>
        
        <jsp:include page="/common/footer.jsp" />
    </div>

    <script>
        function updateAttendance(studentId, subjectId, videoId) {
            var xhr = new XMLHttpRequest();
            xhr.open('POST', 'updateAttendance', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhr.send('studentId=' + studentId + '&subjectId=' + subjectId + '&videoId=' + videoId);
        }
    </script>
</body>
</html>
