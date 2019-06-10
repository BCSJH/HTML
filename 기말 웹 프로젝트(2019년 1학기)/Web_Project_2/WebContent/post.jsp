<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.*" %>

<html>
<head>
<title>JSP Board</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div align="center">
		<br />
		<br />
		<table style="width: 960; cellpadding: 3;">
			<tr>
				<td bgcolor="e9e9e9" height="25" align="center">글쓰기</td>
			</tr>
		</table>
		<br />
		<form name="postFrm" method="post" enctype="multipart/form-data" action="postProc.jsp" >
			<table style="width: 960; cellpadding: 3; align: center">
				<tr>
					<td align=center>
						<table style="width: 960; cellpadding: 3; align: center">
							<tr>
								<td width="10%">성 명</td>
		<%
			String id = (String)session.getAttribute("id");//로그인한 아이디의 학번 가져오기
			
			//디비연동을 위한 변수들
			boolean flag = false;
			Connection conn = null;
			boolean check = false;
			String userName = "";
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
				rs=pstmt.executeQuery();//쿼리 가져오기
				
				
				//학번을 통해 이름을 찾기
				while(rs.next()){	
					String userID = rs.getString("userID");//쿼리 한줄한줄 가져오기
					//현재 ID와 같은 userID를 찾는다면 Name을 출력해주기
					if(id.equals(userID)){
						userName = rs.getString("userName");
					}
				}
				out.print(userName);
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
								<td width="90%"><input type="hidden" name="mem_name" size="10"
									maxlength="8" value="<%=userName%>"><%=userName%></td>
							</tr>

							<tr>
								<td>제 목</td>
								<td><input name="title" size="50" maxlength="30"></td>
							</tr>


							<tr>
								<td>내 용</td>
								<td><textarea name="content" rows="10" cols="50"></textarea></td>
							</tr>
							<tr>
								<td>비밀 번호</td>
								<td><input type="password" name="pass" size="15"
									maxlength="15"></td>
							</tr>
							<tr>
								<td>파일찾기</td>
								<td>
								<input type="file" name="filename" size="50" maxlength="50">
								</td>
							</tr>
							<tr>
								<td>내용타입</td>
								<td>HTML<input type=radio name="contentType" value="HTTP">&nbsp;&nbsp;&nbsp;
									TEXT<input type=radio name="contentType" value="TEXT" checked>
								</td>
							</tr>

							<tr>
								<td colspan="2"><hr /></td>
							</tr>
							<tr>
								<td colspan="2"><input type="submit" value="등록"> <input
									type="reset" value="다시쓰기"> <input type="button"
									value="리스트" onClick="javascript:location.href='main.jsp?pagefile=list'">
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
		</form>
	</div>l
</body>
</html>