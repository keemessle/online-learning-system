<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="mvc.model.BoardDTO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    BoardDTO notice = (BoardDTO) request.getAttribute("board");
    Integer numObj = (Integer) request.getAttribute("num");
    Integer pageObj = (Integer) request.getAttribute("page");
    
    HttpSession user = request.getSession();
    String username = (String) session.getAttribute("name");

    if (notice == null || numObj == null || pageObj == null) {
        out.println("<script>alert('필요한 데이터가 없습니다.'); history.back();</script>");
        return;
    }

    int num = numObj.intValue();
    int nowpage = pageObj.intValue();
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>게시글 상세 페이지</title>
</head>
<body>
<div class="container py-4">
    <jsp:include page="nav.jsp" />
    
    <div class="container">
      <div class="row">
      	<form name="newUpdate" action="BoardUpdateAction.do" method="post" class="w-100">
      		<input type="hidden" name="num" value="<%=notice.getNum()%>">
    		<input type="hidden" name="pageNum" value="<%=pageObj%>">
      			<div class="card">
					<div class="card-header board-title">
						게시글 상세보기
					</div>
					<div class="card-body">
						<div class="mb-3">
							<label for="name" class="form-label">글쓴이</label>
							<input name="name" type="text" class="form-control" id="name" value="<%=username%>" readonly>
						</div>
						<div class="mb-3">
							<label for="title" class="form-label">제목</label>
							<input name="title" type="text" class="form-control" id="title" value="<%=notice.getTitle()%>">
						</div>
						<div class="mb-3">
							<label for="content" class="form-label">내용</label>
							<textarea name="content" class="form-control" id="content" maxlength="2048" style="height: 350px;"><%=notice.getContent()%></textarea>
						</div>
						<!--  <div class="mb-3">
							<c:if test="${not empty board.fileName}">
        						<p>첨부파일: <a href="${pageContext.request.contextPath}/FileDownload.do?fileName=${board.fileName}">${board.fileName}</a></p>
    						</c:if>
						</div> -->
  					</div>
  				</div>
      <div class="mb-3 row">
        <div class="col-sm-offset-2 col-sm-10">
            
            <p>
              <%
                // 로그인한 사용자 = 글의 작성자 -> 수정 및 삭제 버튼 활성화
                if (username != null && username.equals(notice.getName())) {
              %>
              
              <input type="button" onclick="location.href='./BoardListAction.do?pageNum=<%=pageObj%>'" class="btn btn-primary" value="목록">
              <input type="submit" class="btn btn-success" value="수정">
              <input type="button" onclick="location.href='./BoardDeleteAction.do?num=<%=notice.getNum()%>&pageNum=<%=pageObj%>'" class="btn btn-danger" value="삭제">
    		  
    		  <% } else { %>
              <!-- 권한이 없는 경우 -> 수정 및 삭제 버튼 비활성화 -->
              <input type="button" onclick="location.href='./BoardListAction.do?pageNum=<%=pageObj%>'" class="btn btn-primary" value="목록">
              <% } %>
            </p>

        </div>
      </div>
    </form>
   </div>
</div>
<jsp:include page="footer.jsp" />
</div>
</body>
</html>
