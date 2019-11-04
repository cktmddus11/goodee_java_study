<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인 화면</title>
<link rel="stylesheet" href="../../css/main.css">
<script>
function win_open(page){
	var op = "width=500, height=230, left=50, top=150";
	nw = open(page+".jsp", "id", op);
}
function inputcheck(f){
	if(f.pass.value==""){
		alert("비밀번호를 입력하세요.");
		f.pass.focus();
		return false;
	}
}
/* function openid(){
	var op = "width=500, height=230, left=50, top=150";
	nw = open("idForm.jsp", "id", op);
}
function openpw(){
	var op = "width=500, height=230, left=50, top=150";
	nw = open("pwForm.jsp", "pw", op);
} */
</script>
<!--  <link rel="stylesheet" href="/jspstudy1/model/css/main.css"> -->
<!--  ../ 상위폴더로 이동 : 상대경로방식
/javascript1/css/main.css ; 절대 경로 방식 webcontent부터 접근-->
</head>
<body>
	<form action="login.jsp" method="post" name="f" >
		<table>
			<caption>로그인</caption>
			<tr>
				<th>아이디</th>
				<td><input type="text" id="id" name="id"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" id="pass" name="pass"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="로그인">
				<input type="button" value="회원가입" 
				onclick="location.href='joinForm.jsp'">
				<input type="button" value="아이디찾기" onclick="win_open('idForm')">
				<input type="button" value="비밀번호 찾기" onclick="win_open('pwForm')">
				 </td>
			</tr>
		</table>
	</form>
</body>
</html>