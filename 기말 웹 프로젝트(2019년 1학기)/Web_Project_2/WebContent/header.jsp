<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>header</title>
</head>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<body>
	<%
		if (session.getAttribute("id") != null) {
	%>
	<form action="logout.jsp" method="post">
		<%=session.getAttribute("id")%>�� �α����ϼ̽��ϴ�.<input type="submit"
			value="�α׾ƿ�"><br> <!-- �α׾ƿ��� ������ logout �������� �� -->
	</form>
	<%
		}
	%>
</body>
</html>