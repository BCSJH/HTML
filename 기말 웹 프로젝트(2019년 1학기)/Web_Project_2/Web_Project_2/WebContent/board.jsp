<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시판목록</title>
</head>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<body>
		<div>
		<%
			if (session.getAttribute("id") == null) { //id가 null이면
		%>
			웹 수강 신청한 학생만 이용 가능합니다.
		<%
			} else { //id가 null이 아니면 
		%>
				
		<%
			}
		%>
	</div>
</body>
</html>