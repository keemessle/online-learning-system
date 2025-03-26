<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mvc.model.BoardDAO" %>
<%@ page import="mvc.model.BoardDTO" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>

<%

	request.setCharacterEnding("UTF-8");


	String filename="";
	String realFolder=""; //현재 프로젝트 upload파일이 생성된 절대 경로 위치
	int maxSize = 5 * 1024 * 1024;
	String encType="utf-8";
	
	MultipartRequest multi=new MultipartRequest(request, realFoler, maxSize, encType, )
	String id = null;
	if (session.getAttribute("login_id") != null) {
		id = (String) session.getAttribute("login_id");
	}
	
	HttpSession user = request.getSession();
    String username = (String) session.getAttribute("name");
%>
%>
