<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<html><head>
<title>JDBC 드라이버 테스트</title>
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
out.print("연결되었습니다");
}else {
out.print("연결에 실패하였습니다.");
}
%>
</body>
</html>