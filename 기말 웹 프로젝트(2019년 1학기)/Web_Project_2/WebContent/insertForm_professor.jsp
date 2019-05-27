<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import = "java.sql.*" %>
	<%@ page import = "java.*" %>
	<%@page import="java.util.Date" %>
    <%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>교수 출석 체크</title>
<%
	String id = "" ;
	String name = "";
%>
</head>
<body>
<form method="post" action="insertPro_professor.jsp">
<table>
	<tr>
	<td>학번</td>
	<td>이름</td>
	<td>출석 시간</td>
	<td>출석 여부</td>

	 <%
		 
		String pwd = request.getParameter("pwd");
		boolean flag = false;
		Connection conn = null;

		PreparedStatement pstmt=null;
		ResultSet rs = null;

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
				id = rs.getString("userID");
				name = rs.getString("userName");
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