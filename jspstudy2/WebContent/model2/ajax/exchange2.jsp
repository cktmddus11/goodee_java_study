<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%--
 list : ȯ���ڵ�, ȯ����
list2 : �����̸�

--%>
<table class="w3-table-all w3-border w3-left">
	<caption>
		<fmt:formatDate value="${today}" pattern="yyyy-MM-dd HH:mm" />
		����
	</caption>
	<tr>
		<th class="w3-border">��ȭ</th>
		<th>������</th>
		<th>������</th>
		<th>������</th>
	</tr>
	<c:forEach var="m" items="${map}"> <!--   m  : �̱��޷�, ����Ʈ �ּҰ� ����Ŵ  -->
		<tr>
			<td>${m.key }<br>${m.value[0]}</td>
			<td>${m.value[3]}</td>
			<td>${m.value[1]}</td>
			<td>${m.value[2]}</td>
		</tr>
	</c:forEach>


</table>
