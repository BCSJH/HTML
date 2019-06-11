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
			//아이디와 비밀번호 가져오기
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			
			int count = 0;// DB에 몇 개의 튜플이있는지 확인
			int count_2 = 0;//존재하지 않는 아이디인지 확인하기 위한 변수

			//디비연동에 필요한 변수
			boolean flag = false;
			Connection conn = null;
			PreparedStatement pstmt=null;
			ResultSet rs = null;

			try{
				//디비 연동
				String jdbcUrl="jdbc:mysql://localhost:3306/attend_check?serverTimezone=UTC";
				String dbId="root";
				String dbPass="test1234";
				Class.forName("com.mysql.jdbc.Driver");
				conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
				String sql= "select * from attend_info";
				pstmt=conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				//튜플의 개수 구하기

				while(rs.next())//쿼리 한줄씩 가져오기
				{
					String userID= rs.getString("userID");
					String userPassword= rs.getString("userPassword");
				//아이디와 비밀번호 비교하기
				//아이디와 비밀번호가 맞을 경우
				if(id.equals(userID) && pwd.equals(userPassword)){
					session.setAttribute("id", id);//아이디값을 세션으로 저장해줌
					out.print("<script>alert('로그인에 성공했습니다.'); location.href='template.jsp';</script>");
					}

				//아이디는 존재하는데 비밀번호가 틀릴경우
				else if(id.equals(userID)){
						if(!pwd.equals(userPassword))
							out.print("<script>alert('비밀번호가 틀렸습니다.'); location.href='template.jsp';</script>");
					}

				}
				out.print("<script>alert('존재하지 않는 아이디입니다.'); location.href='template.jsp';</script>");
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

			
			
			
			
			
			
			//response.sendRedirect("template.jsp");//template.jsp로 리다이렉트해줌
		%>
	</div>
</body>
</html>