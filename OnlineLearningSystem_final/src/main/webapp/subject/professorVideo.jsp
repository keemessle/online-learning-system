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
    <title>강의 관리</title>
</head>
<body>
    <div class="container">
        <jsp:include page="/common/nav.jsp" />
        
        <div class="subject-content">
	        <div class="subject-header">
	        		<h1 class="subject-title">강의 관리</h1>
	        </div>
	
	        <table class="table table-hover table-sm table-striped subject-table">
	        	<thead>
		            <tr>
		                <td>&nbsp;</td>
		                <td>비디오 제목</td>
		                <td>보기</td>
		                <td>삭제</td>
		            </tr>
		        </thead>
	
		        <tbody>
			        <c:forEach var="video" items="${videoList}" varStatus="status">
		            <tr class="video-tr">
		                <td><c:out value="${status.index + 1}" /></td>
		                <td><c:out value="${video.videoTitle}" /></td>
		                <td>
		                    <video width="320" height="240" controls>
		                        <source src="<c:out value="${video.videoPath}" />" type="video/mp4">
		                    </video>
		                </td>
		                <td>
		                    <form class="delete-form" action="${pageContext.request.contextPath}/subject/deleteVideo.jsp" method="post">
		                        <input type="hidden" name="video_id" value="${video.videoId}">
		                        <input type="hidden" name="subject_id" value="${subjectId}">
		                        <button type="submit" class="btn delete-btn">삭제</button>
		                    </form>
		                </td>
		            </tr>
		            </c:forEach>
		        </tbody>
	        </table>
	
	
	        <form class="upload-form" action="subject.dat?command=uploadVideo" method="post" enctype="multipart/form-data">
	        	<input type="hidden" name="subject_id" value="${subjectId}">
	            <input type="file" name="file" id="file" accept="video/*" required>
	            <input type="text" name="video_title" placeholder="제목" style="width: 200px; text-align: center; padding: 5px;" required>
	            <button type="submit" class="btn upload-btn">영상 업로드</button>
	       	</form>
	       	
	       	</div>

	   	<div class="subject-btn text-end mt-4">
			<a href="<%= request.getContextPath() %>/index.jsp" class="btn btn-dark back-btn">뒤로</a>
		</div>
	    
        <jsp:include page="/common/footer.jsp" />
    </div>
</body>
</html>
