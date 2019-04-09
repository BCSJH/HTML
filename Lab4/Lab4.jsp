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


function check(){//체크가 다 되어있는지 확인하기 위한 함수
	var frm = document.getElementById("form");//각각의 옵션 불러오기 위한 변수

	if(frm.coffee.value=="" || frm.coffee.value == null)//커피 선택을 하지 않았을 경우
	{
		alert("커피선택해주세요.");
		return false;
	}

	if(frm.size.value==null ||frm.size.value=="0")//사이즈 선택을 하지 않았을 경우
	{
		alert("사이즈선택해주세요.");
		return false;
	}
	return true;//다 선택이 되어있을 경우 반환
}


function reset_form(){//취소 버튼을 눌렀으 경우
	var del=confirm("정말 취소하시겠습니까?");
if(del)
	return true;
else
	
	return false;
}
</script>

<hr>
<h1>음료 주문하기</h1>
<hr>
<form action="Lab4_result.jsp" method="post" id="form" onsubmit="return check()" onreset="return reset_form()">
    <label><!-- 각각의 옵션 마다 묶기 위함 -->
    <h2>커피종류</h2><!-- 커피 종류 선택 -->
    <input type="radio" name="coffee" value="아메리카노"> 아메리카노
    <input type="radio" name="coffee" value="카페라떼"> 카페라떼
    <input type="radio" name="coffee" value="카페모카"> 카페모카
    </label> 
    
    <label><!-- 각각의 옵션 마다 묶기 위함 -->
   <h2>옵션</h2> <!-- 커피 사이즈 -->
    <input type="radio" name="option" value="hot" checked> hot
    <input type="radio" name="option" value="ice"> ice
    </label>
        
   <label><!-- 각각의 옵션 마다 묶기 위함 -->
   <h2>사이즈</h2><!-- 사이즈 선택 -->
    <select name="size">
        <option name="size" value="0" selected>선택하세요</option>
        <option name="size" value="Tall">Tall</option>
        <option name="size" value="Grandl">Grandl</option>
        <option name="size" value="Venti">Venti</option>
    </select>
	</label>
	<br>
	<br>
	<br>
 	<label><!-- 각각의 옵션 마다 묶기 위함 -->
    <input type="submit" value="음료 주문하기">
    <input type="reset" value="취소">
    </label>
</form>
</body>
</html>