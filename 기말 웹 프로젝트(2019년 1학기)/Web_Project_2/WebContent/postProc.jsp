<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>
<jsp:useBean id="bMgr" class="Board.BoardMgr" />
<%
request.setCharacterEncoding("EUC-KR");
bMgr.insertBoard(request);
response.sendRedirect("main.jsp?pagefile=list");
%>




