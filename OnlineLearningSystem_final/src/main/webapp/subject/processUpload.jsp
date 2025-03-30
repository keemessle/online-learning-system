<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mvc.model.BoardDAO" %>
<%@ page import="mvc.model.BoardDTO" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>

<%
	request.setCharacterEncoding("UTF-8");


	String realFolder = application.getRealPath("/upload");  // ✅ 업로드 실제 경로 지정
	int maxSize = 5 * 1024 * 1024;
	String encType = "utf-8";
	
	// ✅ MultipartRequest 생성자 수정: (request, 저장 경로, 최대 크기, 인코딩, 이름 중복 처리)
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

	// 파일 이름 가져오기 (선택 사항)
	String filename = multi.getFilesystemName("file");

	// 로그인 사용자 정보
	String id = (String) session.getAttribute("login_id");
	String username = (String) session.getAttribute("name");

	
	// 확인용 출력 (디버깅)
	System.out.println("업로드한 파일명: " + filename);
	System.out.println("작성자 아이디: " + id);
	System.out.println("작성자 이름: " + username);
%>



<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="mvc.model.BoardDAO" %>
<%@ page import="mvc.model.BoardDTO" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<%
	request.setCharacterEncoding("UTF-8");

	// 파일 저장 경로
	String realFolder = application.getRealPath("/upload"); 
	int maxSize = 5 * 1024 * 1024; // 5MB
	String encType = "utf-8";

	// MultipartRequest 객체 생성
	MultipartRequest multi = new MultipartRequest(
		request,
		realFolder,
		maxSize,
		encType,
		new DefaultFileRenamePolicy()
	);

	// 로그인 세션 확인
	String id = (String) session.getAttribute("id");
	String name = (String) session.getAttribute("name");

	if (id == null || name == null) {
%>
		<script>
			alert("로그인이 필요합니다.");
			location.href = "<%= request.getContextPath() %>/user/login.jsp";
		</script>
<%
		return;
	}

	String title = multi.getParameter("title");
	String content = multi.getParameter("content");
	String filename = multi.getFilesystemName("file");

	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
	String postdate = formatter.format(new java.util.Date());

	// DTO 생성
	BoardDTO board = new BoardDTO();
	board.setId(id);  // 여기가 null이면 DB insert 실패
	board.setName(name);
	board.setTitle(title);
	board.setContent(content);
	board.setPostdate(postdate);
	board.setHit(0);
	board.setIp(request.getRemoteAddr());
	board.setFileName(filename);  // 선택 사항

	// DAO 호출
	BoardDAO dao = BoardDAO.getInstance();
	dao.insertBoard(board);

	response.sendRedirect("BoardListAction.do");
%> --%>