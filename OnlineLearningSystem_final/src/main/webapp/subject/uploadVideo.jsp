<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.sql.*, jakarta.servlet.*, jakarta.servlet.http.*, jakarta.servlet.annotation.*, java.nio.file.*, java.util.UUID" %>
<%@ include file="/WEB-INF/dbconn.jsp" %>

<%
    if (request.getMethod().equalsIgnoreCase("POST")) {
    	
        Part filePart = request.getPart("file");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String subjectId = request.getParameter("subject_id");
        String videoTitle = request.getParameter("video_title");

        
        System.out.println("Subject ID: " + subjectId);  // 디버깅 코드 추가
        System.out.println("Video Title: " + videoTitle);  // 디버깅 코드 추가
        // 업로드할 파일 경로 정의
        String uploadPath = getServletContext().getRealPath("") + "resources/videos";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        // 파일 저장
        String uniqueFileName = UUID.randomUUID().toString() + "_" + fileName;
        String filePath = uploadPath + File.separator + uniqueFileName;
        try (InputStream fileContent = filePart.getInputStream();
             FileOutputStream fos = new FileOutputStream(filePath)) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = fileContent.read(buffer)) != -1) {
                fos.write(buffer, 0, bytesRead);
            }
        }

        // 상대 경로로 파일 경로 설정
        String relativeFilePath = "resources/videos/" + uniqueFileName;

        // 데이터베이스에 파일 정보 삽입
        PreparedStatement pstmt = null;
        try {
            String sql = "INSERT INTO SubjectVideos (subject_id, video_path, video_title) VALUES (?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(subjectId));
            pstmt.setString(2, relativeFilePath);
            pstmt.setString(3, videoTitle);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
            if (conn != null) try { conn.close(); } catch (SQLException e) {}
        }
        response.sendRedirect("subject.dat?command=viewVideos&subject_id=" + subjectId);
    }
%>
