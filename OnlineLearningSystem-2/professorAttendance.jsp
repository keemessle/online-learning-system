<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="./resources/css/bootstrap.min.css">
    <meta charset="UTF-8">
    <title>Professor Attendance</title>
</head>
<body>
    <div class="container py-4">
        <%@ include file="nav.jsp" %>
        <div style="margin-top: 40px;">
            <h1 style="font-size: 40px; text-align: center;">출결 관리</h1>
        </div>
        <div style="margin-top: 40px;">
            <form action="professorAttendance.jsp" method="get">
                <label for="subject">과목 선택: </label>
                <select name="subject_id" id="subject" required>
                    <option value="" disabled selected>과목을 선택하세요</option>
                    <%
                    int professorId = Integer.parseInt((String) session.getAttribute("user_id"));
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;
                    try {
                        String query = "SELECT s.subject_id, s.subject_name " +
                                       "FROM Subjects s " +
                                       "JOIN Professor_subjects ps ON s.subject_id = ps.subject_id " +
                                       "WHERE ps.professor_id = ?";
                        pstmt = conn.prepareStatement(query);
                        pstmt.setInt(1, professorId);
                        rs = pstmt.executeQuery();
                        while (rs.next()) {
                            int subjectId = rs.getInt("subject_id");
                            String subjectName = rs.getString("subject_name");
                    %>
                    <option value="<%= subjectId %>"><%= subjectName %></option>
                    <%
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    } finally {
                        if (rs != null) try { rs.close(); } catch (SQLException e) {}
                        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
                    }
                    %>
                </select>
                <button type="submit" class="btn btn-primary">확인</button>
            </form>
        </div>
        <%
        String subjectId = request.getParameter("subject_id");
        if (subjectId != null) {
            ArrayList<String[]> attendanceList = new ArrayList<>();
            String selectedSubjectName = "";
            try {
                // 과목명 가져오기
                String subjectNameQuery = "SELECT subject_name FROM Subjects WHERE subject_id = ?";
                pstmt = conn.prepareStatement(subjectNameQuery);
                pstmt.setInt(1, Integer.parseInt(subjectId));
                rs = pstmt.executeQuery();
                if (rs.next()) {
                    selectedSubjectName = rs.getString("subject_name");
                }
                rs.close();
                pstmt.close();

                // 출결 정보 가져오기
                String query = "SELECT s.name, sv.video_title, a.watched, a.watched_date " +
                               "FROM Attendance a " +
                               "JOIN Students s ON a.student_id = s.student_id " +
                               "JOIN SubjectVideos sv ON a.video_id = sv.video_id " +
                               "WHERE a.subject_id = ?";
                pstmt = conn.prepareStatement(query);
                pstmt.setInt(1, Integer.parseInt(subjectId));
                rs = pstmt.executeQuery();
                while (rs.next()) {
                    String studentName = rs.getString("name");
                    String videoTitle = rs.getString("video_title");
                    boolean watched = rs.getBoolean("watched");
                    Timestamp watchedDate = rs.getTimestamp("watched_date");
                    attendanceList.add(new String[]{studentName, videoTitle, String.valueOf(watched), watchedDate != null ? watchedDate.toString() : ""});
                }
        %>
        <table class="table table-hover table-sm table-striped" style="text-align: center;">
            <tr class="text-left" style="font-size: 30px; text-align: center;">
                <td>과목명</td>
                <td>학생 이름</td>
                <td>영상 제목</td>
                <td>시청 여부</td>
                <td>시청 날짜</td>
            </tr>
            <%
                for (String[] attendance : attendanceList) {
            %>
            <tr class="text-left" style="font-size: 25px; text-align: center;">
                <td><%= selectedSubjectName %></td>
                <td><%= attendance[0] %></td>
                <td><%= attendance[1] %></td>
                <td><%= attendance[2].equals("true") ? "시청 완료" : "미시청" %></td>
                <td><%= attendance[3] %></td>
            </tr>
            <%
                }
            %>
        </table>
        <%
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException e) {}
                if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
            }
        }
        %>
        <div style="margin-top: 40px; text-align: right">
            <a href="index.jsp" class="btn btn-secondary">홈으로</a>
        </div>
        <%@ include file="footer.jsp" %>
    </div>
</body>
</html>
