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
	alert('��¥ ����� �ŷ��ϼ���. date1.jsp�� ���ϴ�.');
	location.href="date1.jsp"
	</script>
<%}else{ %>
	<p>�ݰ����ϴ�. ��ϵ� ��¥ : <%=date %></p>
	<%
	session.removeAttribute("date"); // session.invalidate()
	%>
<% } %>

</body>
</html>