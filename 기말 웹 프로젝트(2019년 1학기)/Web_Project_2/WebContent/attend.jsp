<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> ȸ�� ���� ǥ�� </title>
</head>
<body>


<%
String userID_2 = (String)session.getAttribute("id");

int late = 0;
int absent = 0;
int attend = 0;

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

if (session.getAttribute("id")!= null) {
%>
	<table>
		<tr>
			<td>�й�
			<td>�̸�
			<td>��¥
			<td>�⼮ ����
		</tr>
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
					attend++;
				}
				else if(check.equals("1")){
					out.print("����")	;
					late++;
				}
				else if(check.equals("2")){
					out.print("�Ἦ")	;
					absent++;
				}
				else{
					out.print("");
				}
				%>
			</tr>
			<tr>
				<td>
					�⼮ : <%=attend%><br>
					���� : <%=late%><br>
					�Ἦ : <%=absent%><br>
				</td>
				<td>
				<% 

				%>
				</td>
			</tr>
<% 
		}
	
	}
%>
</table>
<%
}
else{
	%>
	�� ���� ��û�� �л��� �̿� �����մϴ�.
	<%
}
}catch(Exception e){
e.printStackTrace();

}finally{
if(rs != null)
try{rs.close();}catch(SQLException sqle){

}
if(pstmt != null)
try{pstmt.close();}catch(SQLException sqle){

}
if(conn != null)
try{conn.close();}catch(SQLException sqle){

}
}
%>
</body>
</html>