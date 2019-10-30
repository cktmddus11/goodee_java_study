<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>core 태그 : 조건문 예제</title>
</head>
<body>
	<h3>조건문 관련 태그 : if, choose 태그</h3>
	<c:if test="${5 < 10}"> <!--  test 속성은 boolean값이어야함 -->
		<h4>5는 10보다 작다</h4>
	</c:if>
	<% if(5 < 10) { %>
		<h4>5는 10보다 작다</h4>
	<%}%>
	<c:if test="${6+3 != 9}">
		<h4>6+3은 9가 아니다.</h4>
	</c:if>
	
	<c:choose>
		<c:when test="${5+10==510 }">
			<h4>5 + 4 = 510</h4>
		</c:when>
		<c:otherwise>
			<h4>5 + 10 = 모름</h4>
		</c:otherwise>
	</c:choose>
	
</body>
</html>