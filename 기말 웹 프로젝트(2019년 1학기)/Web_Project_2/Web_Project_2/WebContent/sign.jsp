<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>출석안내문</title>
</head>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<body>
<h1>출석 안내문</h1>
<h3>출결 평가 기준</h3>
성적에는 10% 반영<br>
3회 지각 및 조퇴는 결석 1회로 처리<br>
결석 1회시 1점 감점<br>
지각 1회는 0.3점씩 감정하며,<br>
지각 3회는 0.4점으로 처리하여 결석 1회로 1점 감점으로 처리<br>
총 수업 시간의 1/5 이상 결석한 자는 과목 처리 "F"처리<br>
</body>
</html>