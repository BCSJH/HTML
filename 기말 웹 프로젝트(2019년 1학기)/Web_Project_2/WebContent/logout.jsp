<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α׾ƿ� ������</title>
</head>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<body>
<%
	session.invalidate();
	response.sendRedirect("template.jsp");//template���� ����
%>
</body>
</html>