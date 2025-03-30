package mvc.controller;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
// import jakarta.servlet.http.HttpSession;
import mvc.model.BoardDAO;
import mvc.model.BoardDTO;


public class BoardController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	static final int LISTCOUNT = 5; 

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
	
		if (command.equals("/BoardListAction.do")) {			//등록된 글 목록 페이지 출력하기
			requestBoardList(request);
			RequestDispatcher rd = request.getRequestDispatcher("/board/board.jsp");
			rd.forward(request, response);
			
		} else if (command.equals("/BoardWriteForm.do")) { 		//글 등록 페이지 출력
				requestLoginName(request);
				RequestDispatcher rd = request.getRequestDispatcher("/board/writeForm.jsp");
				rd.forward(request, response);		
				
		} else if (command.equals("/BoardWriteAction.do")) {	//새로운 글 등록
				requestBoardWrite(request);
				RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
				rd.forward(request, response);	
				
		} else if (command.equals("/BoardViewAction.do")) {		//선택된 글 상자 페이지 가져오기
				requestBoardView(request);
				RequestDispatcher rd = request.getRequestDispatcher("/BoardView.do");
				rd.forward(request, response);		
				
		} else if (command.equals("/BoardView.do")) {  			//글 상세 페이지 출력하기
				RequestDispatcher rd = request.getRequestDispatcher("/board/view.jsp");
				rd.forward(request, response);	
				
		} else if (command.equals("/BoardUpdateForm.do")) {  // 수정 폼 보여주기
			    requestBoardView(request); // 글 정보 가져오기
			    RequestDispatcher rd = request.getRequestDispatcher("/board/updateForm.jsp");
			    rd.forward(request, response);
		
		} else if (command.equals("/BoardUpdateAction.do")) { 	//선택된 글 수정하기
				requestBoardUpdate(request);
				RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
				rd.forward(request, response);
				
		} else if (command.equals("/BoardDeleteAction.do")) { 	//선택된 글 삭제하기
				requestBoardDelete(request);
				RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
				rd.forward(request, response);		
		}
		
	
	}
	
	
	//등록된 글 목록 가져오기
	public void requestBoardList(HttpServletRequest request) {
			
		BoardDAO dao = BoardDAO.getInstance();
		ArrayList<BoardDTO> boardlist = new ArrayList<BoardDTO>();
		
	  	int pageNum=1;
		int limit=LISTCOUNT;
		
		if(request.getParameter("pageNum")!=null)
			pageNum=Integer.parseInt(request.getParameter("pageNum"));
				
		String items = request.getParameter("items");
		String text = request.getParameter("text");
		String subjectCode = request.getParameter("subjectCode");
		
		int total_record=dao.getListCount(items,  text);
		boardlist = dao.getBoardList(pageNum,limit, items, text);
		
		
		int total_page;
		
		if (total_record % limit == 0){     
	     	total_page =total_record/limit;
	     	Math.floor(total_page);  
		}
		else{
		   total_page =total_record/limit;
		   Math.floor(total_page); 
		   total_page = total_page + 1; 
		}		
   
   		request.setAttribute("pageNum", pageNum);		  
   		request.setAttribute("total_page", total_page);   
		request.setAttribute("total_record",total_record); 
		request.setAttribute("boardlist", boardlist);								
		
		// 디버깅 로그
//		System.out.println("총 레코드 수: " + total_record);
//		System.out.println("불러온 게시글 수: " + boardlist.size());
//		for (BoardDTO b : boardlist) {
//		    System.out.println("글 제목: " + b.getTitle() + " / 작성자: " + b.getName());
//		}
	}
	
	
	//인증된 사용자명 가져오기
	public void requestLoginName(HttpServletRequest request){
		
		String login_id = request.getParameter("login_id");
		System.out.println(login_id);			// login_id == null 이 아닌지 확인
		
		BoardDAO  dao = BoardDAO.getInstance();
		String name = dao.getLoginNameById(login_id);		
		
		request.setAttribute("name", name);	
	}
	
	
	/* 에러 구간 */
    //새로운 글 등록하기
	public void requestBoardWrite(HttpServletRequest request) {
					
		BoardDAO dao = BoardDAO.getInstance();		
		BoardDTO board = new BoardDTO();
		
		HttpSession session = request.getSession(); 
	    
	    // 세션에서 사용자 정보 가져오기
		board.setLogin_id((String) session.getAttribute("login_id"));
		board.setName((String) session.getAttribute("name"));
		
		// 폼에서 전달된 파라미터 받기
		board.setTitle(request.getParameter("title"));
		board.setContent(request.getParameter("content"));	
		
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
		String postdate = formatter.format(new java.util.Date()); 
		
		board.setHit(0);
		board.setPostdate(postdate);
		board.setIp(request.getRemoteAddr());	
		
		dao.insertBoard(board);								
	}
	
	

	
	//선택된 글 상세 페이지 가져오기
	public void requestBoardView(HttpServletRequest request){
					
		BoardDAO dao = BoardDAO.getInstance();
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));	
		
		BoardDTO board = dao.getBoardByNum(num, pageNum);	//pageNum 매개변수 제거 (단일 글 상세 조회)
		request.setAttribute("num", num);		 
   		request.setAttribute("page", pageNum); 
   		request.setAttribute("board", board);   									
	}
	
	
	//선택된 글 내용 수정하기
	public void requestBoardUpdate(HttpServletRequest request) {
					
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));	
		
		BoardDAO dao = BoardDAO.getInstance();		
		BoardDTO board = new BoardDTO();
		board.setNum(num);
		
		HttpSession session = request.getSession(); 
		board.setName(request.getParameter("name"));
		board.setTitle(request.getParameter("title"));
		board.setContent(request.getParameter("content"));		
		
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
		String postdate = formatter.format(new java.util.Date()); 

		 
		board.setHit(0);
		board.setPostdate(postdate);
		board.setIp(request.getRemoteAddr());			
		
		dao.updateBoard(board);		
		
	}
	
	
	//선택된 글 삭제하기
	public void requestBoardDelete(HttpServletRequest request){
					
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));	
		
		BoardDAO dao = BoardDAO.getInstance();
		dao.deleteBoard(num);							
	}	
	
	
    
}
