<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="java.sql.Timestamp"%><!-- �ð� �����ϱ� ���� �ڹ� ��� -->
    <% request.setCharacterEncoding("euc-kr");
    %>
<jsp:useBean id="Lab4" class="Lab4.Lab4" scope="page"><!-- Lab4 ��Ű���� �ִ� Lab4�� �ִ� �͵� �ҷ����� ����-->
<jsp:setProperty name="Lab4" property="*"/>
<% Lab4.setDate(new Timestamp(System.currentTimeMillis())); %><!-- �ð� -->
</jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<!-- �ֹ� Ȯ�� -->
201704007 ������<br>
�ֹ� ��ȣ : <jsp:getProperty name="Lab4" property="order_num"/><br>
Ŀ�� ���� : <jsp:getProperty name="Lab4" property="coffee"/><br>
�ɼ� : <jsp:getProperty name="Lab4" property="option"/><br>
������ : <jsp:getProperty name="Lab4" property="size"/><br>
�ֹ� �ð� : <jsp:getProperty name="Lab4" property="date"/><br>
</body>
</html>