<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>수강 과목 조회</title>
</head>
<body>
    <div class="container py-4">
        <%@ include file="nav.jsp"%>
        <div style="margin-top: 40px;">
            <a style="font-size: 40px; text-align: center;">강의 영상 편집</a>
        </div>
        <div style="margin-top: 40px;">
        </div>
        <%
            String username = (String) session.getAttribute("name");
            ArrayList<String[]> videoList = new ArrayList<>();

            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                String student_video_sql = "SELECT SubjectVideos.video_title, SubjectVideos.video_path " +
                                           "FROM SubjectVideos " +
                                           "JOIN Student_subjects ON SubjectVideos.subject_id = Student_subjects.subject_id " +
                                           "JOIN Students ON Student_subjects.student_id = Students.student_id " +
                                           "WHERE Students.name = ?";

                pstmt = conn.prepareStatement(student_video_sql);
                pstmt.setString(1, username);
                rs = pstmt.executeQuery();

                while (rs.next()) {
                    String videoTitle = rs.getString("video_title");
                    String videoPath = rs.getString("video_path");
                    videoList.add(new String[]{videoTitle, videoPath});
                }
        %>
                <table class="table table-hover table-sm table-striped">
                    <tr class="text-left" style="font-size: 30px; text-align: center;">
                        <td>&nbsp;</td>
                        <td>동영상 제목</td>
                        <td>동영상 보기</td>
                    </tr>
                    <%
                        int count = 1;
                        for (int i = 0; i < videoList.size(); i++) {
                            String[] video = videoList.get(i);
                    %>
                        <tr class="text-left" style="font-size: 25px; text-align: center;">
                            <td><%= count++ %></td>
                            <td><%= video[0] %></td>
                            <td>
                                <video width="320" height="240" controls>
                                    <source src="<%= video[1] %>" type="video/mp4">
                                </video>
                            </td>
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
                if (conn != null) try { conn.close(); } catch (SQLException e) {}
            }
        %>
        <%@ include file="footer.jsp" %>
    </div>
</body>
</html>
