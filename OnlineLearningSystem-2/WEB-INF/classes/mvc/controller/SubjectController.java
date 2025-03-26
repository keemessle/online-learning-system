package mvc.controller;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mvc.model.SubjectDAO;
import mvc.model.SubjectDTO;
import mvc.model.VideoDAO;
import mvc.model.VideoDTO;

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

        if (role.equals("Student")) {
            RequestDispatcher rd = request.getRequestDispatcher("./studentVideo.jsp");
            rd.forward(request, response);
        } else if (role.equals("Professor")) {
            RequestDispatcher rd = request.getRequestDispatcher("./professorVideo.jsp");
            rd.forward(request, response);
        }
    }
    
}
