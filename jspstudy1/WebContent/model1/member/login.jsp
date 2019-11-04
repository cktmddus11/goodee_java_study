<%@page import="model1.Member"%>
<%@page import="model1.MemberDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%-- 
1. id 에 해당하는 정보를 db에서 조회
2. -내용이 존재하면 비밀번호 검증
	-> db 의 비밀번호와 입력된 비밀번호 확인
		맞는 경우 : session 로그인 정보 등록. 확인 메시지 출력.
		틀린 경우 :  '비밀번호가 틀립니다' 메시지 
	- id 가 없으면 화면에 '아이디를 확인하세요' 메시지 출력
		=> loginForm.jsp 페이지로 이동

 --%>
<meta charset="EUC-KR">
<title>로그인 action </title>
</head>
<body>
	<%
	request.setCharacterEncoding("euc-kr");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	//                            Model역할을 하는 DAO data access object
	// MemberDao 클래스 : Model 담당 클래스 
	// Model : dbms 와 연관있는 기능을 가진 클래스
	Member mem = new MemberDao().selectOne(id);
	// public , string 매개변수 리턴타입 Member
	if(mem != null){ //id 존재
		// pass 화면에 입력한 비밀번호, mem.getPass db 비밀번호
		if(pass.equals(mem.getPass())){ // 비밀번호 맞는 경우 . 로그인
			session.setAttribute("login", id);
			%>
			<script>alert("<%=mem.getName()%>로그인되었습니다.");
			location.href="main.jsp"</script>
			<%
		}else {
			%>
			<script>alert("비밀번호가 틀립니다. ");
			location.href="loginForm.jsp"</script>
			<%
		}
	}else{ // id 없는 경우
		%>
		<script>alert("아이디를 확인하세요.");
		location.href="loginForm.jsp";</script>
		<%
	}
	%>
</body>
</html>