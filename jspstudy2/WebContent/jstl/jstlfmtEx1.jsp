<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
  <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSTL 형식화 태그 예제</title>
</head>
<body>
	<fmt:formatNumber value="500000" type="currency" currencySymbol="￦"/><br>
	<fmt:formatNumber value="0.15" type="percent"/><br>
	<fmt:formatNumber value="500000.12345" pattern="###,###.00"/><br>
	<%-- fmt : setLocale : 지역설정 --%>
	<fmt:setLocale value="es_US" />
	<fmt:formatNumber value="500000" type="currency"/><br>
	<fmt:setLocale value="ko_KR" />
	<fmt:formatNumber value="500000" type="currency"/><br>
	
	<h3>날짜 관련 형식 지정하기</h3>
	<jsp:useBean id="today" class="java.util.Date"/>
	<c:set var="today" value="<%=new java.util.Date() %>"></c:set> 
	년월일 : <fmt:formatDate value="${today }" type="date"/><br>
	시분초 : <fmt:formatDate value="${today }" type="time"/><br>
	일시 : <fmt:formatDate value="${today }" type="both"/><br>
	형식 지정 : <fmt:formatDate value="${today }" pattern="yyyy/MM/dd HH:mm:ss a E"/><br>
	일시1 : <fmt:formatDate value="${today }" type="both" timeStyle="long" dateStyle="long"/><br>
	일시2 : <fmt:formatDate value="${today }" type="both" timeStyle="short" dateStyle="short"/><br>
	일시3 : <fmt:formatDate value="${today }" type="both" timeStyle="full" dateStyle="full"/><br>
	일시4 : <fmt:formatDate value="${today }" type="both" timeStyle="full" dateStyle="full" timeZone="GMT"/><br>	
	<!--  원하는 형태의 문자열로 바꿈 -->
</body>
</html>