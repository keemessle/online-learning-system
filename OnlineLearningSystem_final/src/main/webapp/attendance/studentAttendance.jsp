<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%@ include file="/WEB-INF/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/attendance.css">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/nav.css">
    <meta charset="UTF-8">
    <title>출결 관리</title>
</head>
<body>
    <div class="container">
        <%@ include file="/common/nav.jsp" %>
        
        
        <div class="attendance-content">
			<div class="attendance-header">
        		<h1 class="attendance-title">출결 관리</h1>
        	</div>
        
        

            <%
                int studentId = Integer.parseInt((String)session.getAttribute("user_id"));
                ArrayList<String[]> attendanceList = new ArrayList<>();
                PreparedStatement pstmt = null;
                ResultSet rs = null;
                try {
                    String query = "SELECT su.subject_name, sv.video_title, a.watched, a.watched_date " +
                                   "FROM Attendance a " +
                                   "JOIN Subjects su ON a.subject_id = su.subject_id " +
                                   "JOIN SubjectVideos sv ON a.video_id = sv.video_id " +
                                   "WHERE a.student_id = ?";
                    pstmt = conn.prepareStatement(query);
                    pstmt.setInt(1, studentId);
                    rs = pstmt.executeQuery();
                    while (rs.next()) {
                        String subjectName = rs.getString("subject_name");
                        String videoTitle = rs.getString("video_title");
                        boolean watched = rs.getBoolean("watched");
                        Timestamp watchedDate = rs.getTimestamp("watched_date");
                        attendanceList.add(new String[]{subjectName, videoTitle, String.valueOf(watched), watchedDate != null ? watchedDate.toString() : ""});
                    }
            %>
            <table class="table table-hover table-sm table-striped attendance-table">
            	<thead>
	                <tr>
	                    <td>과목명</td>
	                    <td>비디오 제목</td>
	                    <td>시청 여부</td>
	                    <td>시청 날짜</td>
	                </tr>
	            </thead>
	            <tbody>
	                <%
	                    for (String[] attendance : attendanceList) {
	                %>
	                <tr>
	                    <td><%= attendance[0] %></td>
	                    <td><%= attendance[1] %></td>
	                    <td><%= attendance[2].equals("true") ? "Y" : "미시청" %></td>
	                    <td><%= attendance[3] %></td>
	                </tr>
	                <%
	                    }
	                %>
	        	</tbody>
            </table>
            <%
                } catch (SQLException e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) try { rs.close(); } catch (SQLException e) {}
                    if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
                }
            %>
        
        	<div class="attendance-btn text-end mt-4">
				<a href="<%= request.getContextPath() %>/index.jsp" class="btn btn-dark back-btn">뒤로</a>
			</div>
        </div>
        
        
        <%@ include file="/common/footer.jsp" %>
    </div>
</body>
</html>
