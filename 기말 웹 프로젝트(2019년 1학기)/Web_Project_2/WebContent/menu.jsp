<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>메뉴</title>
</head>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<body>

	<div>
		<%
			String id = (String)session.getAttribute("id");
			if (session.getAttribute("id")==null) { //id가 null이면
		%>
				<a href="main.jsp">홈</a><br>
				<a href="main.jsp?pagefile=info_change">정보수정</a><br>
				<a href="main.jsp?pagefile=schedule"> 학과일정 </a><br>
				<a href="main.jsp?pagefile=attend"> 출석확인 </a><br>
				<a href="main.jsp?pagefile=sign"> 출석안내문 </a><br>
				<a href="main.jsp?pagefile=board"> 게시판목록 </a>
		<%
			} 
			else if(id.equals("1234")) { //id가 null이면
				%>
		<a href="main.jsp">홈</a><br>
		<a href="main.jsp?pagefile=info_change">회원관리</a><br>
		<a href="main.jsp?pagefile=schedule"> 학과일정 </a><br>
		<a href="main.jsp?pagefile=insertForm_professor"> 출석체크 </a><br>
		<ul>
			<li><a href="main.jsp?pagefile=insertForm_professor"> 웹시스템설계및개발 </a></li>
			<li><a href="main.jsp?pagefile=insertForm_professor2"> 운영체제 </a></li>
			<li><a href="main.jsp?pagefile=insertForm_professor3"> 머신러닝 프로그램 </a></li>
		</ul>
		<a href="main.jsp?pagefile=sign"> 출석안내문 </a><br>
		<a href="main.jsp?pagefile=board"> 게시판목록 </a>
		<ul>
			<li><a href="main.jsp?pagefile=formalobjection"> 이의 신청 게시판 </a></li>
			<li><a href="main.jsp?pagefile=notice"> 공지 게시판 </a></li>
		</ul>				
				
				<%
					} 
			else { //id가 null이 아니면 
		%>
		<a href="main.jsp">홈</a><br>
		<a href="main.jsp?pagefile=info_change">정보수정</a><br>
		<a href="main.jsp?pagefile=schedule"> 학과일정 </a><br>
		<a href="main.jsp?pagefile=attend"> 출석확인 </a><br>
		<a href="main.jsp?pagefile=sign"> 출석안내문 </a><br>
		<a href="main.jsp?pagefile=board"> 게시판목록 </a>
		<ul>
			<li><a href="main.jsp?pagefile=formalobjection"> 이의 신청 게시판 </a></li>
			<li><a href="main.jsp?pagefile=notice"> 공지 게시판 </a></li>
		</ul>
		<%
			}
		%>
	</div>
</body>
</html>