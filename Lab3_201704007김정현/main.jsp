<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<!doctype html>
<html lang="ko">
<head>
<title>Lab2</title>
<meta charset="euc-kr">
<style>
#container {
	width: 940px;
	margin: 0px auto;
	padding: 20px;
	border: 1px solid #bcbcbc;
}

#header {
	padding: 20px;
	margin-bottom: 5px;
	width: 900px;
	height: 10px;
	border: 1px solid #bcbcbc;
	float: right;
	text-align: right;
}

#headermenu {
	padding: 20px;
	margin-bottom: 5px;
	width: 900px;
	height: 50px;
	float: left;
	border: 1px solid #bcbcbc;
}

#content {
	width: 900px;
	padding: 20px;
	margin-bottom: 20px;
	float: right;
	border: 1px solid #bcbcbc;
}

#footer {
	clear: both;
	padding: 20px;
	border: 1px solid #bcbcbc;
}
</style>
</head>
<body>

<%
	String pagefile=request.getParameter("pagefile");
	if(pagefile==null) {
		pagefile="intro";
	}
%>
<!-- 굳이 template.jsp를 만들어야되나...
그냥 main에서 한꺼번에 실행할 수도 있는 것을...너무 파일들이 많다...부들부들 화난다... 너무 어렵다...하... -->
<jsp:forward page="template.jsp">
	<jsp:param name="pagefile" value="<%=pagefile%>" /> 
</jsp:forward>
</body> 
</html>