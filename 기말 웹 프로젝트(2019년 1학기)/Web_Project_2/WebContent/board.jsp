<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խ��Ǹ��</title>
</head>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<body>
		<div>
		<%
			if (session.getAttribute("id") == null) { //id�� null�̸�
		%>
			�� ���� ��û�� �л��� �̿� �����մϴ�.
		<%
			} else { //id�� null�� �ƴϸ� 
		%>
				
		<%
			}
		%>
	</div>
</body>
</html>