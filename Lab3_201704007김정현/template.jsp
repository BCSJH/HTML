<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
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
</head>
<!-- 굳이 template를 만들어야했던 이유는 가운데 값을 계쏙 바꿔줘야되기 때문이다.
 이렇게 하지 않으면 정말... 처음부터 끝까지 코드를 다 짜야되서 복잡하다...
 처음에 jsp마다 다 작성했다가 머리가 터지는 줄 알았다. 망할...
 이것은 송원석선배님께서 도와주신 부분이다.
 -->
<body>
<%
	String pagefile = request.getParameter("pagefile");
%>

	<div id="container">
		<!-- header 시작  -->
		<div id="header">
		<jsp:include page="header.jsp" flush="false"/><!-- header값 가져오기 -->
		</div>
		
		<div id="headermenu">
		<jsp:include page="menu.jsp" flush="false"/>
		</div>
		<!-- header 끝  -->
		
		<!--  content 시작  -->
		<div id="content">
		<!-- 중앙 콘텐츠는 지속적으로 변화한다. 그러므로 페이지 파일+jsp로 지속 변화시킨다. -->
			<jsp:include page='<%=pagefile + ".jsp"%>' />
		</div>
		<!--  footer 시작   -->
		<div id="footer">
		<jsp:include page="footer.jsp" flush="false"/>
		</div>
		<!--  footer 끝  -->

	</div>

</body>
</html>