<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="Board.BoardBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.*" %>
<jsp:useBean id="bMgr" class="Board.BoardMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	int num = Integer.parseInt(request.getParameter("num"));
	String nowPage = request.getParameter("nowPage");
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	bMgr.upCount(num);//��ȸ�� ����
	BoardBean bean = bMgr.getBoard(num);//�Խù� ��������
	String name = bean.getMem_name();
	String title = bean.getTitle();
	Timestamp reg_date = bean.getReg_date();
	String content = bean.getContent();
	String ip = bean.getIp();
	int count = bean.getCount();
	String filename = bean.getFilename();
	int filesize = bean.getFilesize();
	session.setAttribute("bean", bean);//�Խù��� ���ǿ� ����
%>
<html>
<head>
<title>JSP Board</title>
<link href="style.css" rel="stylesheet" type="text/css">



<script type="text/javascript">

//���� ����
function check() {
	//var value = document.getElementById("txt_Value").value;.
	if (document.searchFrm.content.value == "") {
		alert("����� �Է����ּ���.");
		document.searchFrm.content.focus();
		return false;
	}	
	if (document.searchFrm.pass.value == "") {
		alert("��й�ȣ�� �Է����ּ���.");
		document.searchFrm.pass.focus();
		return false;
	}
	document.searchFrm.submit();
}

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
		<br /> <br />
		<table style="width: 960; cellpadding: 3;">
			<tr>
				<td style="background-color: #e9e9e9; height: 30px;" align="center">���б�</td>
			</tr>

			<tr>
				<td colspan="2">
					<table style="cellpadding: 3; cellspacing: 0; width: 100%">
						<tr>
							<td align="center" bgcolor="#DDDDDD" width="10%">�� ��</td>
							<td><%=name%></td>
							<td align="center" bgcolor="#DDDDDD" width="10%">��ϳ�¥</td>
							<td><%=reg_date%></td>
						</tr>
						<tr>
							<td align="center" bgcolor="#DDDDDD">�� ��</td>
							<td colspan="3"><%=title%></td>
						</tr>

						<tr>
							<td align="center" bgcolor="#DDDDDD">÷������</td>
							<td colspan="3">
								<%
									if (filename != null && !filename.equals("")) {
								%> <a href="javascript:down('<%=filename%>')"><%=filename%></a>
								&nbsp;&nbsp;<font color="blue">(<%=filesize%>KBytes)
							</font> <%
 	} else {
 %> ��ϵ� ������ �����ϴ�.<%
 	}
 %>
							</td>
						</tr>
						<tr>
							<td colspan="4"><br /> <pre><%=content%></pre><br /></td>
						</tr>
						<tr>
							<td colspan="4" align="right">��ȸ�� <%=count%>

							</td>


						</tr>
					</table>
				</td>
			</tr>


			<tr> 
				<td align="center" colspan="2">
				<hr /> [ <a href="main.jsp?pagefile=list">����Ʈ</a> | <!-- ���� ���� -->
					
					<a href="main.jsp?pagefile=update&nowPage=<%=nowPage%>&num=<%=num%>">����</a> | 
					<a href="main.jsp?pagefile=delete&nowPage=<%=nowPage%>&num=<%=num%>">����</a> ]<br />
						<!-- ��� -->
		<tr>
			<td><hr />
				<form name="searchFrm" action="replyProc.jsp" method="post">
					<table style="width: 10; cellpadding: 4; align: center">
						<tr>
						<h3>���</h3>
							<td width="20%">�� ��</td>
							<td width="30%">
			<%//���� ����
			String id = (String)session.getAttribute("id");//�α����� ���̵��� �й� ��������
			
			//��񿬵��� ���� ������
			boolean flag = false;
			Connection conn = null;
			boolean check = false;
			String userName = "";
			PreparedStatement pstmt=null;
			ResultSet rs = null;
			
			try{
				//��� ����
				String jdbcUrl="jdbc:mysql://localhost:3306/attend_check?serverTimezone=UTC";
				String dbId="root";
				String dbPass="test1234";
				Class.forName("com.mysql.jdbc.Driver");
				conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
				String sql= "select * from attend_info";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();//���� ��������
				
				
				//�й��� ���� �̸��� ã��
				while(rs.next()){	
					String userID = rs.getString("userID");//���� �������� ��������
					//���� ID�� ���� userID�� ã�´ٸ� Name�� ������ֱ�
					if(id.equals(userID)){
						userName = rs.getString("userName");
					}
				}
				out.print(userName);
				}catch(Exception e){
				e.printStackTrace();
				}finally{
				if(rs != null)
				try{rs.close();}catch(SQLException sqle){}
				if(pstmt != null)
				try{pstmt.close();}catch(SQLException sqle){}
				if(conn != null)
				try{conn.close();}catch(SQLException sqle){}
				}
%>
							
							
							<input type="hidden" name="name" size="10" maxlength="8" value="<%=userName%>"></td>
							<td width="14%">��й�ȣ</td>
							<td width="20%"><input type="password" name="pass" id="pass" size="50"
								maxlength="30"></td>
						</tr>
						<tr>
							<td width="20%">����</td>
							<td colspan="3" width="50%">
								<textarea name="content" rows="3" cols="100"></textarea>
							</td>
							<td width="30%">
								<input type="button" value="����" onClick="check()">
							</td>
						</tr>
					</table>
					<input type="hidden" name="num" value="<%=num%>">
					<input type="hidden" name="nowPage" value="<%=nowPage%>">
					<%
						if (!(keyWord == null || keyWord.equals(""))) {
					%>
					<input type="hidden" name="keyField" value="<%=keyField%>">
					<input type="hidden" name="keyWord" value="<%=keyWord%>">
					<%
						}
					%>
					<jsp:include page="replylist.jsp" />
						<hr />
					
				</td>
			</tr>
		
				</form></td>
		</tr>
		<tr>

		</tr>
		</table>
	

		<!-- �ٿ�ε� ������ �̵� -->
		<form name="downFrm" action="download.jsp" method="post">
			<input type="hidden" name="filename">
		</form>
	</div>

</body>
</html>