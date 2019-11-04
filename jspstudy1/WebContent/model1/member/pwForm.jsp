<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
	<form name="f" method="post" action="pw.jsp" onsubmit="return check()">
		<table>
			<caption>비밀번호 찾기</caption>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id">
			</tr>
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