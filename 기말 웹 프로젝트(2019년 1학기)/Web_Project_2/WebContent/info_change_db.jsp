<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import = "java.*" %>
<%
    request.setCharacterEncoding("EUC-KR");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	String id = (String)session.getAttribute("id");
	boolean flag = false;
	Connection con = null;
	boolean check = false;
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	String userPassword = request.getParameter("password");
	String userPassword_new = request.getParameter("new_password");
	String userName = request.getParameter("name");
	String userGender = request.getParameter("gender");
	String userMajor = request.getParameter("major");

	try{
		String jdbcUrl="jdbc:mysql://localhost:3306/attend_check?serverTimezone=UTC";
		String dbId="root";
		String dbPass="test1234";
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
		String sql = "update attend_info set userPassword=?,userName=?, userGender=?, userMajor=? where userID= ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, userPassword_new);
		pstmt.setString(2, userName);
		pstmt.setString(3, userGender);
		pstmt.setString(4, userMajor);
		pstmt.setString(5, id);
		pstmt.executeUpdate();
		session.invalidate();
		out.println("<script>alert('수정되었습니다.다시 로그인해주세요.'); location.href='main.jsp';</script>.");
		
		} catch (Exception e) {
			e.printStackTrace();
			out.println("<script>alert('수정실패'); location.href='main.jsp?pagefile=info_change';</script>.");
			
		} finally {
		if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		if (con != null) try { con.close(); } catch(SQLException ex) {}
		}

	
	%>
</body>
</html>