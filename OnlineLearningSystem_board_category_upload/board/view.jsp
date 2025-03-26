<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="mvc.model.BoardDTO" %>
<%@ page import="java.io.PrintWriter" %>
<%
    BoardDTO notice = (BoardDTO) request.getAttribute("board");
    Integer numObj = (Integer) request.getAttribute("num");
    Integer pageObj = (Integer) request.getAttribute("page");

    if (notice == null || numObj == null || pageObj == null) {
        // 필요한 데이터가 없을 때 처리
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
<title>게시판</title>
</head>
<body>
<div class="container py-4">
    <jsp:include page="../nav.jsp" />
    
    <div class="container py-4">
      <div class="panel panel-default">
        <div class="panel-heading text-center" style="font-size: 20px; font-weight: bold; color: GREEN; border: 3px solid #ddd;">자유게시판</div>
      </div>
    </div>
    <div class="row align-items-md-stretch text-center">
    <form name="newUpdate" action="BoardWriteForm.do?num=<%=notice.getNum()%>&pageNum=<%=pageObj%>" method="post">
       <div class="mb-3 row">
         <label class="col-sm-2 control-label" >이름</label>
         <div class="col-sm-3">
            <input name="name" class="form-control" value="<%=notice.getName()%>">
         </div>
      </div>
      <div class="mb-3 row">
        <label class="col-sm-2 control-label">제목</label>
        <div class="col-sm-5">
            <input name="title" class="form-control" value="<%=notice.getTitle()%>" >
        </div>
      </div>
      <div class="mb-3 row">
        <label class="col-sm-2 control-label">내용</label>
        <div class="col-sm-8" style="word-break: break-all;">
            <textarea name="content" class="form-control" cols="50" rows="5"><%=notice.getContent()%></textarea>
        </div>
      </div>
      <div class="mb-3 row">
        <div class="col-sm-offset-2 col-sm-10">
            
            <p>
              
              <input type="button" onclick="location.href='./BoardListAction.do?pageNum=<%=pageObj%>'" class="btn btn-primary" value="목록">
              <input type="submit" onclick="locstion.href='update.jsp?num=<%= num %>'" class="btn btn-success" value="수정">
              <input type="button" onclick="return confirm('삭제하시겠습니까?')" href="deleteAction.jsp?num=<%= num %>" class="btn btn-danger" value="삭제">
    
            </p>

        </div>
      </div>
    </form>
    
</div>
<jsp:include page="../footer.jsp" />
</div>
</body>
</html>
