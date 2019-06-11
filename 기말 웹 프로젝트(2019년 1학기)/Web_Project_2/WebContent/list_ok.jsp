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
	//값 불러오기
	String pagefile = request.getParameter("pagefile");
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	String nowPage = request.getParameter("nowPage");
%>
<script>
	//content안에 띄우기 위해 따로 jsp를 만듦
	location.href="main.jsp?pagefile=list&keyField=<%=keyField%>&keyWord=<%=keyWord%>&nowPage=<%=nowPage%>";
</script>
</body>
</html>