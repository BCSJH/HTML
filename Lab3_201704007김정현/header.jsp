<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
	function check_id() { //아이디와 비밀번호를 확인하는 기능
		var id = document.getElementById("id").value;  //아이디 값 가져오기
		var pwd = document.getElementById("pwd").value;//비밀번호 값 가져오기

		if (id == "") {
			alert("아이디를 입력해 주세요.");
			return false;
		}

		else if (pwd == "") {
			alert("비밀번호를 입력해 주세요.");
			return false;

		}

		else if (id != "test") {
			alert("아이디가 일치하지 않습니다.");
			return false;

		}

		else if (pwd != "1234") {
			alert("비밀번호가 일치하지 않습니다.");
			return false;

		}

		else {
			return true;
		}
	}
</script>





</head>
<body>
	<%
		if (session.getAttribute("id") == null) {//로그인 전
	%>
	<form action="login_ok.jsp" method="post">
		아이디 <input type="text" name="id" id="id"> 비밀번호 <input
			type="password" name="pwd" id="pwd"> <input type="submit"
			value="로그인" onclick="return check_id()"> <input type="button"
			value="회원가입" onclick="location.href = './main.jsp?pagefile=join'">
		<%
			} else {
		%>
	</form>

	<form action="logout.jsp" method="post"><!-- 로그인 후 -->
		<%=session.getAttribute("id")%>
		님 로그인 하셨습니다. <input type="submit" value="로그아웃">
	</form>
	<%
		}
	%>

</body>
</html>