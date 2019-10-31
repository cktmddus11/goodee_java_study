<%@page import="model1.MemberDao"%>
<%@page import="model1.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>비밀번호</title>
<script>
function pwclose(){
	self.close();
}
</script>
<link rel="stylesheet" href="../css/main.css">

</head>
<body>
	<h2>비밀번호</h2> 
	&nbsp; 
	**${pw}<br>
	<input type="button" value="닫기" onclick="javascript:pwclose()">

</body>
</html>
