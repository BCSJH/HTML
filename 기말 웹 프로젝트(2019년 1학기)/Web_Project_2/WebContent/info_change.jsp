<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="Board.BoardBean"%>
<%@page import="Board.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.*"%>
<!DOCTYPE html>
<html>
<head>
<style>
#center1{
		text-align: center;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<meta name="viewport" content="width=device-width" initial-scale="1">

<!-- ��Ÿ�Ͻ�Ʈ ����  -->

<link rel="stylesheet" href="css/bootstrap.css">
<meta charset="EUC-KR">
<title>ȸ������</title>

</head>
<body>
	<div id="center1">
		<%
			String id = (String)session.getAttribute("id");
			String userPassword = "";
			if (session.getAttribute("id")==null) { //id�� null�̸� <- �α����� ���� �ʾ��� ���
		%>
		�α����� ���ּ���.
		<%
			} 
			else if(id.equals("1234")) { //id�� null�̸�
				%>

		<br>
		<br>
		<h1><b>ȸ�� ����</b></h1>
		<br>
		<br>
		<%
				boolean flag = false;
				Connection conn = null;
				boolean check = false;
				PreparedStatement pstmt=null;
				ResultSet rs = null;
				try{
					String jdbcUrl="jdbc:mysql://localhost:3306/attend_check?serverTimezone=UTC";
					String dbId="root";
					String dbPass="test1234";
					Class.forName("com.mysql.jdbc.Driver");
					conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass);
					String sql= "select * from attend_info";
					pstmt=conn.prepareStatement(sql);
					rs=pstmt.executeQuery();
					%>
		<form method="post" action="info_change_Pro_db.jsp" id="info_change"
			name="info_change">
			<table style="border: 1px solid #dddddd; width:80%; margin:0 auto;" class="table table-condensed table-hover">
				<tr>
					<th style="background-color: #e9e9e9; text-align: center;" width="10%">üũ</th>
					<th style="background-color: #e9e9e9; text-align: center;" width="40%">�й�</th>
					<th style="background-color: #e9e9e9; text-align: center;" width="20%">�̸�</th>
					<th style="background-color: #e9e9e9; text-align: center;" width="30%">����</th>
				</tr>
				<%
					while(rs.next()){	
							String userID= rs.getString("userID");
							String userName= rs.getString("userName");
							String userMajor= rs.getString("userMajor");
							if (userID.equals("1234")){
								continue;
							}
							%>
				<tr>
					<td style="text-align: center"><input type="checkbox"
						id="userID" name="userID" value="<%=userID%>"></td>
					<td style="text-align: center"><%=userID%></td>
					<td style="text-align: center"><%=userName%></td>
					<td style="text-align: center"><%=userMajor%></td>
				</tr>
				<% 
						}
					%>
			</table>
		<br>
		<br>
			<input type="submit" value="����" /> <input type="reset" value="���">
		</form>
		<%
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
					
				
			}
			
			//id�� null�� �ƴϸ� �� ������ ������ �ƴ� ���̵�� �α��� �Ǿ��ִٸ�
			else {//id�� null�� �ƴϸ� 
		%>
		<br>
		<br>
		<h1><b>ȸ�� ����</b></h1>
		<br>
		<br>
		<%
			//��� ������ �ʿ��� ����
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
				conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass);
				String sql= "select * from attend_info";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				
				//���� ���پ� ��������
				while(rs.next()){	
						String userID= rs.getString("userID");
						userPassword= rs.getString("userPassword");
						String userName= rs.getString("userName");
						String userGender= rs.getString("userGender");
						String userMajor= rs.getString("userMajor");
						
						
						//�ڽ��� ���� ����
						if (id.equals(userID)){
						%>
		<form method="post" action="info_change_db.jsp" id="info_change"
			name="info_change">

			<table style="border: 1px solid #dddddd; width:80%; margin:0 auto;" class="table table-condensed table-hover">
				<tr>
					<td id="title" style="background-color: #e9e9e9; text-align: center;" width="30%">�й�</td>
					<td><%=userID%> (�й��� ������ �� �����ϴ�.)
				<tr>
					<td  style="background-color: #e9e9e9; text-align: center;" width="30%">���� ��й�ȣ</td>
					<td><input type="password" name="password" maxlength="50"></td>
				<tr>
					<td id="title" style="background-color: #e9e9e9; text-align: center;" width="30%">���� ��й�ȣ</td>
					<td><input type="password" name="new_password" maxlength="50"></td>
				<tr>
					<td id="title" style="background-color: #e9e9e9; text-align: center;" width="30%">���� ��й�ȣ ���Է�</td>
					<td><input type="password" name="new_password_2"
						maxlength="50"></td>
				<tr>
					<td id="title" style="background-color: #e9e9e9; text-align: center;" width="30%">�̸�</td>
					<td><input type="text" name="name" maxlength="50"
						placeholder="<%=userName%>"></td>
				<tr>
					<td id="title" style="background-color: #e9e9e9; text-align: center;" width="30%">����</td>
					<!-- DB�� �ִ� ������ üũ�� �ٲٱ� -->
					<%if (userGender.equals("��")){%>
					<td><input type="radio" name="gender" value="��" checked>��
						<input type="radio" name="gender" value="��">��</td>
					<%
								} else{%>
					<td><input type="radio" name="gender" value="��">�� <input
						type="radio" name="gender" value="��" checked>��</td>
					<%} %>
				
				<tr>
					<td id="title" style="background-color: #e9e9e9; text-align: center;" width="30%">�а�</td>
					<td><select name="major">
							<option>���а�</option>
							<option>�����ƺ����а�</option>
							<option>��ǻ�ͼ���Ʈ�����а�</option>
							<option>��ȸ�����а�</option>
							<option>��ȣ�а�</option>
					</select></td>
			</table>
			<br> <input type="button" value="����"
				onclick="return pwdCheck(info_change)" /> <input type="reset"
				value="���">
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

	<script>
		//info_change
		function pwdCheck(info_change){
			var h = document.getElementById("info_change");
			
			if (h.password.value == "<%=userPassword%>"){
				
				if (h.new_password.value == h.new_password_2.value){
					document.getElementById('info_change').submit();
					return true;					
				}
				if(!h.name.value){
	                alert("�̸��� �Է��ϼ���.");
	                return false;
	            }
	            
	            if(!h.new_password.value){
	                alert("���� ��й�ȣ�� �Է��ϼ���.");
	                return false;
	            }
	            if(!h.new_password_2.value){
	                alert("���� ��й�ȣ�� �Է��ϼ���.");
	                return false;
	            }
	            // ��й�ȣ�� ��й�ȣ Ȯ�ο� �Էµ� ���� �������� Ȯ��
	            if(h.new_password.value != h.new_password_2.value){
	                alert("������ ��й�ȣ�� �����ϰ� �Է��ϼ���.");
	                return false;
	            }
				
			}
			else if(!h.password.value){
				alert("���� ��й�ȣ�� �Է����ּ���.");
				return false;
			}
			else{
				alert("���� ��й�ȣ�� �ٸ��ϴ�.");
				return false;
			}
			return false;
		}
	</script>
</body>
</html>