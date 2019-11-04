<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ page import="java.util.*, java.text.* " %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
request.setCharacterEncoding("euc-kr");
String date = (String) session.getAttribute("date");
if(date == null){
	%>
	<script>
	alert('날짜 등록후 거래하세요. date1.jsp로 갑니다.');
	location.href="date1.jsp"
	</script>
<%}else{ %>
	<p>반갑습니다. 등록된 날짜 : <%=date %></p>
	<%
	session.removeAttribute("date"); // session.invalidate()
	%>
<% } %>

</body>
</html>