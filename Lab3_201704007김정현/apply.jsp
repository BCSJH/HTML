<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("euc-kr"); //�ѱ� ���� ����

		
	%>
	<h1>���� ��û</h1>
<!--���̺� �����-->
<table border="1">
<tr>
<th>��ȣ</th>
<th>�����Ѱ���</th>
<th>����</th>
<th>�г�</th>
</tr>

	<%
		
		String[] studycheck = request.getParameterValues("study"); //�迭
		int total = 0; //�� ����
		String studylist=""; 
		
		for (int i = 0; i < studycheck.length; i++) { 
			%>
			<tr><td><% out.print(i+1); %></td><td><!--i�� 0���� ��Ƽ� _1�� �ؾ� 1���� ������-->
			<%
			if (studycheck[i].equals("�� �ý��� ���� �� ����")) { //üũ �ڽ��� �� ���� "���ý��� ����װ��߰� ������� �Ѱ��� å����Ʈ�� �����Ѵ�
				studylist += "[�� �ý��� ���� �� ����]";
				total += 3;
				out.print("["+"�� �ý��� ���� �� ����"+"]"+" ");
			}
			else if (studycheck[i].equals("�ڹٱ���������α׷���")) {//üũ �ڽ��� �� �� ��
				studylist += "[�ڹٱ���������α׷���]";
				total += 3;
				out.print("["+"�ڹٱ���������α׷���"+"]"+" ");
			}
			else if (studycheck[i].equals("��ǻ�����α׷��ֱ���")) {
				studylist += "[��ǻ�����α׷��ֱ���]";
				total += 3;
				out.print("["+"��ǻ�����α׷��ֱ���"+"]"+" ");
			}
			else if (studycheck[i].equals("�ü��")) {
				studylist += "[�ü��]";
				total += 3;
				out.print("["+"�ü��"+"]"+" ");
			}
			%>
			</td><!-- �ҽ��� ���� ������... ���̺�� �ۼ��ؾߵǼ�... �ڹ� �ڵ尡 �κкκ� ���ִ�... -->
			<td>3����</td><td>
			<%
			if (studycheck[i].equals("�� �ý��� ���� �� ����")) { //üũ �ڽ��� �� ��
				out.print("3�г�");
			}
			else if (studycheck[i].equals("�ڹٱ���������α׷���")) {
				out.print("2�г�");
			}
			else if (studycheck[i].equals("��ǻ�����α׷��ֱ���")) {
				out.print("1�г�");
			}
			else if (studycheck[i].equals("�ü��")) {
				out.print("3�г�");
			}
			%>
			</td>
			</tr>
			<%
		}
	%>
	<tr>
	<td colspan="3" ><p align="center">�� ����</p></td>
	<td><font color="red"><%=total%></font></td>
	<!-- �� ������ ��� -->
	
</table>
	
	<form action="./main.jsp?pagefile=result" name="send_result" method="post">

	<input type="hidden" name="pass" value="<%=total%>">
	<input type="hidden" name="boxck" value="<%=studylist%>">
	<br>
	<input type="submit" value="��û">
	</form>
<%total =0; %> <!-- ���� �ʱ�ȭ -->


</body>
</html>