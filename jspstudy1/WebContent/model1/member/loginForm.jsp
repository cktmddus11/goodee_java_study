<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α��� ȭ��</title>
<link rel="stylesheet" href="../../css/main.css">
<script>
function win_open(page){
	var op = "width=500, height=230, left=50, top=150";
	nw = open(page+".jsp", "id", op);
}
function inputcheck(f){
	if(f.pass.value==""){
		alert("��й�ȣ�� �Է��ϼ���.");
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
<!--  ../ ���������� �̵� : ����ι��
/javascript1/css/main.css ; ���� ��� ��� webcontent���� ����-->
</head>
<body>
	<form action="login.jsp" method="post" name="f" >
		<table>
			<caption>�α���</caption>
			<tr>
				<th>���̵�</th>
				<td><input type="text" id="id" name="id"></td>
			</tr>
			<tr>
				<th>��й�ȣ</th>
				<td><input type="password" id="pass" name="pass"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="�α���">
				<input type="button" value="ȸ������" 
				onclick="location.href='joinForm.jsp'">
				<input type="button" value="���̵�ã��" onclick="win_open('idForm')">
				<input type="button" value="��й�ȣ ã��" onclick="win_open('pwForm')">
				 </td>
			</tr>
		</table>
	</form>
</body>
</html>