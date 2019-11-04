<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>예외 발생 페이지</title>
</head>
<body>
	<%=request.getParameter("name").trim()  %>
</body>
</html>