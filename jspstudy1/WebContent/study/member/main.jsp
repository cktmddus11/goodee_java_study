<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%--
    	1. �α��� �Ŀ� �������� ������
    	 	-> �α��� �ȵ� ��� => loginForm.jsp ������ �̵�
     --%>    
<%
String login = (String) session.getAttribute("login");
if(login== null || login.trim().equals("")){
	response.sendRedirect("loginForm.jsp");
}else{

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������</title>
</head>
<body>
	<h3><%=login %> �� �α��� �Ǿ����ϴ�. </h3>
	<h3><a href="logout.jsp">�α׾ƿ�</a></h3>
	<h3><a href="info.jsp?id=<%=login%>">ȸ������ ����</a></h3>
	<%if(login.equals("admin")){ %> <!-- admin �� �������� ��ũ -->
	<h3><a href="list.jsp">ȸ����� ����</a></h3>
	<% }%>
</body>
</html>
<%
}
%>