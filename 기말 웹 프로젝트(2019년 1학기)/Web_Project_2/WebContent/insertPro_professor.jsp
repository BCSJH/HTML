<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("EUC-KR");%>
<%
String userID = request.getParameter("userID");
String userName= request.getParameter("userName");
String check = request.getParameter("check");
Timestamp date=new Timestamp(System.currentTimeMillis());

Connection conn=null;
PreparedStatement pstmt=null;
try{
String jdbcUrl="jdbc:mysql://localhost:3306/attend_check?serverTimezone=UTC";
String dbId="root";
String dbPass="test1234";
Class.forName("com.mysql.jdbc.Driver");

conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
String sql = "insert into attend_check_s values (?,?,?,?)";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1,userID);
pstmt.setString(2,userName);
pstmt.setTimestamp(3,date);
pstmt.setString(4,check);

pstmt.executeUpdate();

out.println("출석 테이블에 새로운 레코드를 추가했습니다.");
}catch(Exception e){
e.printStackTrace();
out.println("출석 테이블에 새로운 레코드를 추가에 실패했습니다");
}finally{
if(pstmt != null)
try{pstmt.close();}catch(SQLException sqle){}
if(conn != null)
try{conn.close();}catch(SQLException sqle){}
}
%> 