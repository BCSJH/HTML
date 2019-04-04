<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<%
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");

//ppt에 나와있는 것처럼 아이디, 패스워드 지정
if (id.equals("test") && pwd.equals("1234"))
	session.setAttribute("id",id);
else 
	out.print(" ");

response.sendRedirect("Lab2_2.jsp");
%>