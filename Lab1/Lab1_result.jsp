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
�̸� : <%=request.getParameter("name")%>
<br>
��ȭ��ȣ : <%=request.getParameter("tel")%>
<br>
size : <%=request.getParameter("size")%>
<br>
���� : <%=request.getParameter("count")%>
<hr>
�ݾ� : <%=request.getParameter("total")%>
</body>
</html>