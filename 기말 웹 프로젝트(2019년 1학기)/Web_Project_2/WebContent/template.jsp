<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<meta charset="EUC-KR">
<title>템플릿</title>
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

#menu {
	padding: 10px;
	margin-bottom: 5px;
	width: 180px;
	height: 900px;
	float: left;
	border: 1px solid #bcbcbc;
}

#content {
	width: 700px;
	height: 900px;
	padding: 10px;
	float: right;
	border: 1px solid #bcbcbc;
}

#footer {
	clear: both;
	padding: 20px;
	border: 1px solid #bcbcbc;
}
</style>
<%
	String pagefile = request.getParameter("pagefile");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
%>
</head>
<body>

	<div id="container">
		<!-- header 시작  -->
		<div id="header">
			<jsp:include page="header.jsp" />
		</div>
		<!-- header 끝  -->
		<!-- menu 시작  -->
		<div>
			<div id="menu">
				<jsp:include page="menu.jsp" />
			</div>
		<!-- header 끝  -->
		<!--  content 시작  -->
			<div id="content">
			<%
				
				if (pagefile == null) { //pagefile의 값마다 다른 페이지가 뜨게함
					pagefile = "intro";
			%>
			<jsp:include page='<%=pagefile + ".jsp"%>' />
			<%
				} else {
			%>
			<jsp:include page='<%=pagefile + ".jsp"%>' />
			<%
				}
			%>
			</div>
		</div>
		<!--  content 끝  -->

		<!--  footer 시작   -->
		<div id="footer"> 
			
		</div>
		<!--  footer 끝  -->

	</div>

</body>
</html>