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
    <title>회원가입 화면</title>
    
 
 
    <script type="text/javascript">
   
    	function checkid(mem_id) {

    		if(document.userInfo.id.value == "") {
    			alert("학번을 입력하시오.");
    			userInfo.id.focus();
    		} else {
    			var url = "check_id.jsp?id=" + mem_id;
    			// 두 번째 파라미터는 메소드 전송방식이 아니고 타이틀
    			window.open(url, "checkid", "toolbar=no, width=350, height=150, top=150, left=150");
    		}
    	}

        // 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
        function checkValue()
        {

            if(!document.userInfo.id.value){
                alert("학번을 입력하세요.");
                return false;
            }
            
            if(!document.userInfo.password.value){
                alert("비밀번호를 입력하세요.");
                return false;
            }
            
            // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
            if(document.userInfo.password.value != document.userInfo.passwordcheck.value ){
                alert("비밀번호를 동일하게 입력하세요.");
                return false;
            }
        }
    </script>
</head>
<body onLoad="userInfo.id.focus()">
    
    <div id="line">
        <br><br>
        <b><font size="6" color="gray">회원가입</font></b>
        <br><br><br>
        
        
       
        <form method="post" action="insertPro_info.jsp" name="userInfo" onsubmit="return checkValue()">
            <table>
                <tr>
                    <td id="title">학번</td>
                    <td>
                        <input type="text" name="id" maxlength="50">
                   </td>
                    <td>
                        <input type="button" name="confirm_id" value="중복확인" onClick="checkid(this.form.id.value)"> 
                    </td>
                    <td>                    
                        <input type="hidden" name="id_check_ok" value=0>
                    </td>
                </tr>
          
                <tr>
                    <td id="title">비밀번호</td>
                    <td>
                        <input type="password" name="password" maxlength="50">
                    </td>
                </tr>
                
                <tr>
                    <td id="title">비밀번호 재입력</td>
                    <td>
                        <input type="password" name="passwordcheck" maxlength="50">
                    </td>
                </tr>
                <tr>
                    <td id="title">이름</td>
                    <td>
                        <input type="text" name="name" maxlength="50">
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">성별</td>
                    <td>
                        <input type="radio" name="gender" value="남" checked>남
                        <input type="radio" name="gender" value="여" checked>여
                    </td>
                </tr>
                 
                <tr>
                    <td id="title">학과</td>
                    <td>
                     
                        <select name="major">
                            <option>신학과</option>
                            <option>영유아보육학과</option>
                            <option>컴퓨터소프트웨어학과</option>
                            <option>사회복지학과</option>
                            <option>간호학과</option>                        
                        </select>
                    </td>
                </tr>
                    
                
            </table>
            <br>
            <input type="submit" value="가입"/>
            <input type="button" value="취소">
        </form>
    </div>
</body>
</html>

