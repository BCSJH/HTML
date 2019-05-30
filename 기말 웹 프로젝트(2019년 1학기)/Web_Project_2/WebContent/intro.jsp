<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<style>
		#line{
		margin: 0 auto;
		width:500px;
		}
	</style>
<meta charset="EUC-KR">
<title>로그인 화면</title>
</head>
<% 
	request.setCharacterEncoding("EUC-KR");
%>
<body>
		<%
		if (session.getAttribute("id") == null) {
	%>
	<br><br>
	<div id= "line">
  	  <br><br>
   		<b><font size="6" color="gray">로그인</font></b><br><br>
		<form action="login_ok.jsp" method="post">
				아이디 &nbsp;&nbsp;&nbsp;<input type="text" name="id" maxlength="60" ><br><br>
				비밀번호&nbsp;<input type="password" name="pwd" maxlength="60" ><br><br>
				<input type="submit" value="로그인" >
			 
				<input type="button" value="회원가입" onclick="location.href = 'main.jsp?pagefile=join'">
		</form>
	</div>
	<%
		}
		else{
			out.print(session.getAttribute("id")+"님");
			%>
				반갑습니다.
			<%
			
		}
		%>
</body>
</html>