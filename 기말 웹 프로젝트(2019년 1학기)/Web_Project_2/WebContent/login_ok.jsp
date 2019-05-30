<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ page import = "java.sql.*" %>
	<%@ page import = "java.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인화면</title>
</head>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<body>
	<div>
		<%
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			boolean flag = false;
			Connection conn = null;
			boolean check = false;
			int check_num = 1;
			PreparedStatement pstmt=null;
			ResultSet rs = null;

			try{
				String jdbcUrl="jdbc:mysql://localhost:3306/attend_check?serverTimezone=UTC";
				String dbId="root";
				String dbPass="test1234";
				Class.forName("com.mysql.jdbc.Driver");
				conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
				String sql= "select * from attend_info where userID = ? and userPassword = ?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString (1, id);
				pstmt.setString (2, pwd);
				rs = pstmt.executeQuery();
				flag = rs.next();
				
				
				if (id.equals(rs.getString("userID")) && pwd.equals(rs.getString("userPassword"))) {
					session.setAttribute("id", id);//아이디값을 세션으로 저장해줌
				}

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

			
			
			
			
			
			
			response.sendRedirect("template.jsp");//template.jsp로 리다이렉트해줌
		%>
	</div>
</body>
</html>