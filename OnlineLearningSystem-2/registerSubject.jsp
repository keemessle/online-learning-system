<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>과목 신청</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container py-4">
    <jsp:include page="nav.jsp" />
        <h2 class="mt-5">과목 신청</h2>
        <form action="processRegisterSubject.jsp" method="post">
            <div class="mb-3">
                <label for="subject_id" class="form-label">과목 선택</label>
                <select class="form-select" id="subject_id" name="subject_id" required>
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
            </div>
            <button type="submit" class="btn btn-primary">신청</button>
        </form>
        <jsp:include page="footer.jsp" />
    </div>
</body>
</html>
