<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>header</title>
</head>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<body>
	<%
		if (session.getAttribute("id") == null) {
	%>
	<form action="login_ok.jsp" method="post">
		���̵� <input type="text" name="id">��й�ȣ <input type="password"
			name="pwd"> <input type="submit" value="�α���">
			 
			<input type="button" value="ȸ������" onclick="location.href = 'main.jsp?pagefile=join'" > <!-- id�� null�϶� ȸ�������� ������ join�������� �� -->
	
	</form>

	<%
		} else { //id���� ������
	%>
	<form action="logout.jsp" method="post">
		<%=session.getAttribute("id")%>�� �α����ϼ̽��ϴ�.<input type="submit"
			value="�α׾ƿ�"><br> <!-- �α׾ƿ��� ������ logout �������� �� -->
	</form>
	<%
		}
	%>
</body>
</html>