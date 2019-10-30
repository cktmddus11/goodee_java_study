<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>
<!-- <script>
var op = "${param.cal}"
//if(op == '') op = "+";
var cal = document.getElementsByName("cal");
</script> -->
</head>
<body>
	<form method="post" name="f" action="test1.jsp" onsubmit="return send()">
	x : <input type="text" name="num1" value="${param.num1 }">
	<select name="cal">
		<option value="+" ${param.cal eq '+'?"selected":""}>+</option>
		<option value="-" ${param.cal eq '-'?"selected":""}>-</option>
		<option value="*" ${param.cal eq '*'?"selected":""}>*</option>		
		<option value="/" ${param.cal eq '/'?"selected":""}>/</option> 
	<!-- 	<option>+</option>
		<option>-</option>
		<option>*</option>
		<option>/</option> -->
	</select>
	y : <input type="text" name="num2" value="${param.num2 }">
	<input type="submit" value="=">
	</form>
	<h1>
	<c:if test="${param.cal eq '+'}">
	${param.num1} ${param.cal} ${param.num2} ${'='} ${param.num1+param.num2}<br>
	</c:if>
	<c:if test="${param.cal eq '*'}">
		${param.num1} ${param.cal} ${param.num2} ${'='} ${param.num1*param.num2}<br>
	</c:if>
	<c:if test="${param.cal eq '/'}">
		${param.num1} ${param.cal} ${param.num2} ${"="} ${param.num1/param.num2}<br>
	</c:if>
	<c:if test="${param.cal eq '-'}">
	${param.num1} ${param.cal} ${param.num2} ${"="} ${param.num1-param.num2}<br>
	</c:if>
	</h1>
</body>
</html>