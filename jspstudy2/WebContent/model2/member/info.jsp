<%@page import="model2.Member"%>
<%@page import="model2.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%-- 1. id 파라미터 값을 조회 
		2. 로그인 상태 검증. 
			로그아웃 상태 : '로그인이 필요합니다. ' 메세지 출력. loginForm.jsp 이동
		3. 로그인 상태
			id 의 값과 login값이 다른 경우, 또는 admin이 아닌경우
				'내정보만 조회가능합니다.' 메시지 출력. main.jsp 이동
	 	4. db에서 id값에 해당하는 데이터 조회. 
	 	5. 조회된 내용을 화면에 출력하기 					
--%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원정보조회</title>
<link rel ="stylesheet" href="../../css/main.css">
</head>
<body>		
	<table>
		<caption>회원 정보 보기</caption>
		<tr>
			<td rowspan="6"> <img src="picture/${info.picture }" width="150"
			height="180"></td>
			<th>아이디</th>
			<td>${info.id }</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${info.name }</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>${info.gender==1?"남":"여"}</td>
		</tr>		
		<tr>
			<th>전화</th>
			<td>${info.tel}</td>
		</tr>	
		<tr>
			<th>이메일</th>
			<td>${info.email}</td>
		</tr>
		<tr>
			<td colspan="2"><a href="updateForm.me?id=${info.getId()}">[수정]</a>
			<c:if test="${info.id != 'admin' && sessionScope.login != 'admin'}">
				<a href="deleteForm.me?id=${info.id }">[탈퇴]</a>
			</c:if>
			</td>
		</tr>
	</table>
</body>
</html>
