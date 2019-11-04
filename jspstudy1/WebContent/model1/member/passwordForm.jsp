<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>비밀번호 변경</title>
<link rel="stylesheet" href="../css/main.css">
<script>
function check(f){
	if(f.afterpass.value != f.checkafterpass.value){
		alert("변경 비밀번호와 변경 비밀번호 재입력이 다릅니다.");
		f.checkafterpass.value = "";
		f.checkafterpass.focus();
		return false;
	}
}
</script>
</head>
<body>
<form action="password.jsp" method="post" name="f" onsubmit="return check(this)">
	<!-- <input type="hidden" name="id2" value=""> -->
	<table>
		<caption>비밀번호 변경</caption>
		<tr>
			<th>현재 비밀번호</th>
			<td><input type="password" name="beforepass"/>
		</tr>
		<tr>
			<th>변경 비밀번호</th>
			<td><input type="password" name="afterpass"/>
		</tr>
		<tr>
			<th>변경 비밀번호 재입력</th>
			<td><input type="password" name="checkafterpass"/>
		</tr>
		<tr>
		<td colspan="2"><input type="submit" value="비밀번호 변경"></td>
		</tr>
		</table>
</form>
</body>
</html>