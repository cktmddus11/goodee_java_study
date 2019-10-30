<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
  <!--  태그 라이브러리 uri 이 파일에 가서 set이라는 태그를 사용
  prefix  c  -->
 <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSTL Core 태그 예제 : taglib 지시어 표시해야한다.</title>
</head>
<body>
	<h3>속성 설정 태그 : set, remove, out 태그</h3>
	<% session.setAttribute("test", "Hello JSTL"); %>
	<!--  속성조회 -->
	<c:set var="test" value="${'Hello JSTL' }" scope="session"/> <!-- scope 생략하면 page -->
	<!-- c : 접두어 c아래 set을 사용 -->
	<!--  둘이 비슷하지만 c:out가 더 보안에 좋음 -->
	test 속성 : ${sessionScope.test}<br>
	test 속성 : <c:out value="${test }" /><br>
		<!--  속성지우기 -->
	<c:remove var="test" />
	test 속성 : ${test}
</body>
</html>