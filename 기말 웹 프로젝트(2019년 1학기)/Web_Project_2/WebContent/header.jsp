<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="Board.BoardBean"%>
<%@page import="Board.*"%>
<!DOCTYPE html>
<html>
<head>
<style>
@font-face {
	font-family: 'Typo_HelloPOP_OutlineB';
	src: url(Typo_HelloPOP_OutlineB.ttf) format('truetype');
}

#font_main {
	font-family: Typo_HelloPOP_OutlineB;
}


@font-face {
	font-family: 'Typo_HelloPOP_B';
	src: url(Typo_HelloPOP_B.ttf) format('truetype');
}

#font_main_2 {
	font-family: Typo_HelloPOP_B;
}

#header_style {
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
					&nbsp;&nbsp;<img src="image_uv.png" width="100" height="100">
				</td>
				<td>
					<font size="10px">
						&nbsp;&nbsp;<b id="font_main">한국성서대학교</b>&nbsp;&nbsp;<b id="font_main_2">출석 사이트</b>
					</font>
				</td>
			</tr>
		</table>
	</div>
	<%
		if (session.getAttribute("id") != null) {
	%>
	<form action="logout.jsp" method="post">
		<%=session.getAttribute("id")%>님 로그인하셨습니다.<input type="submit"
			value="로그아웃"><br>
		<!-- 로그아웃을 누르면 logout 페이지가 뜸 -->
	</form>
	<%
		}
	%>
</body>
</html>