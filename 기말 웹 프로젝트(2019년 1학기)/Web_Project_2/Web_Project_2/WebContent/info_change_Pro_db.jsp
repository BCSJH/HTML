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
		String pagefile = request.getParameter("pagefile");//pagefile �������� String���� ����ȯ
		if (pagefile == null) { // pagefile�� null�̸�
			pagefile = "intro"; //��Ʈ�ΰ� ��
		}
	%>
<jsp:forward page="template.jsp"> 
	<jsp:param name="attend" value="<%=pagefile%>"/>
</jsp:forward>
<%
out.println("<script>alert('ȸ�� ������ �Ϸ�Ǿ����ϴ�.');</script>");
}catch(Exception e){
e.printStackTrace();
out.println("<script>alert('ȸ�������� �����߽��ϴ�.');</script>");

}finally{
if(pstmt != null)
try{pstmt.close();}catch(SQLException sqle){}
if(conn != null)
try{conn.close();}catch(SQLException sqle){}
}
%>