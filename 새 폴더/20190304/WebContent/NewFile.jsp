<%@page contentType="text/html; charset=euc-kr" %>
<%@page import="java.util.Date" %>
<%
Date now = new Date();
%>
<html>
<head><title>현재시간</title></head>
<body>
현재시각: <%= now %>
</body>
</html>