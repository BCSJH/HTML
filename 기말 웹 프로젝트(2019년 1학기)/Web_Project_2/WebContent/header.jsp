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
		<%=session.getAttribute("id")%>님 로그인하셨습니다.<input type="submit"
			value="로그아웃"><br> <!-- 로그아웃을 누르면 logout 페이지가 뜸 -->
	</form>
	<%
		}
	%>
</body>
</html>