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
		if(session.getAttribute("id")==null){//로그인 전
		%>
		<a href="main.jsp">홈</a> | <a href="./main.jsp?pagefile=list"> 개설강좌 </a>
		<%}
		else// 로그인 후
		{%>
		<a href="main.jsp">홈</a> | <a href="./main.jsp?pagefile=list"> 수강신청 </a>
		<%}%>
</body>
</html>