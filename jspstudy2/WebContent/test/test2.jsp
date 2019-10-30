<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("euc-kr");
request.setAttribute("name", request.getParameter("name"));
request.setAttribute("age", request.getParameter("age"));
request.setAttribute("gender", Integer.parseInt(request.getParameter("gender")));
request.setAttribute("year",request.getParameter("year"));

Calendar cal = Calendar.getInstance();
int today = cal.get(Calendar.YEAR);
request.setAttribute("today", today);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	이름 : ${name}<br>
	나이 : ${age}<br>
	성별 : ${gender==1?"여자" :"남자"}<br>
	출생년도: ${year}<br>
	나이 : 만${today - year}<br>
	
</body>
</html>