<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="mvc.model.*" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
	<%
	 	String login_id = null;
	 	if(session.getAttribute("login_id") != null){
	 		login_id = (String) session.getAttribute("login_id");
	 	}
	 	
	 	int boardID = 0;
		if (request.getParameter("boardID") != null){
			boardID = Integer.parseInt(request.getParameter("boardID"));
		}
		
		String realFolder="";
		String saveFolder = "boardUpload";
		String encType = "utf-8";
		int maxSize=5*1024*1024;
		
		ServletContext context = this.getServletContext();
		realFolder = context.getRealPath(saveFolder);
		
		MultipartRequest multi = null;
		
		multi = new MultipartRequest(request,realFolder,maxSize,encType,new DefaultFileRenamePolicy());		
		String fileName = multi.getFilesystemName("fileName");
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		
		BoardDTO board = new BoardDTO(); 
		board.setTitle(title);
		board.setContent(content);

	 	if(login_id == null){
	 		PrintWriter script = response.getWriter();
	 		script.println("<script>");
			script.println("alert('로그인을 해주세요.')");
	 		script.println("location.href = 'login.jsp'");
	 		script.println("</script>");
	 	} else {
	 		if (board.getTitle().equals("") || board.getContent().equals("")) {
	 			PrintWriter script = response.getWriter();
		 		script.println("<script>");
		 		script.println("alert('입력이 안된 사항이 있습니다.')");
		 		script.println("history.back()");
		 		script.println("</script>");
		 	} else {
		 		BoardDAO dao = new BoardDAO();
		 		int num = dao.insertBoard(boardID, board.getTitle(), login_id, board.getContent());
		 		if (num == -1){
			 		PrintWriter script = response.getWriter();
			 		script.println("<script>");
			 		script.println("alert('글쓰기에 실패했습니다.')");
			 		script.println("history.back()");
			 		script.println("</script>");
			 	}
			 	else{
			 		PrintWriter script = response.getWriter();
					if(fileName != null){
						File oldFile = new File(realFolder+"\\"+fileName);
						File newFile = new File(realFolder+"\\"+(num-1)+"사진.jpg");
						oldFile.renameTo(newFile);
					}
			 		script.println("<script>");
					script.println("location.href= \'board.jsp?boardID="+boardID+"\'");
			 		script.println("</script>");
			 	}
		 	}
	 	}
	 %>
</body>
</html>