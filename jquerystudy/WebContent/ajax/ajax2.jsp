<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8"/>
<sql:setDataSource var="conn" driver="org.mariadb.jdbc.Driver" 
		url= "jdbc:mariadb://localhost:3306/classdb"
		user = "scott" password="1234" />
<sql:query var="rs" dataSource="${conn}">
	select * from member where id = ? and pass = ?
	<sql:param>${param.id}</sql:param> 
	<sql:param>${param.password}</sql:param> 
</sql:query>	
 
<c:if test="${!empty rs.rows}"> <!-- 아이디와 비밀번호 일치해서 데이터가 있을때  -->
<!--  rs.rows 데이터가 list형태로 있음 -->
<%-- 	 <h1>반갑습니다 ${param.id}님</h1> --%>
 	 <h1>반갑습니다 ${rs.rows[0].name}님</h1> <!-- list의 0번째 값  -->
</c:if>
<c:if test="${empty rs.rows}">
	 <h1>아이디 또는 비밀번호가 없습니다.</h1>
</c:if>
