<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그아웃 누르면</title>
</head>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<body>
<%
	session.invalidate();
	response.sendRedirect("template.jsp");//template으로 보냄
%>
</body>
</html>