package mvc.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.UUID;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import mvc.model.SubjectDAO;
import mvc.model.SubjectDTO;
import mvc.model.VideoDAO;
import mvc.model.VideoDTO;


@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024,  // 1MB
	    maxFileSize = 1024 * 1024 * 20,   // 20MB
	    maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class SubjectController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String command = request.getParameter("command");
        //String subjectIdStr = request.getParameter("subject_id");

        if ("viewVideos".equals(command)) {
            viewVideos(request, response);
        } else if ("uploadVideo".equals(command)) {
            uploadVideo(request, response);  // 👈 업로드 처리 메서드 호출
        } else {
            listSubjects(request, response);
        }
    }

    public void listSubjects(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("name");
        String role = (String) session.getAttribute("role");

        ArrayList<SubjectDTO> subjectList = new ArrayList<>();
        SubjectDAO subjectDAO = SubjectDAO.getInstance();

        try {
            if ("Student".equals(role)) {
                subjectList = subjectDAO.getSubjectsByStudent(username);
            } else if ("Professor".equals(role)) {
                subjectList = subjectDAO.getSubjectsByProfessor(username);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("subjectList", subjectList);
        RequestDispatcher rd = request.getRequestDispatcher("./subject.jsp");
        rd.forward(request, response);
    }

    public void viewVideos(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        int subjectId = Integer.parseInt(request.getParameter("subject_id"));

        String role = (String) request.getSession().getAttribute("role");
        String userId = (String) request.getSession().getAttribute("user_id");

        ArrayList<VideoDTO> videoList = new ArrayList<>();
        VideoDAO videoDAO = VideoDAO.getInstance();

        try {
            videoList = videoDAO.getVideosBySubject(subjectId);
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("videoList", videoList);
        request.setAttribute("subjectId", subjectId);
        request.setAttribute("studentId", userId);

        if ("Student".equals(role)) {
            RequestDispatcher rd = request.getRequestDispatcher("/subject/studentVideo.jsp");
            rd.forward(request, response);
        } else if ("Professor".equals(role)) {
            RequestDispatcher rd = request.getRequestDispatcher("/subject/professorVideo.jsp");
            rd.forward(request, response);
        }
    }
    
    /* 비디오 업로드 - 교수 */
    public void uploadVideo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();

        Part filePart = request.getPart("file");
        String originalFileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // .mp4 등

        String subjectId = request.getParameter("subject_id");
        String videoTitle = request.getParameter("video_title");

        // 저장 경로 생성
        String uploadPath = getServletContext().getRealPath("") + "resources/videos";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        // 파일 저장
        String uniqueFileName = UUID.randomUUID().toString() + extension;
        String filePath = uploadPath + File.separator + uniqueFileName;
        
        try (InputStream fileContent = filePart.getInputStream();
             FileOutputStream fos = new FileOutputStream(filePath)) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = fileContent.read(buffer)) != -1) {
                fos.write(buffer, 0, bytesRead);
            }
        }

        String relativeFilePath = "resources/videos/" + uniqueFileName;

        // DB 연결
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/lmsdb", "root", "mysql00@");

            String sql = "INSERT INTO SubjectVideos (subject_id, video_path, video_title) VALUES (?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(subjectId));
            pstmt.setString(2, relativeFilePath);
            pstmt.setString(3, videoTitle);
            pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch (SQLException ignored) {}
            if (conn != null) try { conn.close(); } catch (SQLException ignored) {}
        }

        // 업로드 후 해당 강의 보기로 이동
        response.sendRedirect("subject.dat?command=viewVideos&subject_id=" + subjectId);
    }

    
}
