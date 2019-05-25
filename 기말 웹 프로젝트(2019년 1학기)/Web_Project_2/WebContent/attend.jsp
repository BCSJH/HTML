<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> 회원 정보 표시 </title>
</head>
<body>
<table>
<tr>
<td>학번
<td>이름
<td>날짜
<td>출석 여부

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
conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
String sql= "select * from attend_check_s";
pstmt=conn.prepareStatement(sql);
rs=pstmt.executeQuery();
%>
<%
out.print(rs.getRow());
while(rs.next()){
	String userID= rs.getString("userID");
	String userName= rs.getString("userName");
	Timestamp date= rs.getTimestamp("date");
	String check= rs.getString("check");
	%>		<tr>
			<td><%=userID%>
			<td><%=userName%>
			<td><%=date.toString()%>
			<!-- 출력을 해보았을 때 한 줄만 가져옴... 왜? 모르겠어!! -->
	<%
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
				out.print("출석")	;
			}
			else if(check.equals("1")){
				out.print("지각")	;
			}
			else if(check.equals("2")){
				out.print("결석")	;
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
}finally{
if(rs != null)
try{rs.close();}catch(SQLException sqle){}
if(pstmt != null)
try{pstmt.close();}catch(SQLException sqle){}
if(conn != null)
try{conn.close();}catch(SQLException sqle){}
}
%>
</table>
</body>
</html>