<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%--
    	1. 로그인 후에 보여지는 페이지
    	 	-> 로그인 안된 경우 => loginForm.jsp 페이지 이동
     --%>
 <%
 String login = (String) session.getAttribute("login");
 if(login == null || login.trim().equals("")){
	 response.sendRedirect("loginForm.jsp");
 }else {
 
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원관리</title>
</head>
<body>
	<h3><%=login  %>로 로그인 되었습니다. </h3>
	<h3><a href="logout.jsp">로그아웃</a></h3>
	<h3><a href="info.jsp?id=<%=login %>">회원정보 보기</a></h3>
	<% if(login.equals("admin")) { %>
		<a href="list.jsp">회원목록 보기</a>
	<%} %>
	
</body>
</html>
<% 
}
%>