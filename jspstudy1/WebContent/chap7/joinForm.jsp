<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입</title>
<link rel="stylesheet" href="./css/main.css">
</head>
<body>
	<form action="join.jsp" method="post">
		<table><caption>회원가입</caption>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>비밀번호
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
			<td>성별</td>
         		<td><input type="radio" name="gender" value="1" checked>남
            		<input type="radio" name="gender" value="2">여
            	</td>
            </tr>
            <tr>
				<td>나이</td>
				<td><input type="text" name="age"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="회원가입"></td>
			</tr>			
		</table>
	</form>
</body>
</html>