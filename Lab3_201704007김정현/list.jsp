<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
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
<script>
	function checkbox_ch() { //아무것도 체크하지 않았을 경우
		var nothing = false;  
		var array = document.getElementsByName("study"); 

		for (var i = 0; i < array.length; i++) { 
			if (array[i].checked == true) {
				nothing = true;
				break;
			}
		}

		if (!nothing) {//아무것도 체크하지 않았을 경우
			alert("하나 이상은 체크해주세요");
			return false;
		} else

			return true;
	}
</script>
</head>
<body>
		<%
		String id = request.getParameter("id");
		if(session.getAttribute("id")==null){//로그인 전
		%>
		<h1>개설 강좌</h1>
		<table border="1">
		<tr>
		<th>강좌 코드</th>
		<th>과목명</th>
		<th>학년</th>
		<th>학점</th>
		</tr>
		
		
		<tr>
		<td>IC051-A</td><td>웹 시스템 설계 및 개발</td><td>3</td><td>3</td>
		</tr>
		
		<tr>
		<td>IC147-A</td><td>자바기반응용프로그래밍</td><td>2</td><td>3</td>
		</tr>
		
		<tr>
		<td>IC136-A</td><td>컴퓨터프로그래밍기초</td><td>1</td><td>3</td>
		</tr>
		
		<tr>
		<td>IC066-A</td><td>운영체제</td><td>3</td><td>3</td>
		</tr>
		</table>
		<%
		}
		else{ %>
		
		<!-- id 값이 null이 아닐경우에는 수강신청 페이지 띄우기 -->
		<form action="./main.jsp?pagefile=apply"
		 name="choice" method="POST" 
		 onsubmit="return checkbox_ch();"><!--로그인 후 -->
		<h1>수강 신청</h1>		 
		<table border="1">
		<tr>
		<th>강좌 코드</th>
		<th>과목명</th>
		<th>학년</th>
		<th>학점</th>
		<th>선택</th>
		</tr>
		
		
		<tr>
		<td>IC051-A</td><td>웹 시스템 설계 및 개발</td><td>3</td><td>3</td>
		<td><input type="checkbox" name="study" id="study" value="웹 시스템 설계 및 개발"></td> <!-- 아이디 세션값이 존재하기 전에는 없던 구매 체크박스 부분이다. 로그인을 하여 세션값이 존재하면서 체크박스 부분을 사용하게 만들었다.-->
					
		</tr>
		
		<tr>
		<td>IC147-A</td><td>자바기반응용프로그래밍</td><td>2</td><td>3</td>
		<td><input type="checkbox" name="study" id="study" value="자바기반응용프로그래밍"></td>
					
		</tr>
		
		<tr>
		<td>IC136-A</td><td>컴퓨터프로그래밍기초</td><td>1</td><td>3</td>
		<td><input type="checkbox" name="study" id="study" value="컴퓨터프로그래밍기초">
		</td>
		</tr>
		
		<tr>
		<td>IC066-A</td><td>운영체제</td><td>3</td><td>3</td>
		<td><input type="checkbox" name="study" id="study" value="운영체제">
		</td>
		</tr>
		</table>
		<p align="right"><!-- 오른쪽 정렬 -->
			<input type="submit" value="구매하기"></p>
			<%
		}
		%>
		</form>
</body>
</html>