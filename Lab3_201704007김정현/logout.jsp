<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
</head>
<body>
<% 
	session.invalidate();//���� ����
	response.sendRedirect("main.jsp");//�ٽ� ����ȭ������ ����
%>
</body>
</html>