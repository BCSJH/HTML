<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="Board.BoardBean"%>
<%@page import="Board.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.*"%>
<!DOCTYPE html>
<html>
<head>
<style>
#center1{
		text-align: center;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<meta name="viewport" content="width=device-width" initial-scale="1">

<!-- 스타일시트 참조  -->

<link rel="stylesheet" href="css/bootstrap.css">
<meta charset="EUC-KR">
<title>회원수정</title>

</head>
<body>
	<div id="center1">
		<%
			String id = (String)session.getAttribute("id");
			String userPassword = "";
			if (session.getAttribute("id")==null) { //id가 null이면 <- 로그인을 하지 않았을 경우
		%>
		로그인을 해주세요.
		<%
			} 
			else if(id.equals("1234")) { //id가 null이면
				%>

		<br>
		<br>
		<h1><b>회원 관리</b></h1>
		<br>
		<br>
		<%
				boolean flag = false;
				Connection conn = null;
				boolean check = false;
				PreparedStatement pstmt=null;
				ResultSet rs = null;
				try{
					String jdbcUrl="jdbc:mysql://localhost:3306/attend_check?serverTimezone=UTC";
					String dbId="root";
					String dbPass="test1234";
					Class.forName("com.mysql.jdbc.Driver");
					conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass);
					String sql= "select * from attend_info";
					pstmt=conn.prepareStatement(sql);
					rs=pstmt.executeQuery();
					%>
		<form method="post" action="info_change_Pro_db.jsp" id="info_change"
			name="info_change">
			<table style="border: 1px solid #dddddd; width:80%; margin:0 auto;" class="table table-condensed table-hover">
				<tr>
					<th style="background-color: #e9e9e9; text-align: center;" width="10%">체크</th>
					<th style="background-color: #e9e9e9; text-align: center;" width="40%">학번</th>
					<th style="background-color: #e9e9e9; text-align: center;" width="20%">이름</th>
					<th style="background-color: #e9e9e9; text-align: center;" width="30%">전공</th>
				</tr>
				<%
					while(rs.next()){	
							String userID= rs.getString("userID");
							String userName= rs.getString("userName");
							String userMajor= rs.getString("userMajor");
							if (userID.equals("1234")){
								continue;
							}
							%>
				<tr>
					<td style="text-align: center"><input type="checkbox"
						id="userID" name="userID" value="<%=userID%>"></td>
					<td style="text-align: center"><%=userID%></td>
					<td style="text-align: center"><%=userName%></td>
					<td style="text-align: center"><%=userMajor%></td>
				</tr>
				<% 
						}
					%>
			</table>
		<br>
		<br>
			<input type="submit" value="관리" /> <input type="reset" value="취소">
		</form>
		<%
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
					
				
			}
			
			//id가 null이 아니면 즉 관리자 영역이 아닌 아이디로 로그인 되어있다면
			else {//id가 null이 아니면 
		%>
		<br>
		<br>
		<h1><b>회원 수정</b></h1>
		<br>
		<br>
		<%
			//디비 연동에 필요한 변수
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
				conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass);
				String sql= "select * from attend_info";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				
				//쿼리 한줄씩 가져오기
				while(rs.next()){	
						String userID= rs.getString("userID");
						userPassword= rs.getString("userPassword");
						String userName= rs.getString("userName");
						String userGender= rs.getString("userGender");
						String userMajor= rs.getString("userMajor");
						
						
						//자신의 정보 수정
						if (id.equals(userID)){
						%>
		<form method="post" action="info_change_db.jsp" id="info_change"
			name="info_change">

			<table style="border: 1px solid #dddddd; width:80%; margin:0 auto;" class="table table-condensed table-hover">
				<tr>
					<td id="title" style="background-color: #e9e9e9; text-align: center;" width="30%">학번</td>
					<td><%=userID%> (학번은 수정할 수 없습니다.)
				<tr>
					<td  style="background-color: #e9e9e9; text-align: center;" width="30%">기존 비밀번호</td>
					<td><input type="password" name="password" maxlength="50"></td>
				<tr>
					<td id="title" style="background-color: #e9e9e9; text-align: center;" width="30%">변경 비밀번호</td>
					<td><input type="password" name="new_password" maxlength="50"></td>
				<tr>
					<td id="title" style="background-color: #e9e9e9; text-align: center;" width="30%">변경 비밀번호 재입력</td>
					<td><input type="password" name="new_password_2"
						maxlength="50"></td>
				<tr>
					<td id="title" style="background-color: #e9e9e9; text-align: center;" width="30%">이름</td>
					<td><input type="text" name="name" maxlength="50"
						placeholder="<%=userName%>"></td>
				<tr>
					<td id="title" style="background-color: #e9e9e9; text-align: center;" width="30%">성별</td>
					<!-- DB에 있던 값으로 체크값 바꾸기 -->
					<%if (userGender.equals("남")){%>
					<td><input type="radio" name="gender" value="남" checked>남
						<input type="radio" name="gender" value="여">여</td>
					<%
								} else{%>
					<td><input type="radio" name="gender" value="남">남 <input
						type="radio" name="gender" value="여" checked>여</td>
					<%} %>
				
				<tr>
					<td id="title" style="background-color: #e9e9e9; text-align: center;" width="30%">학과</td>
					<td><select name="major">
							<option>신학과</option>
							<option>영유아보육학과</option>
							<option>컴퓨터소프트웨어학과</option>
							<option>사회복지학과</option>
							<option>간호학과</option>
					</select></td>
			</table>
			<br> <input type="button" value="수정"
				onclick="return pwdCheck(info_change)" /> <input type="reset"
				value="취소">
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

	<script>
		//info_change
		function pwdCheck(info_change){
			var h = document.getElementById("info_change");
			
			if (h.password.value == "<%=userPassword%>"){
				
				if (h.new_password.value == h.new_password_2.value){
					document.getElementById('info_change').submit();
					return true;					
				}
				if(!h.name.value){
	                alert("이름을 입력하세요.");
	                return false;
	            }
	            
	            if(!h.new_password.value){
	                alert("변경 비밀번호를 입력하세요.");
	                return false;
	            }
	            if(!h.new_password_2.value){
	                alert("변경 비밀번호를 입력하세요.");
	                return false;
	            }
	            // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
	            if(h.new_password.value != h.new_password_2.value){
	                alert("변경할 비밀번호를 동일하게 입력하세요.");
	                return false;
	            }
				
			}
			else if(!h.password.value){
				alert("기존 비밀번호를 입력해주세요.");
				return false;
			}
			else{
				alert("기존 비밀번호가 다릅니다.");
				return false;
			}
			return false;
		}
	</script>
</body>
</html>