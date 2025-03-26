<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Subject</title>
</head>
<body>
	<div class="container py-4" >
		<%@ include file="nav.jsp"%>
		<div style="margin-top: 40px;">
			<h1 style="font-size: 40px; text-align: center;">수강/강의 과목 조회</h1>
		</div>
		<div style="margin-top: 40px;">
		</div>
			<% 
				String username = (String) session.getAttribute("name");
				ArrayList<String[]> subjectList = new ArrayList<>();
				
                PreparedStatement pstmt = null;
                ResultSet rs = null;
                
                try {
                	String professor_sql = "SELECT Subjects.subject_name, Subjects.subject_code, Professors.name AS professor_name "+
				                    	   "FROM Subjects "+
				                    	   "JOIN Professor_subjects ON Subjects.subject_id = Professor_subjects.subject_id "+
				                    	   "JOIN Professors ON Professor_subjects.professor_id = Professors.professor_id "+
				                    	   "WHERE Professors.name = ?";
                	String student_sql = "SELECT Subjects.subject_name, Subjects.subject_code, Subjects.subject_credit, Professors.name AS professor_name "+
				                    	 "FROM Subjects "+
				                    	 "INNER JOIN Student_subjects ON Subjects.subject_id = Student_subjects.subject_id "+
				                    	 "INNER JOIN Students ON Student_subjects.student_id = Students.student_id "+
				                    	 "INNER JOIN Professor_subjects ON Subjects.subject_id = Professor_subjects.subject_id "+
				                    	 "INNER JOIN Professors ON Professor_subjects.professor_id = Professors.professor_id "+
				                    	 "WHERE Students.name = ?";
                	
                	if(role.equals("Student")){ // student table
                		pstmt = conn.prepareStatement(student_sql);
                        pstmt.setString(1, username);
                        rs = pstmt.executeQuery();
                        
                        while (rs.next()) {
                            String subjectName = rs.getString("subject_name");
                            String subjectCode = rs.getString("subject_code");
                            String subjectCredit = rs.getString("subject_credit");
                            String professorName = rs.getString("professor_name");
                            subjectList.add(new String[]{subjectName, subjectCode, subjectCredit, professorName});
                        }
            %>
            		<table class="table table-hover table-sm table-striped">
						<tr class="text-left" style="font-size: 30px; text-align: center;">
							<td>&nbsp;</td>
							<td>과목명</td>
							<td>과목 코드</td>
							<td>학점</td>
							<td>담당 교수</td>
						</tr>
			            <%   
			            	int sum_credit = 0, count = 1;
							for(int i = 0; i < subjectList.size(); i++) {
								String[] subject = subjectList.get(i);
								sum_credit += Integer.parseInt(subject[2]);
						%>
							<tr class="text-left" style="font-size: 25px; text-align: center;">
								<td><%=count++ %></td>
								<td><%=subject[0] %></td>
								<td><%=subject[1] %></td>
								<td><%=subject[2] %></td>
								<td><%=subject[3] %></td>
							</tr>
						<%
							}
						%>
						<tr style="font-size: 25px; text-align: center;">
							<td></td>
							<td></td>
							<td></td>
							<td>총 학점: <%=sum_credit %></td>
							<td></td>
						</tr>
					</table>
            
            <%
                	}
                	else if(role.equals("Professor")){ // professor table
                		pstmt = conn.prepareStatement(professor_sql);
                        pstmt.setString(1, username);
                        rs = pstmt.executeQuery();
                        
                        while (rs.next()) {
                            String subjectName = rs.getString("subject_name");
                            String subjectCode = rs.getString("subject_code");
                            String professorName = rs.getString("professor_name");
                            subjectList.add(new String[]{subjectName, subjectCode, professorName});
                        }
                	
             %>
             		<table class="table table-hover table-sm table-striped">
						<tr class="text-left" style="font-size: 30px; text-align: center;">
							<td>&nbsp;</td>
							<td>과목명</td>
							<td>과목 코드</td>
							<td>담당 교수</td>
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
        <div style="margin-top: 40px; text-align: right">
            <a href="index.jsp" class="btn btn-secondary">홈으로</a>
        </div>
		<%@ include file="footer.jsp" %>
	</div>
</body>
</html>