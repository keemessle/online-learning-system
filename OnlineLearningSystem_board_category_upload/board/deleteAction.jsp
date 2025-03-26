<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="mvc.model.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.PrintWriter" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
<%
	    // 이미 로그인 상태인 사람은 회원가입 페이지에 접속하지 못하도록
	    
	    // 사용자
		String login_id = null;
		if (session.getAttribute("login_id") != null) {
			login_id = (String) session.getAttribute("login_id");
		}
		if (login_id == null) {    // 로그인 상태 X
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		
		// 게시글
		int num = 0;
		if (request.getParameter("num") != null) {
			num = Integer.parseInt(request.getParameter("num"));
		}
		if (num == 0) {    // 
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'board.jsp'");
			script.println("</script>");
		}
		
		// 게시글 정보 가져오기
    	BoardDAO boardDAO = BoardDAO.getInstance();
    	BoardDTO board = boardDAO.getBoardByNum(num, 1);
    	if (board == null) {
       		PrintWriter script = response.getWriter();
        	script.println("<script>");
        	script.println("alert('해당 글을 찾을 수 없습니다.')");
        	script.println("location.href = 'board.jsp'");
        	script.println("</script>");
        	return;
    	}
    	
    	String action = request.getParameter("action");
        if ("update".equals(action)) {
            // 글 수정
            if (request.getParameter("title") == null || request.getParameter("content") == null
                || request.getParameter("title").trim().equals("") || request.getParameter("content").trim().equals("")) {    // 입력하지 않은 항목이 있는 경우
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('입력할 항목이 남아 있습니다.')");
                script.println("history.back()");
                script.println("</script>");
                return;
            }
            
            String title = request.getParameter("title").trim();
            String content = request.getParameter("content").trim();
            
            board.setTitle(title);
            board.setContent(content);
            
            try {
                boardDAO.updateBoard(board);
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("location.href='board.jsp'");
                script.println("</script>");
            } catch (Exception ex) {
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('글수정에 실패하였습니다.')");
                script.println("history.back()");
                script.println("</script>");
            }
        } else if ("delete".equals(action)) {
            // 글 삭제
            try {
                boardDAO.deleteBoard(num);
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("location.href='board.jsp'");
                script.println("</script>");
            } catch (Exception ex) {
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('글 삭제에 실패하였습니다.')");
                script.println("history.back()");
                script.println("</script>");
            }
        }
  
	%>
</body>
</html>