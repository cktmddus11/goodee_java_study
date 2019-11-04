<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>아이디 찾기</title>
<script>
function check(){
	var f = document.f;
	if(f.email.value == ""){
		f.email.focus();
		alert("이메일을 입력하세요.");
		return false;
	}
	if(f.tel.value == ""){
		f.tel.focus();
		alert("전화번호를 입력하세요.");
		return false;
	}
}
</script>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
	<form name="f" method="post" action="id.jsp" onsubmit="return check()">
		<table>
			<caption>아이디 찾기</caption>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email">
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="tel">
			</tr>
			<tr>
				<td colspan="2"><input type="submit"  value="아이디 찾기">
			</tr>
		</table>
	</form>
</body>
</html>