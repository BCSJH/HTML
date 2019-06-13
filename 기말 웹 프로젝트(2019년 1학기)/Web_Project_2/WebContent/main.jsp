<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="Board.BoardBean"%>
<%@page import="Board.*"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="css/bootstrap.css">

<meta charset="EUC-KR">
<title>메인 홈</title>
</head>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<body>
	<%
		String pagefile = request.getParameter("pagefile");//pagefile 받은값을 String으로 형변환
		if (pagefile == null) { // pagefile이 null이면
			pagefile = "intro"; //인트로가 뜸
		}
	%>
	<jsp:forward page="template.jsp"> 
		<jsp:param name="pagefile" value="<%=pagefile%>" />
	</jsp:forward>

</body>
</html>