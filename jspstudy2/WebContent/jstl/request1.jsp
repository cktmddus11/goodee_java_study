<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>전송된 파라미터 정보</title>
</head>
<body>
	<fmt:requestEncoding value="euc-kr"/>
	이름 : ${param.name }<br>
   나이 : ${param.age }<br>
	성별 : ${param.gender == 1 ?"남":"여"}<br>
	취미 : ${paraam.hobby}<br>
	출생년도 : ${paraam.year}<br>

	<h3>취미 정보 모두 조회하기</h3>
	<c:forEach var="h" items="${paramValues.hobby}">
		${h } &nbsp;&nbsp;
	</c:forEach>
	<br>
	<!--  paramValues.hobby 배열의 형태로  -->
	${paramValues.hobby[0]}<br>
<%-- 	<%                                   
		String[] hobbies = request.getParameterValues("hobby");
		for(String h : hobbies){ %>
			<%=h %>,      <!--   &nbsp; &nbsp; -->
	<%}%> --%>
	<h3>모든 파라미터 정보 조회하기</h3>
	<table>
		<tr>
			<th>파라미터 이름 </th>
			<th>파라미터 값</th>
		</tr>
		<c:forEach var="p" items="${paramValues}"><!--  paramValues모든 파라미터정보 다가짐 EL의 내장객체-->
			<tr>
				<td>${p.key}</td>
				<td><c:forEach var="v" items="${p.value}">
				${v}
				</c:forEach></td>
			</tr>
		</c:forEach>
		</table>
		<%-- <%
		// getParameterNames() : 파라미터의 이름들
		// Emumeration : Interator 구버전. 반복자
		Enumeration e = request.getParameterNames();
		while(e.hasMoreElements()){ 
			// pname : 파라미터의 이름
			String pname = (String)e.nextElement();
		// hobby 
			String[] pvalue = request.getParameterValues(pname);

		%>
		
		<tr>
			<td><%=pname  %></td>
			<td><% for(String v : pvalue){  %>
				<%=v %>&nbsp; &nbsp; 
				<%} %>
			</td>
		</tr>
		<% } %>
	</table>
	
	 --%>
	
	
	
	
</body>
</html>