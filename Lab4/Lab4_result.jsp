<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="java.sql.Timestamp"%><!-- 시간 측정하기 위한 자바 모듈 -->
    <% request.setCharacterEncoding("euc-kr");
    %>
<jsp:useBean id="Lab4" class="Lab4.Lab4" scope="page"><!-- Lab4 패키지에 있는 Lab4에 있는 것들 불러오기 위함-->
<jsp:setProperty name="Lab4" property="*"/>
<% Lab4.setDate(new Timestamp(System.currentTimeMillis())); %><!-- 시간 -->
</jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<!-- 주문 확인 -->
201704007 김정현<br>
주문 번호 : <jsp:getProperty name="Lab4" property="order_num"/><br>
커피 종류 : <jsp:getProperty name="Lab4" property="coffee"/><br>
옵션 : <jsp:getProperty name="Lab4" property="option"/><br>
사이즈 : <jsp:getProperty name="Lab4" property="size"/><br>
주문 시간 : <jsp:getProperty name="Lab4" property="date"/><br>
</body>
</html>