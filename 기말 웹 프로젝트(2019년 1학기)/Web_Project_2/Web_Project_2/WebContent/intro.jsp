<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<style>
		#line{
		margin: 0 auto;
		width:500px;
		}
	</style>
<meta charset="EUC-KR">
<title>�α��� ȭ��</title>
</head>
<% 
	request.setCharacterEncoding("EUC-KR");
%>
<body>
		<%
		if (session.getAttribute("id") == null) {
	%>
	<br><br>
	<div id= "line">
  	  <br><br>
   		<b><font size="6" color="gray">�α���</font></b><br><br>
		<form action="login_ok.jsp" method="post">
				���̵� &nbsp;&nbsp;&nbsp;<input type="text" name="id" maxlength="60" ><br><br>
				��й�ȣ&nbsp;<input type="password" name="pwd" maxlength="60" ><br><br>
				<input type="submit" value="�α���" >
			 
				<input type="button" value="ȸ������" onclick="location.href = 'main.jsp?pagefile=join'">
		</form>
	</div>
	<%
		}
		else{
			out.print(session.getAttribute("id")+"��");
			%>
				�ݰ����ϴ�.
			<%
			
		}
		%>
</body>
</html>