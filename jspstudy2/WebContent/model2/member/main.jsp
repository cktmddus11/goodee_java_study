<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript"
	src="http://www.chartjs.org/dist/2.9.3/Chart.min.js"></script>
<script src="https://www.chartjs.org/samples/latest/utils.js"></script>
<!-- <script>
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
</script> -->
<script>
$(document).ready(function(){
	exchangeRate(); 
	graphs(); // �׷����� ���� �����͸� ajax���� ��������
})
function exchangeRate(){
		$.ajax("${path}/model2/ajax/exchange2.do", {
			success : function(data){
				$("#exchange").html(data);
			},
			error : function(e){
				alert("���� ���� : "+e.status);
			}
		})
	}
		var randomColorFactor = function(){
			return Math.round(Math.random() * 255); // 0 ~ 255������
		}
		var randomColor = function(opacity){ // opacity ����
			return "rgba("+randomColorFactor() + ","
					+ randomColorFactor() + ","
					+ randomColorFactor() + ","
					+(opacity || '.3')+")";
		};
		
function graphs(){
	$.ajax("${path}/model2/ajax/graph2.do", {
		success : function(data){
			pieGraphprint(data);
			barGraphprint(data);
		}, error : function(e){
			alert('�������� :'+e.status);	
		}
	})
}
function pieGraphprint(data){
	// [{"name":"���¿�", "cnt":10}, {"name":"���¿�", "cnt":10}]
	// data : �������� ������ JSON ���� ������
	var rows = JSON.parse(data);
	var names = [];
	var datas = [];
	var colors = [];
	$.each(rows, function(index, item){
		names[index] = item.name; // ���¿�
		datas[index] = item.cnt; // cnt 10 
		colors[index] = randomColor(1);
	})
	var config = {
		type : 'pie', 
		data : {
			datasets : [{
				data : datas, // cnt 
				backgroundColor : colors,
			}],
			labels : names //name
		}, options : {
			responsive : true,
			legend : {position : 'top', },
			title  : {
				display : true,
				text : "�۾��� �� �Խ��� ��ϰǼ�"
			}
		}
	};
	var ctx = document.getElementById("ajaxchart").getContext("2d")
	new Chart(ctx, config);
}
</script>
<script src="../ajax/chart3.js"></script>


<style>
canvas {
	-moz-user-select: none;
	-webkit-user-select: none;
	-ms-user-select: nane;
}
</style>

</head>
<body>
	<h3>${sessionScope.login}�ηα��εǾ����ϴ�.</h3>
	<h3>
		<a href="logout.me">�α׾ƿ�</a>
	</h3>
	<h3>
		<a href="info.me?id=${sessionScope.login}">ȸ������ ����</a>
	</h3>
	<c:if test="${sessionScope.login == 'admin'}">
		<a href="list.me">ȸ����� ����</a>
	</c:if>
	<br>
	<div>
		<div class="w3-twothird w3-container" id="chart1" style="width: 50%">
			<canvas id="linecanvas"></canvas>
		</div>

		<div class="w3-twothird w3-container" id="chart2" style="width: 50%">
			<canvas id="piecanvas"></canvas>
		</div>

		<div class="w3-twothird w3-container" id="chart3">
			<canvas id="ajaxchart"></canvas>
		</div>



	</div>
</body>
</html>