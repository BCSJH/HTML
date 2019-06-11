<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import = "java.sql.*" %>
	<%@ page import = "java.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원수정</title>
</head>
<body>

	<div>
		<%
			String id = (String)session.getAttribute("id");
			if (session.getAttribute("id")==null) { //id가 null이면
		%>
				로그인을 해주세요.
		<%
			} 
			else if(id.equals("1234")) { //id가 null이면
				%>
				관리자 영역입니다.
				<%
					} 
			else { //id가 null이 아니면 
		%>
			회원 수정
			<%
			//디비연동에 필요한 변수
			boolean flag = false;
			Connection conn = null;
			PreparedStatement pstmt=null;
			ResultSet rs = null;
			
			//디비연동
			try{
				String jdbcUrl="jdbc:mysql://localhost:3306/attend_check?serverTimezone=UTC";
				String dbId="root";
				String dbPass="test1234";
				Class.forName("com.mysql.jdbc.Driver");
				conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
				String sql= "select * from attend_info";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				
				//쿼리 한줄씩 가져오기
				while(rs.next()){	
					if (id.equals("1234")){//관리자일 경우
						String userID= rs.getString("userID");
						String userPassword= rs.getString("userPassword");
						String userName= rs.getString("userName");
						String userGender= rs.getString("userGender");
						String userMajor= rs.getString("userMajor");

						%>
						<form method="post" action="info_change_db.jsp" name="info_change" onsubmit="return checkValue()">
        
						<table>
							<tr>
							<td id="title">학번</td><td><%=userID%> (학번은 수정할 수 없습니다.)
							
							<tr>
							<td>기존 비밀번호</td>
							<td><input type="password" name="password" maxlength="50"></td>
							
							<tr>
							<td id="title">변경 비밀번호</td>
							<td><input type="password" name="new_password" maxlength="50"></td>
							
							<tr>
                   				<td id="title">이름</td>
                    			<td><input type="text" name="name" maxlength="50" placeholder="<%=userName%>"></td>
                			
                			<tr>
								<td id="title">성별</td>
								<%if (userGender.equals("남")){%>
									<td>
										<input type="radio" name="gender" value="남" checked>남
										<input type="radio" name="gender" value="여" >여
									</td>
									<%
								} else{%>
								<td>
									<input type="radio" name="gender" value="남">남
									<input type="radio" name="gender" value="여" checked>여
								</td>
							<%} %>
							<tr>
								<td id="title">학과</td>
                   				 <td>
                        			<select name="major">
                            		<option>신학과</option>
                            		<option>영유아보육학과</option>
                            		<option>컴퓨터소프트웨어학과</option>
                            		<option>사회복지학과</option>
                            		<option>간호학과</option>                        
                        			</select>
                    			</td>
						</table>
						</form>
					<% }
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
		<%
			}
		%>
	</div>
</body>
</html>