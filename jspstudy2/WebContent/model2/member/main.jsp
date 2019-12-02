<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%--
    	1. 로그인 후에 보여지는 페이지
    	 	-> 로그인 안된 경우 => loginForm.jsp 페이지 이동
     --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원관리</title>
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
			alert("서버오류 : "+e.status);
		}
	}) 
</script> -->
<script>
$(document).ready(function(){
	exchangeRate(); 
	graphs(); // 그래프를 위한 데이터를 ajax으로 가져오기
})
function exchangeRate(){
		$.ajax("${path}/model2/ajax/exchange2.do", {
			success : function(data){
				$("#exchange").html(data);
			},
			error : function(e){
				alert("서버 오류 : "+e.status);
			}
		})
	}
		var randomColorFactor = function(){
			return Math.round(Math.random() * 255); // 0 ~ 255랜덤값
		}
		var randomColor = function(opacity){ // opacity 투명도
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
			alert('서버오류 :'+e.status);	
		}
	})
}
function pieGraphprint(data){
	// [{"name":"차승연", "cnt":10}, {"name":"차승연", "cnt":10}]
	// data : 서버에서 전달한 JSON 형태 데이터
	var rows = JSON.parse(data);
	var names = [];
	var datas = [];
	var colors = [];
	$.each(rows, function(index, item){
		names[index] = item.name; // 차승연
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
				text : "글쓴이 별 게시판 등록건수"
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
	<h3>${sessionScope.login}로로그인되었습니다.</h3>
	<h3>
		<a href="logout.me">로그아웃</a>
	</h3>
	<h3>
		<a href="info.me?id=${sessionScope.login}">회원정보 보기</a>
	</h3>
	<c:if test="${sessionScope.login == 'admin'}">
		<a href="list.me">회원목록 보기</a>
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