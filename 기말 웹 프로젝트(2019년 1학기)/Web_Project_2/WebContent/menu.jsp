<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�޴�</title>
</head>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<body>
	<div>
		<%
			if (session.getAttribute("id") == null) { //id�� null�̸�
		%>
		<a href="main.jsp">Ȩ</a><br>
		<a href="main.jsp?pagefile=schedule"> �а����� </a><br>
		<a href="main.jsp?pagefile=attend"> �⼮Ȯ�� </a><br>
		<a href="main.jsp?pagefile=sign"> �⼮�ȳ��� </a><br>
		<a href="main.jsp?pagefile=board"> �Խ��Ǹ�� </a>
		<%
			} else { //id�� null�� �ƴϸ� 
		%>
		<a href="main.jsp">Ȩ</a><br>
		<a href="main.jsp?pagefile=schedule"> �а����� </a><br>
		<a href="main.jsp?pagefile=attend"> �⼮Ȯ�� </a><br>
		<a href="main.jsp?pagefile=sign"> �⼮�ȳ��� </a><br>
		<a href="main.jsp?pagefile=board"> �Խ��Ǹ�� </a>
		<ul>
			<li><a href="main.jsp?pagefile=formalobjection"> ���� ��û �Խ��� </a></li>
			<li><a href="main.jsp?pagefile=notice"> ���� �Խ��� </a></li>
		</ul>
		<%
			}
		%>
	</div>
</body>
</html>