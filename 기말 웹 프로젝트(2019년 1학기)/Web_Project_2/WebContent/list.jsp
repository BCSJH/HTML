<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="java.util.Vector"%>
<%@page import="Board.BoardBean"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="Board.*"%>
<%@page import="java.util.Date"%>
<%@ page import="java.sql.*,java.text.SimpleDateFormat,java.util.Date"%>


<jsp:useBean id="bMgr" class="Board.BoardMgr" />

<%
	//정현 추가
	//성적이의 게시판에서 관리자의 경우 글쓰기 기능을 막기 위해
	String id = (String)session.getAttribute("id");


	request.setCharacterEncoding("EUC-KR");
	int totalRecord = 0; //전체레코드수
	int numPerPage = 10; // 페이지당 레코드 수
	int pagePerBlock = 15; //블럭당 페이지수
	int totalPage = 0; //전체 페이지 수
	int totalBlock = 0; //전체 블럭수
	int nowPage = 1; // 현재페이지
	int nowBlock = 1; //현재블럭
	int start = 0; //디비의 select 시작번호
	int end = 10; //시작번호로 부터 가져올 select 갯수
	int listSize = 0; //현재 읽어온 게시물의 수
	String keyWord = "", keyField = "";
	Vector<BoardBean> vlist = null;

	if (request.getParameter("keyWord") != null) {
		keyWord = request.getParameter("keyWord");
		keyField = request.getParameter("keyField");
	}
	if (request.getParameter("reload") != null) {
		if (request.getParameter("reload").equals("true")) {
			keyWord = "";
			keyField = "";
		}
	}
	if (request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	start = (nowPage * numPerPage) - numPerPage;
	end = numPerPage;
	totalRecord = bMgr.getTotalCount(keyField, keyWord);
	totalPage = (int) Math.ceil((double) totalRecord / numPerPage); //전체페이지수
	nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock); //현재블럭 계산
	totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock); //전체블럭계산
	

	
	
%>

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<meta name="viewport" content="width=device-width" initial-scale="1">

<!-- 스타일시트 참조  -->

<link rel="stylesheet" href="css/bootstrap.css">


<title>JSP Board</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">

/*
	function list() {
		document.listFrm.action = "list.jsp";
		document.listFrm.submit();
	}*/
	
	function pageing(page) {
		document.readFrm.nowPage.value = page;
		document.readFrm.submit();
	}
	function block(value) {
		document.readFrm.nowPage.value =
<%=pagePerBlock%>
	* (value - 1) + 1;
		document.readFrm.submit();
	}
	
	//정현 수정
	
	function check() {
		if (document.searchFrm.keyWord.value == "") {
			alert("검색어를 입력하세요.");
			document.searchFrm.keyWord.focus();
			return;
		}
		document.searchFrm.submit();
	}
</script>
</head>

<body>


<nav class="navbar navbar-default">

		<div class="navbar-header">

			<button type="button" class="navbar-toggle collapsed"

				data-toggle="collapse" data-target="bs-example-navbar-collapse-1"

				aria-expaned="false">

				<span class="icon-bar"></span> <span class="icon-bar"></span> <span

					class="icon-bar"></span>

			</button>

			<a class="navbar-brand" >한국성서대 출석확인 사이트   게시판</a>

		</div>

		<div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">

			<ul class="nav navbar-nav">

				

				<li class="active"><a href="main.jsp?pagefile=list">게시판</a></li>

			</ul>

</nav>





	<div align="center">
		<br />
		
		<br />
