<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�޴�</title>
</head>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<body>

	<div>
		<%
			String id = (String)session.getAttribute("id");
			if (session.getAttribute("id")==null) { //id�� null�̸�
		%>
				<a href="main.jsp">Ȩ</a><br>
				<a href="main.jsp?pagefile=info_change">��������</a><br>
				<a href="main.jsp?pagefile=schedule"> �а����� </a><br>
				<a href="main.jsp?pagefile=attend"> �⼮Ȯ�� </a><br>
				<a href="main.jsp?pagefile=sign"> �⼮�ȳ��� </a><br>
				<a href="main.jsp?pagefile=board"> �Խ��Ǹ�� </a>
		<%
			} 
			else if(id.equals("1234")) { //id�� null�̸�
				%>
		<a href="main.jsp">Ȩ</a><br>
		<a href="main.jsp?pagefile=info_change">ȸ������</a><br>
		<a href="main.jsp?pagefile=schedule"> �а����� </a><br>
		<a href="main.jsp?pagefile=insertForm_professor"> �⼮üũ </a><br>
		
			&nbsp;&nbsp;<a href="main.jsp?pagefile=insertForm_professor">�� ���ý��ۼ���װ��� </a><br>
			&nbsp;&nbsp;<a href="main.jsp?pagefile=insertForm_professor2">�� �ü�� </a><br>
			&nbsp;&nbsp;<a href="main.jsp?pagefile=insertForm_professor3">�� �ӽŷ��� ���α׷� </a><br>
		<br>
		<a href="main.jsp?pagefile=sign"> �⼮�ȳ��� </a><br>
		<a href="main.jsp?pagefile=board"> �Խ��Ǹ�� </a><br>
			&nbsp;&nbsp;<a href="main.jsp?pagefile=formalobjection">�� ���� ��û �Խ��� </a><br>
			&nbsp;&nbsp;<a href="main.jsp?pagefile=notice">�� ���� �Խ��� </a>				
				
				<%
					} 
			else { //id�� null�� �ƴϸ� 
				%>

				<a href="main.jsp">Ȩ</a><br>
				<a href="main.jsp?pagefile=info_change">��������</a><br>
				<a href="main.jsp?pagefile=schedule"> �а����� </a><br>
				<a href="main.jsp?pagefile=attend"> �⼮Ȯ�� </a><br>
				
				<%
				Connection conn=null;
				PreparedStatement pstmt=null;
				ResultSet rs=null;
				try{
				String jdbcUrl="jdbc:mysql://localhost:3306/attend_check?serverTimezone=UTC";
				String dbId="root";
				String dbPass="test1234";
				Class.forName("com.mysql.jdbc.Driver");
				conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
				String sql= "select * from attend_info";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				
				while(rs.next()){
				String userID= rs.getString("userID");
				String w = rs.getString("w");
				String o = rs.getString("o");
				String m = rs.getString("m");
				if(id.equals(userID))
				{
					if(w.equals("1")){
						%>
						
							&nbsp;&nbsp;<a href="main.jsp?pagefile=attend">�� ���ý��� ����װ��</a><br>
						
						<%	
					}
					if(o.equals("1")){
						%>
						
							&nbsp;&nbsp;<a href="main.jsp?pagefile=attend1">�� �ü��</a><br>
						
						<%	
					}
					if(m.equals("1")){
						%>
						
							&nbsp;&nbsp;<a href="main.jsp?pagefile=attend2">�� �ӽŷ������α׷���</a><br>
						
						<%	
					}
				}
				}	 
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
				<br>
				<a href="main.jsp?pagefile=sign"> �⼮�ȳ��� </a><br>
				<a href="main.jsp?pagefile=board"> �Խ��Ǹ�� </a><br>
				
					&nbsp;&nbsp;<a href="main.jsp?pagefile=formalobjection">�� ���� ��û �Խ��� </a><br>
					&nbsp;&nbsp;<a href="main.jsp?pagefile=notice">�� ���� �Խ��� </a>
				
				<%	
			}
		%>
	</div>
</body>
</html>