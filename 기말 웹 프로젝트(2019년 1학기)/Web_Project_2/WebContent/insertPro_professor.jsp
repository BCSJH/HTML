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
		String pagefile = request.getParameter("pagefile");//pagefile �������� String���� ����ȯ
		if (pagefile == null) { // pagefile�� null�̸�
			pagefile = "intro"; //��Ʈ�ΰ� ��
		}
	%>
<jsp:forward page="template.jsp"> 
	<jsp:param name="attend" value="<%=pagefile%>"/>
</jsp:forward>
<%
out.println("<script>alert('�⼮ ���̺� ���ο� ���ڵ带 �߰��߽��ϴ�.');</script>");
}catch(Exception e){
e.printStackTrace();
out.println("<script>alert('�⼮ ���̺� ���ο� ���ڵ带 �߰��� �����߽��ϴ�.');</script>");

}finally{
if(pstmt != null)
try{pstmt.close();}catch(SQLException sqle){}
if(conn != null)
try{conn.close();}catch(SQLException sqle){}
}
%> 