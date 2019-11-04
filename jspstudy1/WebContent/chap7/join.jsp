<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="./css/main.css">
<title></title>
</head>
<body>
<!-- 입력된 내용을 join.jsp 에 출력하기 
단 1. useBean, setProperty 를 이용하기
2. Bean클래스의 이름은 chap7.Member -->
		<% request.setCharacterEncoding("euc-kr");%>
		<!--                                                 객체 만듦 -->
		<jsp:useBean id="member" class="chap7.Member" />
		<!-- form  파라미터랑 프로퍼티값비교?해서 들어감?  *  -->
		<jsp:setProperty property="*" name="member" />
		<!--  member 객체에 파라미터 값이 전부 저장된 상태 -->
		<jsp:setProperty property="password" name="member" param="pass" />	 
		
		<table border="1" style="border-collapse:collapse;">
		<caption>회원가입 </caption>
		<tr>	
			<td>아이디</td>
			<td><jsp:getProperty name="member" property="id" /> </td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><jsp:getProperty name="member" property="password" /> </td>
		</tr>
		<tr>
			<td>성별</td>
		<%-- 	<td><jsp:getProperty name="member" property="gender" /> </td> --%>
<%-- 			<td><%=((member.getGender() == 1)?"남자":"여자") %></td> --%>
			<td><jsp:getProperty name="member" property="gender2" /> </td>
		</tr>
		<tr>
			<td>나이</td>
			<td><jsp:getProperty name="member" property="age" /> </td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><jsp:getProperty name="member" property="email" /> </td>
		</tr>
		
		
		
	</table>
</body>
</html>