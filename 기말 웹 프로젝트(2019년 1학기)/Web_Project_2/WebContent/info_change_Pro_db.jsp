<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@page import="java.util.Date" %>
<% request.setCharacterEncoding("EUC-KR");%>
<%
String userID[] = request.getParameterValues("userID");

Connection conn=null;
PreparedStatement pstmt=null;
try{
String jdbcUrl="jdbc:mysql://localhost:3306/attend_check?serverTimezone=UTC";
String dbId="root";
String dbPass="test1234";
Class.forName("com.mysql.jdbc.Driver");

for(int i = 0; i < userID.length; i++){
	conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
	String sql = "delete from attend_info where userID = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,userID[i]);
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
out.println("<script>alert('회원 관리가 완료되었습니다.');</script>");
}catch(Exception e){
e.printStackTrace();
out.println("<script>alert('회원관리에 실패했습니다.');</script>");

}finally{
if(pstmt != null)
try{pstmt.close();}catch(SQLException sqle){}
if(conn != null)
try{conn.close();}catch(SQLException sqle){}
}
%>