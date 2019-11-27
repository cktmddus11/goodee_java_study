<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
    <%--
    	1. �α��� �Ŀ� �������� ������
    	 	-> �α��� �ȵ� ��� => loginForm.jsp ������ �̵�
     --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������</title>
<script type="text/javascript" src = "http://www.chartjs.org/dist/2.9.3/Chart.min.js"></script>
<script src="https://www.chartjs.org/samples/latest/utils.js"></script>
<script>
	$.ajax({
		url : "${path}/model2/ajax/chart4.html",
		type : "POST", 
		success : function(data){
			$("#chart1").append(data);
		},
		error : function(e){
			alert("�������� : "+e.status);
		}
	}) 
</script>
<!-- <script src="../ajax/chart3.js"></script> -->


<style>
canvas { 
	-moz-user-select : none;
	-webkit-user-select : none;
	-ms-user-select : nane;
}
</style>

</head>
<body>
	<h3>${sessionScope.login}�� �α��� �Ǿ����ϴ�. </h3>
	<h3><a href="logout.me">�α׾ƿ�</a></h3>
	<h3><a href="info.me?id=${sessionScope.login}">ȸ������ ����</a></h3>
	<c:if test="${sessionScope.login == 'admin'}">
		<a href="list.me">ȸ����� ����</a>
	</c:if>
	<br>
	<div class="w3-twothird w3-container" id="chart1">
				<canvas  id = "linecanvas"></canvas>
				<canvas  id = "barcanvas"></canvas>
			</div>
			
	
	
</body>
</html>