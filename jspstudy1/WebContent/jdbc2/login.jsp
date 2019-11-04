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
	
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
			"jdbc:mariadb://localhost:3306/classdb","scott", "1234");
	String sql = "select * from member where id=?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	ResultSet rs = pstmt.executeQuery();
	// db로부터 id에 해당하는 정보 읽기
	if(rs.next()){ // id 존재
		//String id2 = rs.getString("id");
		//String password = rs.getString("pass");
		String dbPass = rs.getString("pass");
		if(pass.equals(dbPass)){
	/* 	if(id2.equals(id) && password.equals(pass)){ 
			List<String> list = new ArrayList(); */
			//list.add(id2);
			// list.add(password);
			//session.setAttribute("login", list);
			session.setAttribute("login", id);
			String name=rs.getString("name");
			%>
			<script>alert("<%=name%>로그인되었습니다.");
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