<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<style>
h1 {
	text-align: center;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> 회원 정보 표시 </title>
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

String sql= "select * from attend_check_s2";
pstmt=conn.prepareStatement(sql);
rs=pstmt.executeQuery();
%>
<%

if (session.getAttribute("id")!= null) {
%>
<br><br>
<h1><b>머신러닝프로그래밍</b></h1>
<br><br>
	<table style="border: 1px solid #dddddd; width:80%; margin:0 auto;" class="table table-condensed table-hover">
		<tr>
			<td style="background-color: #e9e9e9; text-align: center;">학번
			<td style="background-color: #e9e9e9; text-align: center;">이름
			<td style="background-color: #e9e9e9; text-align: center;">날짜
			<td style="background-color: #e9e9e9; text-align: center;">출석 여부
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
					out.print("출석")	;
					attend++;
				}
				else if(check.equals("1")){
					out.print("지각")	;
					late++;
				}
				else if(check.equals("2")){
					out.print("결석")	;
					absent++;
				}
				else{
					out.print("");
				}
				%>
			</tr>
			
<% 
		}
	
	}
%>
			<tr>
				<td>
					출석 : <%=attend%><br>
					지각 : <%=late%><br>
					결석 : <%=absent%><br>
				</td>
				<td>
				<% 

				%>
				</td>
			</tr>
</table>
<%
}
else{
	%>
	웹 수강 신청한 학생만 이용 가능합니다.
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