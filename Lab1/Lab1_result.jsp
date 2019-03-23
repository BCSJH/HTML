<%@ page language="java"
 contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
request.setCharacterEncoding("euc-kr");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
이름 : <%=request.getParameter("name")%>
<br>
전화번호 : <%=request.getParameter("tel")%>
<br>
size : <%=request.getParameter("size")%>
<br>
수량 : <%=request.getParameter("count")%>
<hr>
금액 : <%=request.getParameter("total")%>
</body>
</html>