<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<html><head>
<title>JDBC ����̹� �׽�Ʈ</title>
</head>
<body>
<%
Connection conn =null;
Boolean connect =false;
try {
String jdbcUrl="jdbc:mysql://localhost:3306/attend_check?attend_check?serverTimezone=UTC";
String dbId="root";
String dbPass="test1234";
Class.forName("com.mysql.jdbc.Driver");
conn=DriverManager.getConnection(jdbcUrl,dbId,dbPass);
connect=true;
conn.close();
}catch(Exception e){
e.printStackTrace();
}
if(connect==true){
out.print("����Ǿ����ϴ�");
}else {
out.print("���ῡ �����Ͽ����ϴ�.");
}
%>
</body>
</html>