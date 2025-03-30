<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String name = (String) request.getAttribute("name");
	String login_id = (String) session.getAttribute("login_id");
	String username = (String) session.getAttribute("name");
%>
<html>
<head>
	<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/board.css">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/nav.css">
	<title>게시글 작성</title>
</head>
	<script type="text/javascript">
		function checkForm() {
			if (document.newWrite.name.value.length == 0) {
				alert("성명을 입력하세요.");
				return false;
			}
			if (document.newWrite.subject.value == 0) {
				alert("제목을 입력하세요.");
				return false;
			}
			if (!document.newWrite.content.value) {
				alert("내용을 입력하세요.");
				return false;
			}		
		}
	</script>
<body>
	<div class="container">
		<jsp:include page="/common/nav.jsp" />
		
		<div class="board-content">
			<div class="board-header">
        		<h1 class="board-title">게시글 작성<br></h1>
	      	</div>
	
			<form class="board-form pt-3" name="newWrite" action="<%= request.getContextPath() %>/BoardWriteAction.do" method="post" onsubmit="return checkForm()">
				<div class="pb-3 row">
					<label class="col-sm-2 control-label">이름</label>
					<div class="col-sm-5">
						<input name="name" type="text" class="form-control" id="name" value="<%= username %>" readonly>
					</div>
				</div>
				<div class="pb-3 row">
					<label class="col-sm-2 control-label" >제목</label>
					<div class="col-sm-5">
						<input name="title" type="text" class="form-control" id="title" placeholder="제목을 입력하세요.">
					</div>
				</div>
				<div class="pb-3 row">
					<label class="col-sm-2 control-label" >내용</label>
					<div class="col-sm-8">
						<textarea name="content" class="form-control" id="content" maxlength="2048" style="height: 350px;" placeholder="내용을 입력하세요."></textarea>
					</div>
				</div>
				
				<div class="text-center">
					<button type="submit" class="btn write-btn">등록</button>				
					<button type="reset" class="btn cancel-btn" onclick="location.href='<%=request.getContextPath()%>/BoardListAction.do?pageNum=1'">취소</button>
				</div>
			</form>
			
		</div>
	
		<jsp:include page="/common/footer.jsp" />
	</div>
	<script src="<c:url value='/resources/js/bootstrap.bundle.min.js'/>"></script>
</body>
</html>


