<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="java.util.Vector"%>
<%@page import="Board.ReplyBean"%>
<%@page import="java.sql.Timestamp"%>
<jsp:useBean id="rMgr" class="Board.ReplyMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	int board_idx = Integer.parseInt(request.getParameter("num"));
	/* int nowPage = Integer.parseInt(request.getParameter("nowPage"));  */
	System.out.println(request.getParameter("num"));
	System.out.println(request.getParameter("nowPage"));
	Vector<ReplyBean> vlist = null;
%>
<html>
<head>
<title>JSP Board</title>
</head>
<body>

<%

	int nowPage =0;
%>
	댓글목록
	<div align="center">
		<table style="width: 960; cellpadding: 3; align: center;">
			<tr>
				<td align="center" colspan="2">
					<%
						vlist = rMgr.getReplyList(board_idx);
						if (vlist.isEmpty()) {
							out.println("댓글이 없습니다.");
						} else {
					%>
					<table border=1
						style="width: 90%; cellpadding: 2; cellspacing: 0; align: center; border-collapse: collapse">
						<tr align="center" bgcolor="#e9e9e9" height="120%">
							<td width="5%">번 호</td>
							<td width="60%">내용</td>
							<td width="15%">이 름</td>
							<td width="17%">날 짜</td>
							<td width="3%">삭제</td>
						</tr>
						<%
							for (int i = 0; i < vlist.size(); i++) {
									ReplyBean bean = vlist.get(i);
									int reply_idx = bean.getIdx();
									String name = bean.getName();
									String content = bean.getContent();
									Timestamp regdate = bean.getReg_date();
						%>
						<tr>
							<td align="center"><%=i + 1%></td>
							<td><pre><%=content%></pre></td>
							<td align="center"><%=name%></td>
							<td align="center"><%=regdate%></td>
							<td align="center"><a
								href="main.jsp?pagefile=delete_reply.jsp?nowPage=<%=nowPage%>&num=<%=board_idx%>&idx=<%=reply_idx%>">x</a>
						</tr>
						<%
							} //for
						%>
					</table> <%
 	} //if
 %>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>