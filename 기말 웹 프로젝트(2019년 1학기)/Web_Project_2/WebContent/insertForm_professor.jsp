<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� �⼮ üũ</title>
</head>
<body>
<form method="post" action="insertPro_professor.jsp">
<table>
	<tr>
	<td>�й�</td>
	<td>�̸�</td>
	<td>�⼮ �ð�</td>
	<td>4/1</td>
	
	<!-- 	
	<td>4/2</td>
	<td>4/3</td>
	<td>4/4</td>
	<td>4/5</td>
	<td>4/8</td>
	<td>4/9</td>
	<td>4/10</td>
	<td>4/11</td>
	<td>4/12</td>
	
	<td>4/15</td>
	<td>4/16</td>
	<td>4/17</td>
	<td>4/18</td>
	<td>4/19</td>
	
	<td>4/22</td>
	<td>4/23</td>
	<td>4/24</td>
	<td>4/25</td>
	<td>4/26</td>
	
	<td>4/29</td>
	<td>4/30</td>
	<td>4/31</td>		
	</tr>
	 -->
	<tr>
		<td>
			<input id="userID" name="userID" type="text" size="11" maxlength="11" placeholder="201704007" autofocus required>
		</td>
		<td>
			<input id="userName" name="userName" type="text" size="20" maxlength="20" placeholder="������" autofocus required>
		</td>
		<td>
			�ð�</td>
		<td>
		<select name="check">
			<option value="0" selected="selected">�⼮</option>
			<option value="1">����</option>
			<option value="2">�Ἦ</option>
		</select>
		</td>
	</tr>
	<tr>
		<td>
			<input type="submit" value="�Է¿Ϸ�">
		</td>
		<td>
			<input type="reset" value="�ٽ� �ۼ�">
		</td>
	</tr> 
</table>
</form>
</body>
</html>