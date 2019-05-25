<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@page import="java.util.Date" %>
   <%@page import="java.text.SimpleDateFormat" %>
<% request.setCharacterEncoding("EUC-KR");%>
<%
String userID[] = request.getParameterValues("userID");
String userName[] = request.getParameterValues("userName");
String check[] = request.getParameterValues("check");
Date now = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyy.MM.dd");
String date = sf.format(now);

for(int i = 0; i < userID.length; i++){
	out.print(userID[i]);
}
Connection conn=null;
PreparedStatement pstmt=null;
try{
String jdbcUrl="jdbc:mysql://localhost:3306/attend_check?serverTimezone=UTC";
String dbId="root";
String dbPass="test1234";
Class.forName("com.mysql.jdbc.Driver");

for(int i = 0; i < userID.length; i++){
	conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
	String sql = "insert into attend_check_s values (?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,null);
	pstmt.setString(2,userID[i]);
	pstmt.setString(3,userName[i]);
	pstmt.setString(4,date);
	pstmt.setString(5,check[i]);
	pstmt.executeUpdate();	
}

%>
<%
		String pagefile = request.getParameter("pagefile");//pagefile 받은값을 String으로 형변환
		if (pagefile == null) { // pagefile이 null이면
			pagefile = "intro"; //인트로가 뜸
		}
	%>
<jsp:forward page="template.jsp"> 
	<jsp:param name="attend" value="<%=pagefile%>"/>
</jsp:forward>
<%
out.println("<script>alert('출석 테이블에 새로운 레코드를 추가했습니다.');</script>");
}catch(Exception e){
e.printStackTrace();
out.println("<script>alert('출석 테이블에 새로운 레코드를 추가에 실패했습니다.');</script>");

}finally{
if(pstmt != null)
try{pstmt.close();}catch(SQLException sqle){}
if(conn != null)
try{conn.close();}catch(SQLException sqle){}
}
%> 