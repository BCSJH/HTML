<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>세션</title>
<script>
function ch(){//입력하라고 경고 메세지 출력
	
	var hello = document.getElementById("id");
	var hello2 = document.getElementById("pwd");
	if (hello == null) {
		document.getElementById("name_chk").innerHTML = "이름을 입력해주세요.";
		document.getElementById("name_chk").style.color = "red";
	}
	if(hello2 == null) {
		document.getElementById("pwd_chk").innerHTML = "비밀번호를 입력해주세요.";
		document.getElementById("pwd_chk").style.color = "red";
	}
	
}
</script>
</head>
<body>

<!-- 로그인 ㄱㄱ -->
<%if(session.getAttribute("id")==null){ %>



<form name="form" action="Lab2_2_result.jsp" method="post">
	<h3>201704007 김정현</h3>
	아이디 <input type= "text" value="" name="id">
	<span id="name_chk"> </span>
	<br>
	비밀번호 <input type="password" name="pwd">
	<span id="pwd_chk"> </span>
	<br>
	<p> <input type="submit" value="로그인" onclick="ch()"> </p>
</form>


<% }
else {
//세션이 설정되지 않은 경우
%>
<p>
<!--sesstion -->
<form action="logout.jsp" method="post" >
<%= session.getAttribute("id") %>님 로그인하셨습니다.
<input type="submit" value="로그아웃">
</form>
</p>

<p>
* 좋아하는 계절은?
<form name="form" id="form" action="includepage.jsp" method="post">
	<label>
	<input type="radio" name="season" value="봄">봄
	<input type="radio" name="season" value="여름">여름
	<input type="radio" name="season" value="가을">가을
	<input type="radio" name="season" value="겨울">겨울
	<input type="hidden" name="id" value="<%= session.getAttribute("id") %>">
	<input type="submit" value="결과보기"><!-- pageContext.forwar(Lab2_2_result)로 보내기 -->
</label>
</form>
</p>

<%
//ppt에 있는 것 그대로...
	Date d = new Date();
	SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	long time =session.getLastAccessedTime();
	out.println("마지막 접속 시간 : " + f.format(time)); 
	
}%>
</body>
</html>