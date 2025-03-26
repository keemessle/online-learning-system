<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="./resources/css/bootstrap.min.css">
    <meta charset="UTF-8">
    <title>강의 수강</title>
</head>
<body>
    <div class="container py-4">
        <jsp:include page="nav.jsp" />
        <div style="margin-top: 40px;">
            <h1 style="font-size: 40px; text-align: center;">강의 보기</h1>
        </div>
        <div style="margin-top: 40px;"></div>
        
        <table class="table table-hover table-sm table-striped" style="text-align: center;">
            <tr class="text-left" style="font-size: 30px; text-align: center;">
                <td>번호</td>
                <td>강의 제목</td>
                <td>강의 보기</td>
            </tr>
            <c:forEach var="video" items="${videoList}" varStatus="status">
            <tr class="text-left" style="font-size: 25px; text-align: center; vertical-align: middle;">
                <td><c:out value="${status.index + 1}" /></td>
                <td><c:out value="${video.videoTitle}" /></td>
                <td>
                    <video width="320" height="240" controls onended="updateAttendance(${studentId}, ${subjectId}, ${video.videoId})">
                        <source src="<c:out value="${video.videoPath}" />" type="video/mp4">
                    </video>
                </td>
            </tr>
            </c:forEach>
        </table>

        <div style="margin-top: 40px; text-align: right">
            <a href="subject.dat?command=listSubjects" class="btn btn-dark">뒤로</a>
        </div>
        <jsp:include page="footer.jsp" />
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
