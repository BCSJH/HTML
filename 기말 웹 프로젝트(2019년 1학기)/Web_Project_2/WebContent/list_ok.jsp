<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	//�� �ҷ�����
	String pagefile = request.getParameter("pagefile");
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	String nowPage = request.getParameter("nowPage");
%>
<script>
	//content�ȿ� ���� ���� ���� jsp�� ����
	location.href="main.jsp?pagefile=list&keyField=<%=keyField%>&keyWord=<%=keyWord%>&nowPage=<%=nowPage%>";
</script>
</body>
</html>