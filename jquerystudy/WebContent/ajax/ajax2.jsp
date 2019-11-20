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
 
<c:if test="${!empty rs.rows}"> <!-- ���̵�� ��й�ȣ ��ġ�ؼ� �����Ͱ� ������  -->
<!--  rs.rows �����Ͱ� list���·� ���� -->
<%-- 	 <h1>�ݰ����ϴ� ${param.id}��</h1> --%>
 	 <h1>�ݰ����ϴ� ${rs.rows[0].name}��</h1> <!-- list�� 0��° ��  -->
</c:if>
<c:if test="${empty rs.rows}">
	 <h1>���̵� �Ǵ� ��й�ȣ�� �����ϴ�.</h1>
</c:if>
