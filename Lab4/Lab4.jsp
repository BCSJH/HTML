<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">


function check(){//üũ�� �� �Ǿ��ִ��� Ȯ���ϱ� ���� �Լ�
	var frm = document.getElementById("form");//������ �ɼ� �ҷ����� ���� ����

	if(frm.coffee.value=="" || frm.coffee.value == null)//Ŀ�� ������ ���� �ʾ��� ���
	{
		alert("Ŀ�Ǽ������ּ���.");
		return false;
	}

	if(frm.size.value==null ||frm.size.value=="0")//������ ������ ���� �ʾ��� ���
	{
		alert("����������ּ���.");
		return false;
	}
	return true;//�� ������ �Ǿ����� ��� ��ȯ
}


function reset_form(){//��� ��ư�� ������ ���
	var del=confirm("���� ����Ͻðڽ��ϱ�?");
if(del)
	return true;
else
	
	return false;
}
</script>

<hr>
<h1>���� �ֹ��ϱ�</h1>
<hr>
<form action="Lab4_result.jsp" method="post" id="form" onsubmit="return check()" onreset="return reset_form()">
    <label><!-- ������ �ɼ� ���� ���� ���� -->
    <h2>Ŀ������</h2><!-- Ŀ�� ���� ���� -->
    <input type="radio" name="coffee" value="�Ƹ޸�ī��"> �Ƹ޸�ī��
    <input type="radio" name="coffee" value="ī���"> ī���
    <input type="radio" name="coffee" value="ī���ī"> ī���ī
    </label> 
    
    <label><!-- ������ �ɼ� ���� ���� ���� -->
   <h2>�ɼ�</h2> <!-- Ŀ�� ������ -->
    <input type="radio" name="option" value="hot" checked> hot
    <input type="radio" name="option" value="ice"> ice
    </label>
        
   <label><!-- ������ �ɼ� ���� ���� ���� -->
   <h2>������</h2><!-- ������ ���� -->
    <select name="size">
        <option name="size" value="0" selected>�����ϼ���</option>
        <option name="size" value="Tall">Tall</option>
        <option name="size" value="Grandl">Grandl</option>
        <option name="size" value="Venti">Venti</option>
    </select>
	</label>
	<br>
	<br>
	<br>
 	<label><!-- ������ �ɼ� ���� ���� ���� -->
    <input type="submit" value="���� �ֹ��ϱ�">
    <input type="reset" value="���">
    </label>
</form>
</body>
</html>