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
			String id = (String)session.getAttribute("id");
			if (session.getAttribute("id")==null) { //id�� null�̸�
		%>
				<a href="main.jsp">Ȩ</a><br>
				<a href="main.jsp?pagefile=info_change">��������</a><br>
				<a href="main.jsp?pagefile=schedule"> �а����� </a><br>
				<a href="main.jsp?pagefile=attend"> �⼮Ȯ�� </a><br>
				<a href="main.jsp?pagefile=sign"> �⼮�ȳ��� </a><br>
				<a href="main.jsp?pagefile=board"> �Խ��Ǹ�� </a>
		<%
			} 
			else if(id.equals("1234")) { //id�� null�̸�
				%>
		<a href="main.jsp">Ȩ</a><br>
		<a href="main.jsp?pagefile=info_change">ȸ������</a><br>
		<a href="main.jsp?pagefile=schedule"> �а����� </a><br>
		<a href="main.jsp?pagefile=insertForm_professor"> �⼮üũ </a><br>
		<ul>
			<li><a href="main.jsp?pagefile=insertForm_professor"> ���ý��ۼ���װ��� </a></li>
			<li><a href="main.jsp?pagefile=insertForm_professor2"> �ü�� </a></li>
			<li><a href="main.jsp?pagefile=insertForm_professor3"> �ӽŷ��� ���α׷� </a></li>
		</ul>
		<a href="main.jsp?pagefile=sign"> �⼮�ȳ��� </a><br>
		<a href="main.jsp?pagefile=board"> �Խ��Ǹ�� </a>
		<ul>
			<li><a href="main.jsp?pagefile=formalobjection"> ���� ��û �Խ��� </a></li>
			<li><a href="main.jsp?pagefile=notice"> ���� �Խ��� </a></li>
		</ul>				
				
				<%
					} 
			else { //id�� null�� �ƴϸ� 
		%>
		<a href="main.jsp">Ȩ</a><br>
		<a href="main.jsp?pagefile=info_change">��������</a><br>
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