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
		request.setCharacterEncoding("euc-kr"); //한글 깨짐 방지

		
	%>
	<h1>수강 신청</h1>
<!--테이블 만들기-->
<table border="1">
<tr>
<th>번호</th>
<th>선택한과목</th>
<th>학점</th>
<th>학년</th>
</tr>

	<%
		
		String[] studycheck = request.getParameterValues("study"); //배열
		int total = 0; //총 학점
		String studylist=""; 
		
		for (int i = 0; i < studycheck.length; i++) { 
			%>
			<tr><td><% out.print(i+1); %></td><td><!--i를 0으로 잡아서 _1을 해야 1부터 시작함-->
			<%
			if (studycheck[i].equals("웹 시스템 설계 및 개발")) { //체크 박스에 들어간 값이 "웹시스템 설계및개발과 같을경우 총값과 책리스트에 저장한다
				studylist += "[웹 시스템 설계 및 개발]";
				total += 3;
				out.print("["+"웹 시스템 설계 및 개발"+"]"+" ");
			}
			else if (studycheck[i].equals("자바기반응용프로그래밍")) {//체크 박스에 들어간 값 비교
				studylist += "[자바기반응용프로그래밍]";
				total += 3;
				out.print("["+"자바기반응용프로그래밍"+"]"+" ");
			}
			else if (studycheck[i].equals("컴퓨터프로그래밍기초")) {
				studylist += "[컴퓨터프로그래밍기초]";
				total += 3;
				out.print("["+"컴퓨터프로그래밍기초"+"]"+" ");
			}
			else if (studycheck[i].equals("운영체제")) {
				studylist += "[운영체제]";
				total += 3;
				out.print("["+"운영체제"+"]"+" ");
			}
			%>
			</td><!-- 소스가 정말 더럽다... 테이블로 작성해야되서... 자바 코드가 부분부분 껴있다... -->
			<td>3학점</td><td>
			<%
			if (studycheck[i].equals("웹 시스템 설계 및 개발")) { //체크 박스에 들어간 값
				out.print("3학년");
			}
			else if (studycheck[i].equals("자바기반응용프로그래밍")) {
				out.print("2학년");
			}
			else if (studycheck[i].equals("컴퓨터프로그래밍기초")) {
				out.print("1학년");
			}
			else if (studycheck[i].equals("운영체제")) {
				out.print("3학년");
			}
			%>
			</td>
			</tr>
			<%
		}
	%>
	<tr>
	<td colspan="3" ><p align="center">총 학점</p></td>
	<td><font color="red"><%=total%></font></td>
	<!-- 총 가격을 출력 -->
	
</table>
	
	<form action="./main.jsp?pagefile=result" name="send_result" method="post">

	<input type="hidden" name="pass" value="<%=total%>">
	<input type="hidden" name="boxck" value="<%=studylist%>">
	<br>
	<input type="submit" value="신청">
	</form>
<%total =0; %> <!-- 값을 초기화 -->


</body>
</html>