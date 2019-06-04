<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>메뉴</title>
</head>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<body>

	<div>
		<%
			String id = (String)session.getAttribute("id");
			if (session.getAttribute("id")==null) { //id가 null이면
		%>
				<a href="main.jsp">홈</a><br>
				<a href="main.jsp?pagefile=info_change">정보수정</a><br>
				<a href="main.jsp?pagefile=schedule"> 학과일정 </a><br>
				<a href="main.jsp?pagefile=attend"> 출석확인 </a><br>
				<a href="main.jsp?pagefile=sign"> 출석안내문 </a><br>
				<a href="main.jsp?pagefile=board"> 게시판목록 </a>
		<%
			} 
			else if(id.equals("1234")) { //id가 null이면
				%>
		<a href="main.jsp">홈</a><br>
		<a href="main.jsp?pagefile=info_change">회원관리</a><br>
		<a href="main.jsp?pagefile=schedule"> 학과일정 </a><br>
		<a href="main.jsp?pagefile=insertForm_professor"> 출석체크 </a><br>
		
			&nbsp;&nbsp;<a href="main.jsp?pagefile=insertForm_professor">· 웹시스템설계및개발 </a><br>
			&nbsp;&nbsp;<a href="main.jsp?pagefile=insertForm_professor2">· 운영체제 </a><br>
			&nbsp;&nbsp;<a href="main.jsp?pagefile=insertForm_professor3">· 머신러닝 프로그램 </a><br>
		<br>
		<a href="main.jsp?pagefile=sign"> 출석안내문 </a><br>
		<a href="main.jsp?pagefile=board"> 게시판목록 </a><br>
			&nbsp;&nbsp;<a href="main.jsp?pagefile=formalobjection">· 이의 신청 게시판 </a><br>
			&nbsp;&nbsp;<a href="main.jsp?pagefile=notice">· 공지 게시판 </a>				
				
				<%
					} 
			else { //id가 null이 아니면 
				%>

				<a href="main.jsp">홈</a><br>
				<a href="main.jsp?pagefile=info_change">정보수정</a><br>
				<a href="main.jsp?pagefile=schedule"> 학과일정 </a><br>
				<a href="main.jsp?pagefile=attend"> 출석확인 </a><br>
				
				<%
				Connection conn=null;
				PreparedStatement pstmt=null;
				ResultSet rs=null;
				try{
				String jdbcUrl="jdbc:mysql://localhost:3306/attend_check?serverTimezone=UTC";
				String dbId="root";
				String dbPass="test1234";
				Class.forName("com.mysql.jdbc.Driver");
				conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
				String sql= "select * from attend_info";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				
				while(rs.next()){
				String userID= rs.getString("userID");
				String w = rs.getString("w");
				String o = rs.getString("o");
				String m = rs.getString("m");
				if(id.equals(userID))
				{
					if(w.equals("1")){
						%>
						
							&nbsp;&nbsp;<a href="main.jsp?pagefile=attend">· 웹시스템 설계및계발</a><br>
						
						<%	
					}
					if(o.equals("1")){
						%>
						
							&nbsp;&nbsp;<a href="main.jsp?pagefile=attend1">· 운영체제</a><br>
						
						<%	
					}
					if(m.equals("1")){
						%>
						
							&nbsp;&nbsp;<a href="main.jsp?pagefile=attend2">· 머신러닝프로그래밍</a><br>
						
						<%	
					}
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
				<br>
				<a href="main.jsp?pagefile=sign"> 출석안내문 </a><br>
				<a href="main.jsp?pagefile=board"> 게시판목록 </a><br>
				
					&nbsp;&nbsp;<a href="main.jsp?pagefile=formalobjection">· 이의 신청 게시판 </a><br>
					&nbsp;&nbsp;<a href="main.jsp?pagefile=notice">· 공지 게시판 </a>
				
				<%	
			}
		%>
	</div>
</body>
</html>