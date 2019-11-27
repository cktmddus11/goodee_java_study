<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%--
 list : 환율코드, 환율값
list2 : 국가이름

--%>
<table class="w3-table-all w3-border w3-left">
	<caption>
		<fmt:formatDate value="${today}" pattern="yyyy-MM-dd HH:mm" />
		현재
	</caption>
	<tr>
		<th class="w3-border">통화</th>
		<th>기준율</th>
		<th>받을때</th>
		<th>보낼때</th>
	</tr>
	<c:forEach var="m" items="${map}"> <!--   m  : 미국달러, 리스트 주소값 가리킴  -->
		<tr>
			<td>${m.key }<br>${m.value[0]}</td>
			<td>${m.value[3]}</td>
			<td>${m.value[1]}</td>
			<td>${m.value[2]}</td>
		</tr>
	</c:forEach>


</table>
