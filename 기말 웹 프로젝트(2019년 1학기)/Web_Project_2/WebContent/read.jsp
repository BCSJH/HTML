<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="Board.BoardBean"%>
<%@page import="java.sql.Timestamp"%>
<jsp:useBean id="bMgr" class="Board.BoardMgr" />
<%
request.setCharacterEncoding("EUC-KR");
int num = Integer.parseInt(request.getParameter("num"));
String nowPage = request.getParameter("nowPage");
String keyField = request.getParameter("keyField");
String keyWord = request.getParameter("keyWord");
bMgr.upCount(num);//조회수 증가
BoardBean bean = bMgr.getBoard(num);//게시물 가져오기
String name = bean.getMem_name();
String title = bean.getTitle();
Timestamp reg_date = bean.getReg_date();
String content = bean.getContent();
String ip = bean.getIp();
int count = bean.getCount();
String filename = bean.getFilename();
int filesize = bean.getFilesize();
session.setAttribute("bean", bean);//게시물을 세션에 저장
%>
<html>
<head>
<title>JSP Board</title>
<link href="style.css" rel="stylesheet" type="text/css">




<script type="text/javascript">
function list() {
document.listFrm.submit();
}
function down(filename) {
document.downFrm.filename.value = filename;
document.downFrm.submit();
}
</script>
</head>
<body>




<div align="center">
	<br/> <br/>
		<table style="width: 960; cellpadding: 3;">
		<tr>
			<td style="background-color: #e9e9e9; height: 30px;" align="center">글읽기</td>
		</tr>
		
		<tr>
			<td colspan="2">
				<table style="cellpadding: 3; cellspacing: 0; width: 100%">
				<tr>
					<td align="center" bgcolor="#DDDDDD" width="10%">이 름</td>
					<td><%=name%></td>
					<td align="center" bgcolor="#DDDDDD" width="10%">등록날짜</td>
					<td><%=reg_date%></td>
				</tr>
		<tr>
			<td align="center" bgcolor="#DDDDDD">제 목</td>
			<td colspan="3"><%=title%></td>
		</tr>
		
		<tr>
			<td align="center" bgcolor="#DDDDDD">첨부파일</td>
			<td colspan="3">
			<%
			if (filename != null && !filename.equals("")) {
			%> 
				<a href="javascript:down('<%=filename%>')"><%=filename%></a>
				&nbsp;&nbsp;<font color="blue">(<%=filesize%>KBytes)</font> 
			<%
			} else {
			%> 등록된 파일이 없습니다.<%
			}
			%>
			</td>
		</tr>
		<tr>
<td colspan="4"><br /> <pre><%=content%></pre><br /></td>
</tr>
<tr>
<td colspan="4" align="right"> 조회수 <%=count%>

</td>


</tr>
</table>
</td>
</tr>


<tr>
<td align="center" colspan="2">
<hr/>
<hr/> [ <a href="main.jsp?pagefile=list">리스트</a> | 

  
<!-- 정현 수정 -->
<<a href="main.jsp?pagefile=update&nowPage=<%=nowPage%>&num=<%=num%>">수 정</a> | 
<a href="main.jsp?pagefile=delete&nowPage=<%=nowPage%>&num=<%=num%>">삭 제</a> ]<br />
</td></tr>
</table>

<form name="listFrm" method="post" action="list.jsp">
<input type="hidden" name="nowPage" value="<%=nowPage%>">
	<%if (!(keyWord == null || keyWord.equals(""))) {%>
		<input type="hidden" name="keyField" value="<%=keyField%>"> 
		<input type="hidden" name="keyWord" value="<%=keyWord%>">
	<%}%>
</form>

<!-- 다운로드 페이지 이동 -->
<form name="downFrm" action="download.jsp" method="post">
	<input type="hidden" name="filename">
</form>
</div>
</body>
</html>