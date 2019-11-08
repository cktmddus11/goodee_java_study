<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title><decorator:title/></title> <!--  ��û�� �������� ������ ������ -->
<decorator:head/> <!-- ��û�� �������� head�κ��� title������ ������������?  -->
<link rel="stylesheet"  href="${path}/css/main.css"> <!-- css�̰��ϳ��� �� �Ǵϱ� ������ ������ ? -->
<script type="text/javascript" src= "http://cdn.ckeditor.com/4.5.7/full/ckeditor.js"></script>
</head> <!--  ���� �����Ŷ� ������ ������ ���⸸ �ٲٸ�� !! -->
<body>
	<table>
		<tr>
			<td colspan="3"  align="right">
			������ �������� ���� 2ȸ�� ���α׷� ����
			<div style="float :right">
			<c:if test="${sessionScope.login != null }">
			${sessionScope.login}���� �α��� �ϼ̽��ϴ� &nbsp;
			 <a href="${path}/model2/member/logout.me">�α׾ƿ�</a>
			 </c:if>
			 <c:if test="${sessionScope.login == null }">
			 	<a href="${path}/model2/member/loginForm.me">�α���</a>
			 	 &nbsp; <a href="${path}/model2/member/joinForm.me">ȸ������</a>
			 </c:if>
			 </div>
			 </td>
		</tr>
		<tr>
			<td width = "15%">
				<a href="${path}/model2/member/main.me">ȸ������</a><br>
				<a href="${path}/model2/board/list.do">�Խ���</a><br>
			</td>
			<td colspan="2" style="text-align:left; vertical-align : top">
				<decorator:body /> 
			</td>
		</tr>
		<tr>
			<td colspan="3"> �����ī���� Since 2016</td>
		</tr>
	</table>
</body>
</html>