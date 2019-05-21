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
		if (session.getAttribute("id") == null) {
	%>
	<form action="login_ok.jsp" method="post">
		아이디 <input type="text" name="id">비밀번호 <input type="password"
			name="pwd"> <input type="submit" value="로그인">
			 
			<input type="button" value="회원가입" onclick="location.href = 'main.jsp?pagefile=join'" > <!-- id가 null일때 회원가입을 누르면 join페이지가 뜸 -->
	
	</form>

	<%
		} else { //id값이 있으면
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