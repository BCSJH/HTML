<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import = "java.sql.*" %>
	<%@ page import = "java.*" %>
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
	
	<!-- 	
	<td>4/2</td>
	<td>4/3</td>
	<td>4/4</td>
	<td>4/5</td>
	<td>4/8</td>
	<td>4/9</td>
	<td>4/10</td>
	<td>4/11</td>
	<td>4/12</td>
	
	<td>4/15</td>
	<td>4/16</td>
	<td>4/17</td>
	<td>4/18</td>
	<td>4/19</td>
	
	<td>4/22</td>
	<td>4/23</td>
	<td>4/24</td>
	<td>4/25</td>
	<td>4/26</td>
	
	<td>4/29</td>
	<td>4/30</td>
	<td>4/31</td>		
	</tr>
	 -->
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
							<%=id %>
						</td>
						
						<td>
							<%=name %>
						</td>
						
						<td>
							시간</td>
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