<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import = "java.sql.*" %>
	<%@ page import = "java.*" %>
	<%@page import="java.util.Date" %>
    <%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
		table.ex1 {
		width:98%;
		margin:0 auto;
		text-align:left;
		}
		ex1.td{
		width:10%;
		padding:10px 30px 30px 30px;
		}
		table.ex2 {
		width:98%;
		margin:0 auto;
		text-align:center;
		}
		ex2.th{
		}
	</style>
<meta charset="EUC-KR">
<title>���� �⼮ üũ</title>
<%
	String id = "" ;
	String name = "";
	String major ="";
	String o ="";
	int count = 0;
%>
</head>
<body>
<h1>�ü��</h1>
<br>
<table class="ex1">
	<tr>
		<td>
			�г⵵ : 2019
		</td>
		<td>
			���¹�ȣ : IC066-A
		</td>
		<td>
			�̼����� : ���� ����
		</td>
		<td>
			������ : ������
		</td>
	</tr>
	<tr>
		<td>
			�б� : 1
		</td>
		<td>
			������� : �ü��
		</td>
		<td>
			���� :3
		</td>






	 <%
		 
		boolean flag = false;
		Connection conn = null;

		PreparedStatement pstmt=null;
		ResultSet rs = null;
%>
		<!-- <form method="post" action="insertPro_professor.jsp"> -->

		<%
	 try{
			String jdbcUrl="jdbc:mysql://localhost:3306/attend_check?serverTimezone=UTC";
			String dbId="root";
			String dbPass="test1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
			String sql= "select * from attend_info";
			pstmt=conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				o = rs.getString("o");
				if("1".equals(o))
				{
					count++;
				}
			}
			rs.first();
		%>
		<td>
			�����ο�  : <%=count%>			
		</td>
	</tr>
</table>

				<!-- ������ �κ��� ������ϹǷ� -1 -->
		<form method="post" action="insertPro_professor2.jsp">
		<table class="ex2">
			<tr>
			<th>�й�</th>
			<th>�̸�</th>
			<th>�а�</th>
			<th>�⼮ ��¥</th>
			<th>�⼮ ����</th>	
		<% 
			while(rs.next()){
				id = rs.getString("userID");
				name = rs.getString("userName");
				major = rs.getString("userMajor");
				o = rs.getString("o");
				if (id.equals("1234")){
					continue;
				}
				if("1".equals(o))
				{
				 %>
					<tr>
						<td>
							<%=id%>
							<input type="hidden" id="userID" name= "userID" value=<%=id%>>
							
						</td>
						
						<td>
							<%=name%>
							<input type="hidden" id="userName" name= "userName" value="<%=name%>">
													
						</td>
						
						<td>
							<%=major%>
													
						</td>
						
						<td>
							<%
							 Date now = new Date();
							 SimpleDateFormat sf = new SimpleDateFormat("yyyy.MM.dd");
							 String today = sf.format(now);
							%>
							<br>
							<%= today %>
						</td>
						<td>
						<select name="check">
							<option value="0" selected="selected">�⼮</option>
							<option value="1">����</option>
							<option value="2">�Ἦ</option>
						</select>
						</td>
					</tr>
					
					
		<%
				}
			}

			flag = rs.next();
			
		}catch(Exception e){
			e.printStackTrace();
			}finally{
				if(rs != null)
				try{
					rs.close();
				}catch(SQLException sqle){
				}
				if(pstmt != null)
			try{pstmt.close();}catch(SQLException sqle){}
			if(conn != null)
			try{conn.close();}catch(SQLException sqle){}
			}
		%>
		<tr>
						<td>
							<input type="submit" value="�Է¿Ϸ�">
						</td>
						<td>
							<input type="reset" value="�ٽ� �ۼ�">
						</td>
					</tr>
</table>

</form>
</body>
</html>