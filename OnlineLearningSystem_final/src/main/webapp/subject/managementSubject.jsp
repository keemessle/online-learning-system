<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String role = (String) session.getAttribute("role");

	if(role.equals("Professor")){
		response.sendRedirect("addSubject.jsp");
	}
	else if(role.equals("Student")){
		response.sendRedirect("registerSubject.jsp");
	}
%>