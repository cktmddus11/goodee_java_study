<%@page import="model1.MemberDao"%>
<%@page import="model1.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���̵�</title>
<script>

function idsend(id){
	opener.document.f.id.value = id;
	self.close();
}
</script>
</head>
<body>
	<h2>���̵�</h2> 
	&nbsp; 
	${id}**<br>
		<input type="submit" value="���̵�����" onclick="idsend('${id}')"/>
</body>
</html>