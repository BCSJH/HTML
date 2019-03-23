<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
request.setCharacterEncoding("euc-kr");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="stylecss.css">
<script type="text/javascript">

function check_form(f) {//검사 함수

var name = document.getElementById("name");
var tel = document.getElementById("tel");
var count = document.getElementById("count");
var total = document.getElementById("total_price");
var totaltotal = document.getElementById("total");//값을 넘기기위해 hidden으로 만듦

//중첩으로 안하면 실행결화 창처럼 전체 빨간색이 안된다...return false때문에...
if ( name.value == "" || name.value.length == 0) {//이름 검사
    document.getElementById("name_chk").innerHTML = "*이름을 입력해주세요.";
    document.getElementById("name_chk").style.color="red";
    document.getElementById("total_price").innerHTML = "0원";
    document.getElementById("total_price").style.color="red";
    {
    	if (tel.value == "" || tel.value.length == 0) {//전화번호검사
    	    document.getElementById("tel_chk").innerHTML = "*전화번호를 입력해주세요.";
    	    document.getElementById("tel_chk").style.color="red";
    	    document.getElementById("total_price").innerHTML = "0원";
    	    document.getElementById("total_price").style.color="red";

    	    {
    	    if (count.value == "0") {//갯수 검사
    	        document.getElementById("count_chk").innerHTML = "*개수를 입력해주세요.";
    	        document.getElementById("count_chk").style.color="red";
    	        return false;
    	    }
    	    else
    	        document.getElementById("count_chk").innerHTML = "";

    	    }
    	    return false;
    	}
    	else
    	    document.getElementById("tel_chk").innerHTML = "";
    	}
    return false;
    
}
else//빨간 긁씨 지워주기
	 document.getElementById("name_chk").innerHTML = "";


{
if (tel.value == "" || tel.value.length == 0) {
    document.getElementById("tel_chk").innerHTML = "*전화번호를 입력해주세요.";
    document.getElementById("tel_chk").style.color="red";
    document.getElementById("total_price").innerHTML = "0원";
    document.getElementById("total_price").style.color="red";
    return false;
}
else
    document.getElementById("tel_chk").innerHTML = "";
}



{
if (count.value == "0") {
    document.getElementById("count_chk").innerHTML = "*개수를 입력해주세요.";
    document.getElementById("count_chk").style.color="red";
    return false;
}
else
    document.getElementById("count_chk").innerHTML = "";//입력되었을때 빨간긁씨 지우기
}
	document.getElementById("total_price").innerHTML = count.value*5000+"원";// 총합

	var retVal = confirm("주문하시겠습니까?");//완료되었을때 메시지창
	   if( retVal == true ){
		totaltotal.value = count.value*5000;
	   }else{
	   }



}


function reset_form(){//취소버튼
	var name = document.getElementById("name");
	var tel = document.getElementById("tel");
	var count = document.getElementById("count");
	var total = document.getElementById("total_price");
	
	   var retVal = confirm("정말 취소하시겠습니까?");
	   if( retVal == true ){//빨간글씨 지우기
			document.getElementById("name_chk").innerHTML = "";
		    document.getElementById("tel_chk").innerHTML = "";
		    document.getElementById("count_chk").innerHTML = "";//입력되었을때 빨간긁씨 지우기

	   }else{
	   }
	   
}

</script>

</head>
<body>
<!-- 201704007 김정현 -->
<div id="container">
<h2>201704007 김정현
상품 구매 양식</h2>
<p style="color:red; font-size:10px">모든 항목을 채워주세요.</p>
<hr>
<!--  -->
<form action="Lab1_result.jsp" name="form" method="post" 
onsubmit="return check_form()" onreset="">

<p>이름</p>
<input type="text" id="name" name="name" onfocus="" autofocus>
<span id="name_chk"> </span>
<p>전화번호</p>
<input type="text" id = "tel" name  = "tel" placeholder="제외하고 입력" onfocus="">
<span id="tel_chk"></span>
<p>사이즈</p>
<label>
<input type="radio" name="size" value="S" checked>S
<input type="radio" name="size" value="M">M<input type="radio" name=size value="L">L
</label>
<p>수량</p>
<select name="count" id="count" onclick="">
<option value="0" selected>선택하세요</option>
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
</select> <span id ="count_chk"></span>
<hr>
<div class="total">
금액 : <span id="total_price" style="font-size:25px">0</span>
<input type="hidden" name="total" id="total" value="">

</div>
<p><input type="submit" value="제출" onclick="check_form()">
<input type="reset" value="다시쓰기" onclick="reset_form()">


</form>
</div>
</body>
</html>