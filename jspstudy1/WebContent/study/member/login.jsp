<%@page import="model1.MemberDao"%>
<%@page import="model1.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
  <%-- 
1. id 에 해당하는 정보를 db에서 조회
2. -내용이 존재하면 비밀번호 검증
	-> db 의 비밀번호와 입력된 비밀번호 확인
		맞는 경우 : session 로그인 정보 등록. 확인 메시지 출력.
		틀린 경우 :  '비밀번호가 틀립니다' 메시지 
	- id 가 없으면 화면에 '아이디를 확인하세요' 메시지 출력
		=> loginForm.jsp 페이지로 이동

 --%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인 action</title>
</head>
<body>
	<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	Member member = new MemberDao().selectOne(id);
	if(member == null){%>
		<script>alert("아이디를 확인하세요."); 
		location.href="loginForm.jsp"</script>
	<%}else{
		if(pass.equals(member.getPass())){
			session.setAttribute("login", id);
			%>
			<script>alert("<%=member.getId()%>으로 로그인 성공");
			location.href="main.jsp"</script>
		<%
		}else{%>
			<script>
				alert("비밀번호가 틀립니다. ");
				location.href="loginForm.jsp";
			</script>
		<% }
	}
			
			
	%>
</body>
</html>