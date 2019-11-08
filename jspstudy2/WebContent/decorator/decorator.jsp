<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title><decorator:title/></title> <!--  요청한 페이지의 제목을 가져옴 -->
<decorator:head/> <!-- 요청한 페이지의 head부분의 title이후의 내용을가져옴?  -->
<link rel="stylesheet"  href="${path}/css/main.css"> <!-- css이거하나로 다 되니까 나머지 지우면됨 ? -->
<script type="text/javascript" src= "http://cdn.ckeditor.com/4.5.7/full/ckeditor.js"></script>
</head> <!--  구조 같은거랑 디자인 같은거 여기만 바꾸면됨 !! -->
<body>
	<table>
		<tr>
			<td colspan="3"  align="right">
			디지털 컨버전스 과정 2회차 프로그램 연습
			<div style="float :right">
			<c:if test="${sessionScope.login != null }">
			${sessionScope.login}님이 로그인 하셨습니다 &nbsp;
			 <a href="${path}/model2/member/logout.me">로그아웃</a>
			 </c:if>
			 <c:if test="${sessionScope.login == null }">
			 	<a href="${path}/model2/member/loginForm.me">로그인</a>
			 	 &nbsp; <a href="${path}/model2/member/joinForm.me">회원가입</a>
			 </c:if>
			 </div>
			 </td>
		</tr>
		<tr>
			<td width = "15%">
				<a href="${path}/model2/member/main.me">회원관리</a><br>
				<a href="${path}/model2/board/list.do">게시판</a><br>
			</td>
			<td colspan="2" style="text-align:left; vertical-align : top">
				<decorator:body /> 
			</td>
		</tr>
		<tr>
			<td colspan="3"> 구디아카데미 Since 2016</td>
		</tr>
	</table>
</body>
</html>