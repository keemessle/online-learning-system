<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/subject.css">
	<meta charset="UTF-8">
	<title>Subject</title>
</head>
<body>
    <div class="container">
        <jsp:include page="/common/nav.jsp" />

        <div class="subject-title">
            <h1>수강/강의 과목 조회</h1>
        </div>
        
        <c:choose>
            <c:when test="${role eq 'Student'}">
                <table class="table table-hover table-sm table-striped table-subject">
                    <tr class="subject-header">
                        <td>&nbsp;</td>
                        <td>과목명</td>
                        <td>과목 코드</td>
                        <td>학점</td>
                        <td>담당 교수</td>
                        <td>강의</td>
                    </tr>
                    <c:forEach var="subject" items="${subjectList}" varStatus="status">
                        <tr class="subject-row">
                            <td><c:out value="${status.index + 1}" /></td>
                            <td><c:out value="${subject.subjectName}" /></td>
                            <td><c:out value="${subject.subjectCode}" /></td>
                            <td><c:out value="${subject.subjectCredit}" /></td>
                            <td><c:out value="${subject.userName}" /></td>
                            <td>
                                <form action="subject.dat" method="get">
                                    <input type="hidden" name="command" value="viewVideos">
                                    <input type="hidden" name="subject_id" value="${subject.subjectId}">
                                    <button type="submit" class="btn btn-dark btn-view">강의 보기</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    <tr class="subject-total">
                        <td colspan="3"></td>
                        <td>총 학점: 
                            <c:set var="sum" value="0" scope="page"/>
                            <c:forEach var="subject" items="${subjectList}">
                                <c:set var="sum" value="${sum + subject.subjectCredit}" scope="page"/>
                            </c:forEach>
                            <c:out value="${sum}" />
                        </td>
                        <td colspan="2"></td>
                    </tr>
                </table>
            </c:when>
            <c:when test="${role eq 'Professor'}">
                <table class="table table-hover table-sm table-striped subject-table">
                    <tr class="subject-header">
                        <td>&nbsp;</td>
                        <td>과목명</td>
                        <td>과목 코드</td>
                        <td>담당 교수</td>
                        <td>강의 관리</td>
                    </tr>
                    <c:forEach var="subject" items="${subjectList}" varStatus="status">
                        <tr class="subject-row">
                            <td><c:out value="${status.index + 1}" /></td>
                            <td><c:out value="${subject.subjectName}" /></td>
                            <td><c:out value="${subject.subjectCode}" /></td>
                            <td><c:out value="${subject.userName}" /></td>
                            <td>
                                <form action="subject.dat" method="get">
                                    <input type="hidden" name="command" value="viewVideos">
                                    <input type="hidden" name="subject_id" value="${subject.subjectId}">
                                    <button type="submit" class="btn btn-dark btn-view">강의 관리</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </c:when>
            <c:otherwise>
                <p class="no-access">권한이 없습니다.</p>
            </c:otherwise>
        </c:choose>

        <div class="subject-footer">
            <a href="../index.jsp" class="btn btn-secondary">홈으로</a>
        </div>
        
        <jsp:include page="/common/footer.jsp" />
    </div>
</body>
</html>
