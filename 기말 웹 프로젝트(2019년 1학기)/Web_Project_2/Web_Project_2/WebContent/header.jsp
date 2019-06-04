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
		<font size="5px"><b> 한국성서대학교</b> 출석 사이트 </font>
</td>
</tr>
</table>
</div>
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