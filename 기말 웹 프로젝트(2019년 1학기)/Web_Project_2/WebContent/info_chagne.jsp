<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import = "java.sql.*" %>
	<%@ page import = "java.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������</title>
</head>
<body>

	<div>
		<%
			String id = (String)session.getAttribute("id");
			if (session.getAttribute("id")==null) { //id�� null�̸�
		%>
				�α����� ���ּ���.
		<%
			} 
			else if(id.equals("1234")) { //id�� null�̸�
				%>
				������ �����Դϴ�.
				<%
					} 
			else { //id�� null�� �ƴϸ� 
		%>
			ȸ�� ����
			<%
			//��񿬵��� �ʿ��� ����
			boolean flag = false;
			Connection conn = null;
			PreparedStatement pstmt=null;
			ResultSet rs = null;
			
			//��񿬵�
			try{
				String jdbcUrl="jdbc:mysql://localhost:3306/attend_check?serverTimezone=UTC";
				String dbId="root";
				String dbPass="test1234";
				Class.forName("com.mysql.jdbc.Driver");
				conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
				String sql= "select * from attend_info";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				
				//���� ���پ� ��������
				while(rs.next()){	
					if (id.equals("1234")){//�������� ���
						String userID= rs.getString("userID");
						String userPassword= rs.getString("userPassword");
						String userName= rs.getString("userName");
						String userGender= rs.getString("userGender");
						String userMajor= rs.getString("userMajor");

						%>
						<form method="post" action="info_change_db.jsp" name="info_change" onsubmit="return checkValue()">
        
						<table>
							<tr>
							<td id="title">�й�</td><td><%=userID%> (�й��� ������ �� �����ϴ�.)
							
							<tr>
							<td>���� ��й�ȣ</td>
							<td><input type="password" name="password" maxlength="50"></td>
							
							<tr>
							<td id="title">���� ��й�ȣ</td>
							<td><input type="password" name="new_password" maxlength="50"></td>
							
							<tr>
                   				<td id="title">�̸�</td>
                    			<td><input type="text" name="name" maxlength="50" placeholder="<%=userName%>"></td>
                			
                			<tr>
								<td id="title">����</td>
								<%if (userGender.equals("��")){%>
									<td>
										<input type="radio" name="gender" value="��" checked>��
										<input type="radio" name="gender" value="��" >��
									</td>
									<%
								} else{%>
								<td>
									<input type="radio" name="gender" value="��">��
									<input type="radio" name="gender" value="��" checked>��
								</td>
							<%} %>
							<tr>
								<td id="title">�а�</td>
                   				 <td>
                        			<select name="major">
                            		<option>���а�</option>
                            		<option>�����ƺ����а�</option>
                            		<option>��ǻ�ͼ���Ʈ�����а�</option>
                            		<option>��ȸ�����а�</option>
                            		<option>��ȣ�а�</option>                        
                        			</select>
                    			</td>
						</table>
						</form>
					<% }
					}
					}catch(Exception e){
					e.printStackTrace();
					}finally{
					if(rs != null)
					try{rs.close();}catch(SQLException sqle){}
					if(pstmt != null)
					try{pstmt.close();}catch(SQLException sqle){}
					if(conn != null)
					try{conn.close();}catch(SQLException sqle){}
					}

			
			%>
		<%
			}
		%>
	</div>
</body>
</html>