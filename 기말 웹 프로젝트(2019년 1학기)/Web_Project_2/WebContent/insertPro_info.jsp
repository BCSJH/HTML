<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("EUC-KR");%>

<%

String userID = request.getParameter("id");
String userName= request.getParameter("name");
String userPassword = request.getParameter("password");
String userGender = request.getParameter("gender");
String userMajor = request.getParameter("major");

Connection conn = null;
PreparedStatement pstmt = null;

try{
	String jdbcUrl="jdbc:mysql://localhost:3306/attend_check?serverTimezone=UTC";
	String dbId="root";
	String dbPass="test1234";
	Class.forName("com.mysql.jdbc.Driver");

	conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
	String sql = "insert into attend_info values (?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,userID);
	pstmt.setString(2,userPassword);
	pstmt.setString(3,userName);
	pstmt.setString(4,userGender);
	pstmt.setString(5,userMajor);
	pstmt.executeUpdate();

	out.println("<script>alert('회원가입이 완료되었습니다.'); location.href='template.jsp';</script>.");
	//out.println("회원가입이 완료되었습니다.");
	}catch(Exception e){
		e.printStackTrace();
		//out.println("회원가입에 실패했습니다.");
		out.println("<script>alert('아이디 중복확인을 해주세요.'); location.href='main.jsp?pagefile=join';</script>.");
	}finally{
		if(pstmt != null)
			try{
					pstmt.close();
				}catch(SQLException sqle){}
		if(conn != null)
			try{
				conn.close();
			}catch(SQLException sqle){}
	}
%>
