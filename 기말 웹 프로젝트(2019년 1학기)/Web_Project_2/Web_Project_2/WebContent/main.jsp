<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� Ȩ</title>
</head>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<body>
	<%
		String pagefile = request.getParameter("pagefile");//pagefile �������� String���� ����ȯ
		if (pagefile == null) { // pagefile�� null�̸�
			pagefile = "intro"; //��Ʈ�ΰ� ��
		}
	%>
	<jsp:forward page="template.jsp"> 
		<jsp:param name="pagefile" value="<%=pagefile%>" />
	</jsp:forward>

</body>
</html>