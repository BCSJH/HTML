<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
	<style>
		#line{
		margin: 0 auto;
		width:500px;
		}
	</style>
    <title>ȸ������ ȭ��</title>
    
 
 
    <script type="text/javascript">
   
    	function checkid(mem_id) {

    		if(document.userInfo.id.value == "") {
    			alert("�й��� �Է��Ͻÿ�.");
    			userInfo.id.focus();
    		} else {
    			var url = "check_id.jsp?id=" + mem_id;
    			// �� ��° �Ķ���ʹ� �޼ҵ� ���۹���� �ƴϰ� Ÿ��Ʋ
    			window.open(url, "checkid", "toolbar=no, width=350, height=150, top=150, left=150");
    		}
    	}

        // �ʼ� �Է������� ���̵�, ��й�ȣ�� �ԷµǾ����� Ȯ���ϴ� �Լ�
        function checkValue()
        {

            if(!document.userInfo.id.value){
                alert("�й��� �Է��ϼ���.");
                return false;
            }
            
            if(!document.userInfo.password.value){
                alert("��й�ȣ�� �Է��ϼ���.");
                return false;
            }
            
            // ��й�ȣ�� ��й�ȣ Ȯ�ο� �Էµ� ���� �������� Ȯ��
            if(document.userInfo.password.value != document.userInfo.passwordcheck.value ){
                alert("��й�ȣ�� �����ϰ� �Է��ϼ���.");
                return false;
            }
        }
    </script>
</head>
<body onLoad="userInfo.id.focus()">
    
    <div id="line">
        <br><br>
        <b><font size="6" color="gray">ȸ������</font></b>
        <br><br><br>
        
        
       
        <form method="post" action="insertPro_info.jsp" name="userInfo" onsubmit="return checkValue()">
            <table>
                <tr>
                    <td id="title">�й�</td>
                    <td>
                        <input type="text" name="id" maxlength="50">
                   </td>
                    <td>
                        <input type="button" name="confirm_id" value="�ߺ�Ȯ��" onClick="checkid(this.form.id.value)"> 
                    </td>
                    <td>                    
                        <input type="hidden" name="id_check_ok" value=0>
                    </td>
                </tr>
          
                <tr>
                    <td id="title">��й�ȣ</td>
                    <td>
                        <input type="password" name="password" maxlength="50">
                    </td>
                </tr>
                
                <tr>
                    <td id="title">��й�ȣ ���Է�</td>
                    <td>
                        <input type="password" name="passwordcheck" maxlength="50">
                    </td>
                </tr>
                <tr>
                    <td id="title">�̸�</td>
                    <td>
                        <input type="text" name="name" maxlength="50">
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">����</td>
                    <td>
                        <input type="radio" name="gender" value="��" checked>��
                        <input type="radio" name="gender" value="��" checked>��
                    </td>
                </tr>
                 
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
                </tr>
                    
                
            </table>
            <br>
            <input type="submit" value="����"/>
            <input type="button" value="���">
        </form>
    </div>
</body>
</html>

