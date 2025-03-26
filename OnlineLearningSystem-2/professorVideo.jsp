<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="./resources/css/bootstrap.min.css">
    <meta charset="UTF-8">
    <title>강의 관리</title>
</head>
<body>
    <div class="container py-4">
        <jsp:include page="nav.jsp" />
        <div style="margin-top: 40px;">
            <h1 style="font-size: 40px; text-align: center;">강의 관리</h1>
        </div>
        <div style="margin-top: 40px;"></div>

        <table class="table table-hover table-sm table-striped">
            <tr class="text-left" style="font-size: 30px; text-align: center;">
                <td>&nbsp;</td>
                <td>비디오 제목</td>
                <td>보기</td>
                <td>삭제</td>
            </tr>
            <c:forEach var="video" items="${videoList}" varStatus="status">
            <tr class="text-left" style="font-size: 25px; text-align: center; vertical-align: middle;">
                <td><c:out value="${status.index + 1}" /></td>
                <td><c:out value="${video.videoTitle}" /></td>
                <td>
                    <video width="320" height="240" controls>
                        <source src="<c:out value="${video.videoPath}" />" type="video/mp4">
                    </video>
                </td>
                <td>
                    <form action="deleteVideo.jsp" method="post">
                        <input type="hidden" name="video_id" value="${video.videoId}">
                        <input type="hidden" name="subject_id" value="${subjectId}">
                        <button type="submit" class="btn btn-danger">삭제</button>
                    </form>
                </td>
            </tr>
            </c:forEach>
        </table>

        <div style="margin-top: 40px;">
            <form action="uploadVideo.jsp" method="post" enctype="multipart/form-data">
                <input type="hidden" name="subject_id" value="${subjectId}">
                <input type="file" name="file" id="file" accept="video/*" required>
                <input type="text" name="video_title" placeholder="제목" required>
                <button type="submit" class="btn btn-primary">영상 업로드</button>
            </form>
        </div>

        <div style="margin-top: 40px; text-align: right">
            <a href="subject.dat?command=listSubjects" class="btn btn-secondary">뒤로</a>
        </div>
        <jsp:include page="footer.jsp" />
    </div>
</body>
</html>
