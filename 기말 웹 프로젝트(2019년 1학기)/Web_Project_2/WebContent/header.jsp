<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<style>
	#header_style{
		text-align: center;
	}
</style>
<meta charset="EUC-KR">
<title>header</title>
</head>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<body>
<div>
<table id="header_style">
<tr>
<td>
		<img src="image_uv.png" width="60" height="60">
</td>
<td>
		<font size="5px"><b> �ѱ��������б�</b> �⼮ ����Ʈ </font>
</td>
</tr>
</table>
</div>
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