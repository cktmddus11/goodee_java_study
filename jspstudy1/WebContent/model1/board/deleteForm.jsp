<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시판 삭제 화면</title>
<script>
function check(f){
	if(f.pass.value==""){
		alert("비밀번호를 입력하세요.");
		f.pass.focus();
		return  false;
	}
}
</script>
<link rel = "stylesheet" href="../css/main.css">
</head>
<body>
	<form action="delete.jsp" name="f" method="post" onsubmit="return check(this)">
		<input type="hidden" name="num" value="<%=request.getParameter("num") %>">
		<table>
			<caption>게시글 삭제화면 </caption>
			<tr>
				<th>게시글 비밀번호</th>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="게시글 삭제"></td>
			</tr>
		</table>
	</form>
</body>
</html>