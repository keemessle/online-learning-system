<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>과목 추가</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container py-4">
    <jsp:include page="nav.jsp" />
        <h2 class="mt-5">과목 추가</h2>
        <form action="processAddSubject.jsp" method="post">
            <div class="mb-3">
                <label for="subject_name" class="form-label">과목 이름</label>
                <input type="text" class="form-control" id="subject_name" name="subject_name" required>
            </div>
            <div class="mb-3">
                <label for="subject_credit" class="form-label">과목 학점</label>
                <input type="number" class="form-control" id="subject_credit" name="subject_credit" min="2" max="3" required>
            </div>
            <div class="mb-3">
                <label for="subject_code" class="form-label">과목 코드</label>
                <input type="text" class="form-control" id="subject_code" name="subject_code" required>
            </div>
            <button type="submit" class="btn btn-primary">추가</button>
        </form>
        <jsp:include page="footer.jsp" />
    </div>
</body>
</html>
