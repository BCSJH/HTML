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
h1 {
	text-align: center;
}
table.ex1 {
	width: 98%;
	margin: 0 auto;
	text-align: left;
}

ex1.td {
	width: 10%;
	padding: 10px 30px 30px 30px;
}

table.ex2 {
	width: 98%;
	margin: 0 auto;
	text-align: center;
}

ex2.th {
	
}
</style>
<meta charset="EUC-KR">
<title>교수 출석 체크</title>
<%
	String id = "" ;
	String name = "";
	String major ="";
	String m = "";
	int count = 0;
%>
</head>
<body>
<br><br>
<h1><b>머신러닝프로그래밍</b></h1>
<br><br>
<table class="ex1">
	<tr>
		<td>
			학년도 : 2019
		</td>
		<td>
			강좌번호 : IC138-A
		</td>
		<td>
			이수구분 : 전공 선택
		</td>
		<td>
			교수명 : 박현희
		</td>
	</tr>
	<tr>
		<td>
			학기 : 1
		</td>
		<td>
			교과목명 : 머신러닝프로그래밍
		</td>
		<td>
			학점 :3
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
			rs.first();
			while(rs.next()){
				m = rs.getString("m");
				if("1".equals(m))
				{
					count++;
				}
			}

			rs.first();	
		%>
		<td>
			수강인원  : <%=count%>			
		</td>
	</tr>
</table>

				
		<form method="post" action="insertPro_professor3.jsp">
		<table class="ex2">
			<tr>
			<th style="background-color: #e9e9e9; text-align: center;">학번</th>
			<th style="background-color: #e9e9e9; text-align: center;">이름</th>
			<th style="background-color: #e9e9e9; text-align: center;">학과</th>
			<th style="background-color: #e9e9e9; text-align: center;">출석 날짜</th>
			<th style="background-color: #e9e9e9; text-align: center;">출석 여부</th>	

		<% 
			while(rs.next()){
				id = rs.getString("userID");
				name = rs.getString("userName");
				major = rs.getString("userMajor");
				m = rs.getString("m");
				if(id.equals("1234")){
					continue;
				}
				if("1".equals(m))
				{
				 %>
					<tr>
						<td>
						<!-- 
							hidden input 만들어서 그 value값에 넣어서 전송하는 방식으로 하기 
							여기서 중요한 것 전체적으로 보내야한다는 것
						-->
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
							<option value="0" selected="selected">출석</option>
							<option value="1">지각</option>
							<option value="2">결석</option>
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
							<input type="submit" value="입력완료">
						</td>
						<td>
							<input type="reset" value="다시 작성">
						</td>
					</tr>
</table>

</form>
</body>
</html>