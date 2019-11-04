<%@page import="model1.MemberDao"%>
<%@page import="model1.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String email = request.getParameter("email");
String tel = request.getParameter("tel");
MemberDao dao = new MemberDao();
String id = dao.selectID(email, tel);

if(id == null){ // id를 못찾은 경우
	%>
	<script>
	alert("정보에 맞는 id가 없습니다.");
	location.href="idForm.jsp";
	</script>
	<% 
}else{ // id 를 찾은 경우
	
	String id2 = id.substring(0, 3);  // tes 
	String displayid = id2; // 넘겨줄 id
	int len = id.length() - id2.length(); // 5 - 3 = 2
	for(int i = 0;i<len;i++){
		id2 += "*";
	}
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>아이디</title>
<script>
<%-- function send(){
	opener.document.f.id.value ="<%=displayid %>";
	self.close();
} --%>
function idsend(id){
	opner.document.f.id.value = id;
	self.close();
}
</script>
</head>
<body>
	<h2>아이디</h2> 
	&nbsp; 
<%-- 	<%=id2 %> --%>
	<%=id.substring(0, id.length() -2) + "**" %>
	<br>
<!-- 	<input type="submit" value="아이디전송" onclick="send()"/> -->
		<input type="submit" value="아이디전송" onclick="idsend('<%=id.substring(0, id.length()-2) %>')"/>
</body> <!--  location.href = 'idsend()' -->
</html>

	<% 
}

%>