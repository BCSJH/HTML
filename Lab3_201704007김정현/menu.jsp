<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
		<%
		String id = request.getParameter("id");
		if(session.getAttribute("id")==null){//�α��� ��
		%>
		<a href="main.jsp">Ȩ</a> | <a href="./main.jsp?pagefile=list"> �������� </a>
		<%}
		else// �α��� ��
		{%>
		<a href="main.jsp">Ȩ</a> | <a href="./main.jsp?pagefile=list"> ������û </a>
		<%}%>
</body>
</html>