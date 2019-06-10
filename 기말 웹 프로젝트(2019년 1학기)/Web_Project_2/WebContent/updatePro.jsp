<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>
<%@page import="Board.BoardBean"%>
<jsp:useBean id="bMgr" class="Board.BoardMgr" />
<%
request.setCharacterEncoding("EUC-KR");
BoardBean bean = (BoardBean) session.getAttribute("bean");
String nowPage = request.getParameter("nowPage");
BoardBean upBean = new BoardBean();
upBean.setIdx(Integer.parseInt(request.getParameter("num")));
upBean.setMem_name(request.getParameter("name"));
upBean.setTitle(request.getParameter("title"));
upBean.setContent(request.getParameter("content"));
upBean.setPass(request.getParameter("pass"));
upBean.setIp(request.getParameter("ip"));
String upPass = upBean.getPass();
String inPass = bean.getPass();
if (upPass.equals(inPass)) {
bMgr.updateBoard(upBean);
String url = "read.jsp?nowPage=" + nowPage + "&num=" + upBean.getIdx();
response.sendRedirect(url);
} else {
out.println("<script>");
out.println("alert('입력하신 비밀번호가 아닙니다.');");
out.println("history.back();");
out.println("</script>");
}
%>

