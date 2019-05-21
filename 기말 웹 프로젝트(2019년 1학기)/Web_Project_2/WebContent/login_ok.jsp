<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인화면</title>
</head>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<body>
	<div>
		<%
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");

			if (id.equals("test") && pwd.equals("1234")) {//id가 test 이고 비밀번호가 1234 이면 
				session.setAttribute("id", id);//아이디값을 세션으로 저장해줌
			}
			response.sendRedirect("template.jsp");//template.jsp로 리다이렉트해줌
		%>
	</div>
</body>
</html>