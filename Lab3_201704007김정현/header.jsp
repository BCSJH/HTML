<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
	function check_id() { //���̵�� ��й�ȣ�� Ȯ���ϴ� ���
		var id = document.getElementById("id").value;  //���̵� �� ��������
		var pwd = document.getElementById("pwd").value;//��й�ȣ �� ��������

		if (id == "") {
			alert("���̵� �Է��� �ּ���.");
			return false;
		}

		else if (pwd == "") {
			alert("��й�ȣ�� �Է��� �ּ���.");
			return false;

		}

		else if (id != "test") {
			alert("���̵� ��ġ���� �ʽ��ϴ�.");
			return false;

		}

		else if (pwd != "1234") {
			alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
			return false;

		}

		else {
			return true;
		}
	}
</script>





</head>
<body>
	<%
		if (session.getAttribute("id") == null) {//�α��� ��
	%>
	<form action="login_ok.jsp" method="post">
		���̵� <input type="text" name="id" id="id"> ��й�ȣ <input
			type="password" name="pwd" id="pwd"> <input type="submit"
			value="�α���" onclick="return check_id()"> <input type="button"
			value="ȸ������" onclick="location.href = './main.jsp?pagefile=join'">
		<%
			} else {
		%>
	</form>

	<form action="logout.jsp" method="post"><!-- �α��� �� -->
		<%=session.getAttribute("id")%>
		�� �α��� �ϼ̽��ϴ�. <input type="submit" value="�α׾ƿ�">
	</form>
	<%
		}
	%>

</body>
</html>