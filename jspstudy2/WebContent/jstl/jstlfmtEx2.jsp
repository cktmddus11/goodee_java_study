<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
 <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>형식 관련 태그 예제2</title>
</head>
<body>
	<h3>Format 된 숫자를 일반 숫자로 다시 변경</h3>
	<fmt:parseNumber value="20,000" var="num1" pattern="##,###"/><br>
	<fmt:parseNumber value="10,000" var="num2" pattern="##,###"/><br>
	합 : ${num1 + num2} <br> <!-- var을 안하면 그냥 출력되는데 var을해서 값을                        
	 var에 저장하고 있어서 출력안됨 -->
	합 : <fmt:formatNumber value="${num1+num2 }" pattern="##,###" var="num3" />${num3}<br> 
	<h3>Format 된 날짜를 일반 날짜로 변경</h3>
	<fmt:parseDate value="2019-10-30 12:00:00" pattern="yyyy-MM-dd HH:mm:ss" var="day"/>
	날짜 : ${day }<br>
	<!--  format 숫자 또는 문자를 형식화 -->
	<!--  parse 형식화 된걸 숫자 또는 문자로  -->
	<h3>2019-10-30의 요일 출력하기</h3>
	<c:set var="today" value="<%=new java.util.Date() %>"></c:set> 
	<fmt:formatDate value = "${today}" pattern="yyyy-MM-dd"  var="today2"/>
	${today2} : <fmt:formatDate value="${today}" pattern="E요일" />
	
</body>
</html>