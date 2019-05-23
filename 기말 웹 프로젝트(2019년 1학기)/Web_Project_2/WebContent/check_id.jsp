<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import = "java.sql.*" %>

<%
request.setCharacterEncoding("EUC-KR");
String id_input = request.getParameter("id");

//boolean result = mMgr.checkId(id);
%>
<html>
<head>
<title>ID 중복체크</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>

<div align="center">

<%
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
		String sql= "select * from attend_info";
		pstmt=conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		rs.last();
		int count = rs.getRow();
		rs.beforeFirst();
		
		while(rs.next()){
		String id= rs.getString("userID");
		if (id_input.equals(id)){
				check = true;
			}
		
		if(check==true){
			%>
			
			<br/><b><%=id_input%></b>
			<%
			out.println("는 이미 존재하는 학번입니다.<p/>");
			break;
		}
		else if (check==false && check_num==count){
			%>
			<br/><b><%=id_input%></b>
			
			<!-- 값을 변경해서 뜨게해야되는데...어떻게하지 -->
			
			<%
			
			out.println("는 사용 가능 합니다.<p/>");
		}
		check_num+=1;
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
	
%>
<a href="#" onClick="self.close()">닫기</a>

</div>
</body>
</html>