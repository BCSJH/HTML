<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> ȸ�� ���� ǥ�� </title>
</head>
<body>
<table>
<tr>
<td>�й�
<td>�̸�
<td>��¥
<td>�⼮ ����

<%
String userID_2 = (String)session.getAttribute("id");

Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs=null;
try{
String jdbcUrl="jdbc:mysql://localhost:3306/attend_check?serverTimezone=UTC";
String dbId="root";
String dbPass="test1234";
Class.forName("com.mysql.jdbc.Driver");
conn=DriverManager.getConnection(jdbcUrl,dbId,dbPass);

String sql= "select * from attend_check_s";
pstmt=conn.prepareStatement(sql);
rs=pstmt.executeQuery();
%>
<%
while(rs.next()){
	String userID= rs.getString("userID");
	String userName= rs.getString("userName");
	String date= rs.getString("date");
	String check= rs.getString("check");


	if(userID.equals(userID_2)){
		%>
		<tr>
			<td><%=userID%>
			<td><%=userName%>
			<td><%=date.toString()%>
			<td>
			<%
			if(check.equals("0"))
			{
				out.print("�⼮")	;
			}
			else if(check.equals("1")){
				out.print("����")	;
			}
			else if(check.equals("2")){
				out.print("�Ἦ")	;
			}
			else{
				out.print("");
			}
			%>
		</tr>
<% 
	}
	
 }
}catch(Exception e){
e.printStackTrace();
out.print("����");
}finally{
if(rs != null)
try{rs.close();}catch(SQLException sqle){
	out.print("����?");
}
if(pstmt != null)
try{pstmt.close();}catch(SQLException sqle){
	out.print("����??");
}
if(conn != null)
try{conn.close();}catch(SQLException sqle){
	out.print("����???");
}
}
%>
</table>
</body>
</html>