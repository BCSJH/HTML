<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ page import = "java.sql.*" %>
	<%@ page import = "java.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α���ȭ��</title>
</head>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<body>
	<div>
		<%
			//���̵�� ��й�ȣ ��������
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			
			int count = 0;// DB�� �� ���� Ʃ�����ִ��� Ȯ��
			int count_2 = 0;//�������� �ʴ� ���̵����� Ȯ���ϱ� ���� ����

			//��񿬵��� �ʿ��� ����
			boolean flag = false;
			Connection conn = null;
			PreparedStatement pstmt=null;
			ResultSet rs = null;

			try{
				//��� ����
				String jdbcUrl="jdbc:mysql://localhost:3306/attend_check?serverTimezone=UTC";
				String dbId="root";
				String dbPass="test1234";
				Class.forName("com.mysql.jdbc.Driver");
				conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
				String sql= "select * from attend_info";
				pstmt=conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				//Ʃ���� ���� ���ϱ�

				while(rs.next())//���� ���پ� ��������
				{
					String userID= rs.getString("userID");
					String userPassword= rs.getString("userPassword");
				//���̵�� ��й�ȣ ���ϱ�
				//���̵�� ��й�ȣ�� ���� ���
				if(id.equals(userID) && pwd.equals(userPassword)){
					session.setAttribute("id", id);//���̵��� �������� ��������
					out.print("<script>alert('�α��ο� �����߽��ϴ�.'); location.href='template.jsp';</script>");
					}

				//���̵�� �����ϴµ� ��й�ȣ�� Ʋ�����
				else if(id.equals(userID)){
						if(!pwd.equals(userPassword))
							out.print("<script>alert('��й�ȣ�� Ʋ�Ƚ��ϴ�.'); location.href='template.jsp';</script>");
					}

				}
				out.print("<script>alert('�������� �ʴ� ���̵��Դϴ�.'); location.href='template.jsp';</script>");
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

			
			
			
			
			
			
			//response.sendRedirect("template.jsp");//template.jsp�� �����̷�Ʈ����
		%>
	</div>
</body>
</html>