<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="Board.BoardBean"%>
<%@page import="Board.*"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<!-- ��Ÿ�Ͻ�Ʈ ����  -->
<link rel="stylesheet" href="css/bootstrap.css">

<meta charset="EUC-KR">
<title>���� Ȩ</title>
</head>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<body>
	<%
		String pagefile = request.getParameter("pagefile");//pagefile �������� String���� ����ȯ
		if (pagefile == null) { // pagefile�� null�̸�
			pagefile = "intro"; //��Ʈ�ΰ� ��
		}
	%>
	<jsp:forward page="template.jsp"> 
		<jsp:param name="pagefile" value="<%=pagefile%>" />
	</jsp:forward>

</body>
</html>