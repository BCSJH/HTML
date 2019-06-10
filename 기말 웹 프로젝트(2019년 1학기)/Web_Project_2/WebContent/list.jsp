<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="java.util.Vector"%>
<%@page import="Board.BoardBean"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="Board.*"%>
<%@page import="java.util.Date"%>
<%@ page import="java.sql.*,java.text.SimpleDateFormat,java.util.Date"%>


<jsp:useBean id="bMgr" class="Board.BoardMgr" />

<%
	//���� �߰�
	//�������� �Խ��ǿ��� �������� ��� �۾��� ����� ���� ����
	String id = (String)session.getAttribute("id");


	request.setCharacterEncoding("EUC-KR");
	int totalRecord = 0; //��ü���ڵ��
	int numPerPage = 10; // �������� ���ڵ� ��
	int pagePerBlock = 15; //���� ��������
	int totalPage = 0; //��ü ������ ��
	int totalBlock = 0; //��ü ����
	int nowPage = 1; // ����������
	int nowBlock = 1; //�����
	int start = 0; //����� select ���۹�ȣ
	int end = 10; //���۹�ȣ�� ���� ������ select ����
	int listSize = 0; //���� �о�� �Խù��� ��
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
	totalPage = (int) Math.ceil((double) totalRecord / numPerPage); //��ü��������
	nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock); //����� ���
	totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock); //��ü�����
	

	
	
%>

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<meta name="viewport" content="width=device-width" initial-scale="1">

<!-- ��Ÿ�Ͻ�Ʈ ����  -->

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
	
	//���� ����
	
	function check() {
		if (document.searchFrm.keyWord.value == "") {
			alert("�˻�� �Է��ϼ���.");
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

			<a class="navbar-brand" >�ѱ������� �⼮Ȯ�� ����Ʈ   �Խ���</a>

		</div>

		<div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">

			<ul class="nav navbar-nav">

				

				<li class="active"><a href="main.jsp?pagefile=list">�Խ���</a></li>

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
						listSize = vlist.size();//������ ȭ�鿡 ������ �Խù�����
						if (vlist.isEmpty()) {
							out.println("��ϵ� �Խù��� �����ϴ�.");
						} else {
					%>
					<table style=" border:1px solid #dddddd" class="table table-condensed table-hover"> 
						<tr >
							<td style="background-color: #e9e9e9; text-align: center;" width="10%">�� ȣ</td>
							<td style="background-color: #e9e9e9; text-align: center;" width="50%">�� ��</td>
							<td style="background-color: #e9e9e9; text-align: center;" width="15%">�� ��</td>
							<td style="background-color: #e9e9e9; text-align: center;" width="15%">�� ¥</td>
							<td style="background-color: #e9e9e9; text-align: center;" width="10%">��ȸ��</td>
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
							<!-- ���� ���� && �� ���� -->
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
					<!-- ����¡ �� �� ó�� Start--> <%
 	int pageStart = (nowBlock - 1) * pagePerBlock + 1; //�ϴ� ������ ���۹�ȣ
 	int pageEnd = ((pageStart + pagePerBlock) <= totalPage) ? (pageStart + pagePerBlock) : totalPage + 1;
 	//�ϴ� ������ ����ȣ
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
 %> <!-- ����¡ �� �� ó�� End-->
				</td>
				<td align="right">
				
				<!-- ���� �߰� -->
				<%if("1234".equals(id)){//�������Ϳ����� ���� ����
					
				}
				else{%>
				
				<!-- ���� ���� -->
					<button type="submit" class="btn btn-primary" Onclick="location='main.jsp?pagefile=post'">�۾���</button>
				<%}%>

				<!-- ���� ���� -->
				<a href="main.jsp?pagefile=list" class="btn btn-default">ó������</a>
				
				
				</td>
				
			</tr>
		</table>
		
		
		<hr width="960" />
		<form name="searchFrm" method="get" action="list.jsp">
		
		
		
			<table style="width: 960; cellpadding: 4; cellspacing: 0">
				<tr>
					<td align="center" valign="bottom">
					
					
					<select name="keyField" size="1">
							<option value="mem_name">�� ��</option>
							<option value="title">�� ��</option>
							<option value="content">�� ��</option>
					</select> 
					
					
					<input size="16" name="keyWord"> <input type="button" value="ã��" onClick="javascript:check()"> 
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
	
	
	<!-- �ִϸ��̼� ��� JQUERY -->

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

	<!-- ��Ʈ��Ʈ�� JS  -->

	<script src="js/bootstrap.js"></script>


</body>
</html>