<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%@ include file="/WEB-INF/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class="container py-4">
        <%@ include file="/common/nav.jsp"%>
        <div style="margin-top: 40px;">
            <a style="font-size: 40px; text-align: center;">수강/강의 과목 조회</a>
        </div>
        <div style="margin-top: 40px;">
        </div>
            <% 
                String username = (String) session.getAttribute("name");
                ArrayList<String[]> subjectList = new ArrayList<>();
                
                PreparedStatement pstmt = null;
                ResultSet rs = null;
                
                try {
                    String professor_sql = "SELECT Subjects.subject_name, Subjects.subject_code, Professors.name AS professor_name, Subjects.subject_id "+
				                           "FROM Subjects "+
				                           "JOIN Professor_subjects ON Subjects.subject_id = Professor_subjects.subject_id "+
				                           "JOIN Professors ON Professor_subjects.professor_id = Professors.professor_id "+
				                           "WHERE Professors.name = ?";
                
                    if(role.equals("Professor")){ // professor table
                        pstmt = conn.prepareStatement(professor_sql);
                        pstmt.setString(1, username);
                        rs = pstmt.executeQuery();
                       
                        while (rs.next()) {
                            String subjectName = rs.getString("subject_name");
                            String subjectCode = rs.getString("subject_code");
                            String professorName = rs.getString("professor_name");
                            String subjectId = rs.getString("subject_id");
                            subjectList.add(new String[]{subjectName, subjectCode, professorName, subjectId});
                        }
                    
            %>
                    <table class="table table-hover table-sm table-striped">
                        <tr class="text-left" style="font-size: 30px; text-align: center;">
                            <td>&nbsp;</td>
                            <td>과목명</td>
                            <td>과목 코드</td>
                            <td>담당 교수</td>
                            <td>강의 업로드</td>
                            <td>강의 관리</td>
                        </tr>
                        <%
                            int count = 1;
                            for(int i = 0; i < subjectList.size(); i++) {
                                String[] subject = subjectList.get(i);
                        %>
                            <tr class="text-left" style="font-size: 25px; text-align: center;">
                                <td><%=count++ %></td>
                                <td><%=subject[0] %></td>
                                <td><%=subject[1] %></td>
                                <td><%=subject[2] %></td>
                                <td>
                                    <form action="upload_video.jsp" method="post" enctype="multipart/form-data">
                                        <input type="hidden" name="subject_id" value="<%=subject[3] %>">
                                        <input type="file" name="file" id="file" accept="video/*" required>
                                        <input type="text" name="video_title" placeholder="Video Title" required>
                                        <button type="submit">제출</button>
                                    </form>
                                </td>
                                <td>
                                    <form action="view_videos.jsp" method="get">
                                        <input type="hidden" name="subject_id" value="<%=subject[3] %>">
                                        <button type="submit">관리</button>
                                    </form>
                                </td>
                            </tr>
                        <% 
                            }
                        %>
                        <tr style="font-size: 25px; text-align: center;">
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
            
            <%
                    }
                    else{
                        System.out.println("SQL ERROR");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) try { rs.close(); } catch (SQLException e) {}
                    if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
                    if (conn != null) try { conn.close(); } catch (SQLException e) {}
                }
            %>
            
        <%@ include file="/common/footer.jsp" %>
    </div>
</body>
</html>
