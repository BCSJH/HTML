<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α���ȭ��</title>
</head>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<body>
	<div>
		<%
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");

			if (id.equals("test") && pwd.equals("1234")) {//id�� test �̰� ��й�ȣ�� 1234 �̸� 
				session.setAttribute("id", id);//���̵��� �������� ��������
			}
			response.sendRedirect("template.jsp");//template.jsp�� �����̷�Ʈ����
		%>
	</div>
</body>
</html>