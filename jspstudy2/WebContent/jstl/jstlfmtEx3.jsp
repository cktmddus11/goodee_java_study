<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>fmt 태그 : 인코딩</title>
</head>
<body>
	<fmt:requestEncoding value="euc-kr"/>
	<form method="post" name="f">
		이름 : <input type="text" name="name" value="${param.name }"><br>
		입사일 : <input type="text" name="hiredate" value="${param.hiredate}">
		yyyy-MM-dd 형태로 입력<br>
		급여 : <input type="text" name="salary" value="${param.salary}"><br>
		<input type="submit" value="전송">
	</form>
	<hr>
	이름 : ${param.name }<br>
	입사일 : ${param.hiredate }<br>
	급여 : ${param.salary}<br>
	
	<h3>입사일은 yyyy년 MM월 dd일 E요일 형태로 출력<br>
	급여는 세자리마다, 를 출력하기<br>
	연봉은 급여 * 12 계산하고, 세자리마다 , 로 출력</h3>
	<c:catch var="formatexception">
		<fmt:parseDate value="${param.hiredate}" pattern="yyyy-MM-dd" var="hiredate"/>
	</c:catch>
	<c:if test="${formatexception == null}">
		<fmt:formatDate value="${hiredate}" pattern="yyyy년 MM월 dd일 E요일" var="hiredate2"/>
 		<fmt:formatNumber  value="${param.salary}" pattern="##,###" var="salary"/>
		<fmt:formatNumber value="${param.salary * 12}" pattern="##,###" var="total"/> 
		이름 : ${param.name }<br>
		입사일 : ${hiredate2}<br>
		급여 : ${salary}<br>
		연봉 : ${total}
	</c:if>
	<c:if test="${formatexception != null }">
		<font color='red' >입사일은 yyyy-MM-dd 형태로 입력하세요</font>
	</c:if>
	
</body>
</html>