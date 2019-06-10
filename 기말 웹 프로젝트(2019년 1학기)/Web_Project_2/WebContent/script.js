function inputCheck(form){
if
(form.mem_id.value==""){
alert("아이디를 입력해 주세요.");
document.regFrm.mem_id.focus();
return;
}
if
(form.mem_pw.value==""){
alert(
"비밀번호를 입력해 주세요.");
document.regFrm.mem_pw.focus();
return;
}
if
(form.mem_repwd.value==""){
alert("비밀번호를 확인해 주세요");
document.regFrm.mem_repwd.focus();
return;
}
if
(form.mem_pw.value != document.regFrm.mem_repwd.value){
alert("비밀번호가 일치하지 않습니다.");
document.regFrm.mem_repwd.value="";
document.regFrm.mem_repwd.focus();
return;
}
if
(form.mem_name.value==""){
alert("이름을 입력해 주세요.");
document.regFrm.name.focus();
return;
}
form.submit(); }

function zipSearch() {
	url = "zipSearch.jsp?search=n";
	window.open(url, "ZipCodeSearch","width=500,height=300,scrollbars=yes");
	}
	function deleteMember() {
	var result = confirm("정말로 회원을 탈퇴하시겠습니까?");
	if(result){
	location.href="deleteProc.jsp";
	}
	else {
	return false;
	}
	}
	function win_close(){
	self.close();
	}