<table style="align: center; width: 960;">		
	<tr>
				<td>Total : <%=totalRecord%>Articles(<font color="red">
						<%=nowPage%>/<%=totalPage%>Pages
				</font>)
				</td>
			</tr>
		</table>
		<table style="width: 960; cellpadding: 3; align: center">
			<tr>
				<td align="center" colspan="2">
					<%
						vlist = bMgr.getBoardList(keyField, keyWord, start, end);
						listSize = vlist.size();//브라우저 화면에 보여질 게시물갯수
						if (vlist.isEmpty()) {
							out.println("등록된 게시물이 없습니다.");
						} else {
					%>
					<table style=" border:1px solid #dddddd" class="table table-condensed table-hover"> 
						<tr >
							<td style="background-color: #e9e9e9; text-align: center;" width="10%">번 호</td>
							<td style="background-color: #e9e9e9; text-align: center;" width="50%">제 목</td>
							<td style="background-color: #e9e9e9; text-align: center;" width="15%">이 름</td>
							<td style="background-color: #e9e9e9; text-align: center;" width="15%">날 짜</td>
							<td style="background-color: #e9e9e9; text-align: center;" width="10%">조회수</td>
						</tr>

						<%
							for (int i = 0; i < numPerPage; i++) {
									if (i == listSize)
										break;
									BoardBean bean = vlist.get(i);
									int num = bean.getIdx();
									String name = bean.getMem_name();
									String title = bean.getTitle();
									Timestamp regdate = bean.getReg_date();
									int count = bean.getCount();
						%>
						<tr height="120%">
							<td align="center"><%=totalRecord - ((nowPage - 1) * numPerPage) - i%>
							</td>
							<td>
							<% 
							
							java.text.SimpleDateFormat sf = new java.text.SimpleDateFormat("yyyy-MM-dd");

							String inputDate = sf.format(regdate);

							String now = sf.format(new java.util.Date());
							

							String mark = "";
							
							
							%> 
							<!-- 정현 수정 && 모세 도움 -->
							<a href="main.jsp?pagefile=read&num=<%=num%>"><%=title%> 
							<% 
							
							
								if(inputDate.equals(now)){ 
							%> 
								<img src="new.jpg" border=0> 
							<% 
								}
							
							//document.write("<img src='" + opener.fr.picture.value + "'>");
							%>
							
							
														
							
							</a> 
 							</td>
							<td align="center"><%=name%></td>
							<td align="center"><%=regdate%></td>
							<td align="center"><%=count%></td>
						</tr>
						<%
							} //for
						%>
					</table> <%
 	} //if
 %>
				</td>
			</tr>
			<tr>
				<td colspan="2"><br /> <br /></td>
			</tr>

			<tr>
				<td>
					<!-- 페이징 및 블럭 처리 Start--> <%
 	int pageStart = (nowBlock - 1) * pagePerBlock + 1; //하단 페이지 시작번호
 	int pageEnd = ((pageStart + pagePerBlock) <= totalPage) ? (pageStart + pagePerBlock) : totalPage + 1;
 	//하단 페이지 끝번호
 	if (totalPage != 0) {
 		if (nowBlock > 1) {
 %> <a href="javascript:block('<%=nowBlock - 1%>')">prev...</a> <%
 	}
 %>&nbsp; <%
 	for (; pageStart < pageEnd; pageStart++) {
 %> <a href="javascript:pageing('<%=pageStart%>')"> <%
 	if (pageStart == nowPage) {
 %><font color="blue"> <%
 	}
 %> [<%=pageStart%>] <%
 	if (pageStart == nowPage) {
 %></font> <%
 	}
 %></a> <%
 	} //for
 %>&nbsp; <%
 	if (totalBlock > nowBlock) {
 %> <a href="javascript:block('<%=nowBlock + 1%>')">.....next</a> <%
 	}
 %>&nbsp; <%
 	}
 %> <!-- 페이징 및 블럭 처리 End-->
				</td>
				<td align="right">
				
				<!-- 정현 추가 -->
				<%if("1234".equals(id)){//널포인터오류를 막기 위해
					
				}
				else{%>
				
				<!-- 정현 수정 -->
					<button type="submit" class="btn btn-primary" Onclick="location='main.jsp?pagefile=post'">글쓰기</button>
				<%}%>

				<!-- 정현 수정 -->
				<a href="main.jsp?pagefile=list" class="btn btn-default">처음으로</a>
				
				
				</td>
				
			</tr>
		</table>
		
		
		<hr width="960" />
		<form name="searchFrm" method="get" action="list.jsp">
		
		
		
			<table style="width: 960; cellpadding: 4; cellspacing: 0">
				<tr>
					<td align="center" valign="bottom">
					
					
					<select name="keyField" size="1">
							<option value="mem_name">이 름</option>
							<option value="title">제 목</option>
							<option value="content">내 용</option>
					</select> 
					
					
					<input size="16" name="keyWord"> <input type="button" value="찾기" onClick="javascript:check()"> 
					<input type="hidden" name="nowPage" value="1"></td>
				</tr>
			</table>
			
			
		</form>
		<form name="listFrm" method="post">
			<input type="hidden" name="reload" value="true"> 
			<input type="hidden" name="nowPage" value="1">
		</form>
		<form name="readFrm" method="get">
			<input type="hidden" name="num"> <input type="hidden"
				name="nowPage" value="<%=nowPage%>"> <input type="hidden"
				name="keyField" value="<%=keyField%>"> <input type="hidden"
				name="keyWord" value="<%=keyWord%>">
		</form>
		
		
		
	</div>
	
	
	<!-- 애니매이션 담당 JQUERY -->

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

	<!-- 부트스트랩 JS  -->

	<script src="js/bootstrap.js"></script>


</body>
</html>