<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>    
<%--  
1. 로그아웃 상태 : 로그인이 필요합니다. 메세지 출력 -- 상속클래스에서 이미함
							loginForm.jsp 로페이지 이동
2. 로그인 상태 
					일반 사용자 : 관리자만 가능한 거래입니다. 메시지 출력-- 상속클래스에서 이미함
										main.jsp 로 페이지 이동
					관리자 
3. db에서 모든 회원정보를 조회하여 List<Member> 객체로 리턴
	List<Member> list = new MemberDao().lsit() 

 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원목록보기</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
	<table>
		<caption>회원 목록</caption>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>성별</th>
			<th>전화</th>
			<th>&nbsp;</th>
		</tr>
		<c:forEach var="m" items="${list}">
		<tr>
			<td><a href="info.me?id=${m.id}">${m.id}</a></td>
			<td>${m.name}
			<td>${m.gender ==1?"남":"여"}</td>
			<td>${m.tel}</td>
			<td><a href="updateForm.me?id=${m.id}">[수정]</a>
			<c:if test="${m.id != 'admin'}">
				<a href="delete.me?id=${m.id}">[강제탈퇴]</a>
			</c:if>
			</td>
		</tr>	
	</c:forEach>
	</table>
</body>
</html>
