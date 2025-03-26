<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>View Videos</title>
</head>
<body>
    <div class="container py-4">
    <%@ include file="nav.jsp"%>
		<div style="margin-top: 40px; padding-bottom: 40px;">
            <h1 style="font-size: 40px; text-align: center;">강의 동영상 목록</h1>
        </div>
        <% 
            String subjectId = request.getParameter("subject_id");
            ArrayList<String[]> videoList = new ArrayList<>();
            
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            
            try {
                String video_sql = "SELECT video_title, video_path FROM SubjectVideos WHERE subject_id = ?";
                
                pstmt = conn.prepareStatement(video_sql);
                pstmt.setInt(1, Integer.parseInt(subjectId));
                rs = pstmt.executeQuery();
                
                while (rs.next()) {
                    String videoTitle = rs.getString("video_title");
                    String videoPath = rs.getString("video_path");
                    videoList.add(new String[]{videoTitle, videoPath});
                }
        %>
        <table class="table table-hover table-sm table-striped ">
            <tr class="text-left" style="font-size: 30px; text-align: center;">
                <td>&nbsp;</td>
                <td>비디오 제목</td>
                <td>강의 영상</td>
            </tr>
            <%   
                int count = 1;
                for (int i = 0; i < videoList.size(); i++) {
                    String[] video = videoList.get(i);
            %>
            <tr class="text-left" style="font-size: 25px; text-align: center; vertical-align: middle;">
                <td><%= count++ %></td>
                <td><%= video[0] %></td>
                <td>
                    <video width="480" height="300" controls>
                        <source src="<%= request.getContextPath() + "/" + video[1] %>" type="video/mp4">
                    </video>
                </td>
            </tr>
            <% 
                }
            %>
        </table>
        <% 
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException e) {}
                if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
                if (conn != null) try { conn.close(); } catch (SQLException e) {}
            }
        %>
        <div style="margin-top: 40px;">
            <a href="lecture_student.jsp" class="btn btn-primary">뒤로</a>
        </div>
        <%@ include file="footer.jsp" %>
    </div>
</body>
</html>
