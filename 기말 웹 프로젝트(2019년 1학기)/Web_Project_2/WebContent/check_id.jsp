<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import = "java.sql.*" %>

<%
request.setCharacterEncoding("EUC-KR");
String id_input = request.getParameter("id");

//boolean result = mMgr.checkId(id);
%>
<html>
<head>
<title>ID �ߺ�üũ</title>
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
			out.println("�� �̹� �����ϴ� �й��Դϴ�.<p/>");
			break;
		}
		else if (check==false && check_num==count){
			%>
			<br/><b><%=id_input%></b>
			
			<!-- ���� �����ؼ� �߰��ؾߵǴµ�...������� -->
			
			<%
			
			out.println("�� ��� ���� �մϴ�.<p/>");
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
<a href="#" onClick="self.close()">�ݱ�</a>

</div>
</body>
</html>