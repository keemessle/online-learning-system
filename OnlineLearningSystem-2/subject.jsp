<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Subject</title>
</head>
<body>
    <div class="container py-4">
        <jsp:include page="nav.jsp" />

        <div style="margin-top: 40px;">
            <h1 style="font-size: 40px; text-align: center;">수강/강의 과목 조회</h1>
        </div>
        <div style="margin-top: 40px;"></div>
        
        <c:choose>
            <c:when test="${role eq 'Student'}">
                <table class="table table-hover table-sm table-striped">
                    <tr class="text-left" style="font-size: 30px; text-align: center;">
                        <td>&nbsp;</td>
                        <td>과목명</td>
                        <td>과목 코드</td>
                        <td>학점</td>
                        <td>담당 교수</td>
                        <td>강의</td>
                    </tr>
                    <c:forEach var="subject" items="${subjectList}" varStatus="status">
                        <tr class="text-left" style="font-size: 25px; text-align: center;">
                            <td><c:out value="${status.index + 1}" /></td>
                            <td><c:out value="${subject.subjectName}" /></td>
                            <td><c:out value="${subject.subjectCode}" /></td>
                            <td><c:out value="${subject.subjectCredit}" /></td>
                            <td><c:out value="${subject.userName}" /></td>
                            <td>
                                <form action="subject.dat" method="get">
                                    <input type="hidden" name="command" value="viewVideos">
                                    <input type="hidden" name="subject_id" value="${subject.subjectId}">
                                    <button type="submit" class="btn btn-dark">강의 보기</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    <tr style="font-size: 25px; text-align: center;">
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>총 학점: 
                            <c:set var="sum" value="0" scope="page"/>
                            <c:forEach var="subject" items="${subjectList}">
                                <c:set var="sum" value="${sum + subject.subjectCredit}" scope="page"/>
                            </c:forEach>
                            <c:out value="${sum}" />
                        </td>
                        <td></td>
                        <td></td>
                    </tr>
                </table>
            </c:when>
            <c:when test="${role eq 'Professor'}">
                <table class="table table-hover table-sm table-striped">
                    <tr class="text-left" style="font-size: 30px; text-align: center;">
                        <td>&nbsp;</td>
                        <td>과목명</td>
                        <td>과목 코드</td>
                        <td>담당 교수</td>
                        <td>강의 관리</td>
                    </tr>
                    <c:forEach var="subject" items="${subjectList}" varStatus="status">
                        <tr class="text-left" style="font-size: 25px; text-align: center;">
                            <td><c:out value="${status.index + 1}" /></td>
                            <td><c:out value="${subject.subjectName}" /></td>
                            <td><c:out value="${subject.subjectCode}" /></td>
                            <td><c:out value="${subject.userName}" /></td>
                            <td>
                                <form action="subject.dat" method="get">
                                    <input type="hidden" name="command" value="viewVideos">
                                    <input type="hidden" name="subject_id" value="${subject.subjectId}">
                                    <button type="submit" class="btn btn-dark">강의 관리</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </c:when>
            <c:otherwise>
                <p>권한이 없습니다.</p>
            </c:otherwise>
        </c:choose>

        <div style="margin-top: 40px; text-align: right">
            <a href="index.jsp" class="btn btn-secondary">홈으로</a>
        </div>
        <jsp:include page="footer.jsp" />
    </div>
</body>
</html>
