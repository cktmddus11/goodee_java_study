<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��й�ȣ ����</title>
<link rel="stylesheet" href="../css/main.css">
<script>
function check(f){
	if(f.afterpass.value != f.checkafterpass.value){
		alert("���� ��й�ȣ�� ���� ��й�ȣ ���Է��� �ٸ��ϴ�.");
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
		<caption>��й�ȣ ����</caption>
		<tr>
			<th>���� ��й�ȣ</th>
			<td><input type="password" name="beforepass"/>
		</tr>
		<tr>
			<th>���� ��й�ȣ</th>
			<td><input type="password" name="afterpass"/>
		</tr>
		<tr>
			<th>���� ��й�ȣ ���Է�</th>
			<td><input type="password" name="checkafterpass"/>
		</tr>
		<tr>
		<td colspan="2"><input type="submit" value="��й�ȣ ����"></td>
		</tr>
		</table>
</form>
</body>
</html>