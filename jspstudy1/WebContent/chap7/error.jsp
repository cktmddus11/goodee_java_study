<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--현재페이지가 오류 처리 페이지임 --%>
<%@ page isErrorPage="true" %>    <%-- exception 객체 전달 --%>
<!DOCTYPE html>
<html>
<head>
<!--  현재페이지에서 오류발생시 error.jsp 제어 이동 -->
<meta charset="EUC-KR">
<title>오류 페이지</title>
</head>
<body>
	<h1>파라미터 name을 입력해주세요. </h1>
	<h1>계속 오류 발생시 전산부로 전화 요망 </h1>
	<h1>담당자 : 홍길동, 전화 : 1234 </h1>
	<%=exception.getClass().getName() %>
	<% exception.printStackTrace(response.getWriter()); %>
	<!-- 오류페이지의 출력 용량이 500바이트 미만인 경우
	브라우저에서 현재 페이지가 아닌 http 오류페이지를 출력할 수 
	있음 그러므로 500바이트 이상이 되도록 
 오류페이지의 메시지를 출력해야함. 이부분은 500바이트를 
 넘기기 위한 메시지임 -->>
</body>
</html>