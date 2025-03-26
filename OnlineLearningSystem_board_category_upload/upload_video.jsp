<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.sql.*, jakarta.servlet.*, jakarta.servlet.http.*, jakarta.servlet.annotation.*, java.nio.file.*, java.util.UUID" %>
<%@ include file="dbconn.jsp" %>

<%
    if (request.getMethod().equalsIgnoreCase("POST")) {
        Part filePart = request.getPart("file");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String uniqueFileName = UUID.randomUUID().toString() + "_" + fileName; // 고유 이름 만들기
        String subjectId = request.getParameter("subject_id");
        String videoTitle = request.getParameter("video_title");

        // 파일 경로 정의
        String uploadPath = getServletContext().getRealPath("") + "resources/videos";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            if (uploadDir.mkdirs()) {
                System.out.println("Directory created: " + uploadPath);
            } else {
                System.out.println("Failed to create directory: " + uploadPath);
            }
        }

        //System.out.println("Path: " + uploadPath);

        // 파일 저장
        String filePath = uploadPath + File.separator + uniqueFileName;
        try (InputStream fileContent = filePart.getInputStream();
             FileOutputStream fos = new FileOutputStream(filePath)) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = fileContent.read(buffer)) != -1) {
                fos.write(buffer, 0, bytesRead);
            }

            //System.out.println("File saved");
        } catch (IOException e) {
            //System.out.println("File saving failed");
            e.printStackTrace();
        }

        // 데이터베이스에 파일 정보 삽입
        PreparedStatement pstmt = null;
        try {
            String sql = "INSERT INTO SubjectVideos (subject_id, video_path, video_title) VALUES (?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(subjectId));
            pstmt.setString(2, "resources/videos/" + uniqueFileName); // 상대 경로 저장
            pstmt.setString(3, videoTitle);
            pstmt.executeUpdate();

            //System.out.println("File saved");
        } catch (SQLException e) {
            //System.out.println("File saving failed");
            e.printStackTrace();
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
            if (conn != null) try { conn.close(); } catch (SQLException e) {}
        }
        response.sendRedirect("subject_view.jsp");
    }
%>
