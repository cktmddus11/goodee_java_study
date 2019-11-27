<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!--  실제 실행되고있는 프로젝트 이름을 가져욤. 절대경로로 사용하려고 -->
<!DOCTYPE html>
<html lang="en">
<title><decorator:title /></title>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" 
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){ // 문서가 로드되자 마자
		exchangeRate(); // 함수 호출
		setInterval(exchangeRate, 1000 * 60);
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
</script>
<style>
html, body, h1, h2, h3, h4, h5, h6 {
	font-family: "Roboto", sans-serif;
}

.w3-sidebar {
	z-index: 3;
	width: 250px;
	top: 30px;
	bottom: 0;
	height: inherit;
}
</style>
<decorator:head />
<body>

	<!-- Navbar -->
	<div class="w3-top">
		<div class="w3-bar w3-theme w3-top w3-right-align w3-large">
			<c:if test="${sessionScope.login != null }">
			${sessionScope.login}님이 로그인 하셨습니다
			 <a href="${path}/model2/member/logout.me">로그아웃</a>
			</c:if>
			<c:if test="${sessionScope.login == null }">
				<a href="${path}/model2/member/loginForm.me">로그인</a>
			 	 &nbsp; <a href="${path}/model2/member/joinForm.me">회원가입</a>
			</c:if>
		</div>
	</div>

	<!-- Sidebar -->
	<nav
		class="w3-sidebar w3-bar-block w3-collapse w3-large w3-theme-l5 w3-animate-left"
		id="mySidebar">
		<a href="javascript:void(0)" onclick="w3_close()"
			class="w3-right w3-xlarge w3-padding-large w3-hover-black w3-hide-large"
			title="Close Menu"> <i class="fa fa-remove"></i>
		</a>
		<h4 class="w3-bar-item">
			<b>Menu</b>
		</h4>
		<a class="w3-bar-item w3-button w3-hover-black" href="${path}/model2/member/main.me">회원관리</a>
		 <a class="w3-bar-item w3-button w3-hover-black" href="${path}/model2/board/list.do">게시판</a>
		
		
		<br>
		<br>
		<div class="w3-container">
			<div class="w3-clear"></div>
			<div id = "exchange"></div>
		</div>

	</nav>

	<!-- Overlay effect when opening sidebar on small screens -->
	<div class="w3-overlay w3-hide-large" onclick="w3_close()"
		style="cursor: pointer" title="close side menu" id="myOverlay"></div>

	<!-- Main content: shift it to the right by 250 pixels when the sidebar is visible -->
	<div class="w3-main" style="margin-left: 250px">

		<div class="w3-row w3-padding-64">
			<div class="w3-twothird w3-container">
				 <decorator:body />
			</div>
			<br> <!--  차트 출력 영역 -->
			
			
			<div class="w3-third w3-container">
				<p class="w3-border w3-padding-large w3-padding-32 w3-center">
				<img src="http://img.hani.co.kr/imgdb/resize/2018/0313/00500561_20180313.JPG" style="height: 50%;width: 50%;" ></p>
				<p class="w3-border w3-padding-large w3-padding-32 w3-center">
				<img src="http://img.hani.co.kr/imgdb/resize/2018/0313/00500561_20180313.JPG"style="height: 50%;width: 50%;"></p>
			</div>
		</div>

		
		<footer id="myFooter">
			<div class="w3-container w3-theme-l2 w3-padding-32">
				<h4>구디아카데미 Since 2016</h4>
			</div>

			<div class="w3-container w3-theme-l1">
				<p>
					Powered by <a href="https://github.com/cktmddus11/goodee"
						target="https://github.com/cktmddus11">차승연</a>
				</p>
			</div>
		</footer>

		<!-- END MAIN -->
	</div>

	<script>
		// Get the Sidebar
		var mySidebar = document.getElementById("mySidebar");

		// Get the DIV with overlay effect
		var overlayBg = document.getElementById("myOverlay");

		// Toggle between showing and hiding the sidebar, and add overlay effect
		function w3_open() {
			if (mySidebar.style.display === 'block') {
				mySidebar.style.display = 'none';
				overlayBg.style.display = "none";
			} else {
				mySidebar.style.display = 'block';
				overlayBg.style.display = "block";
			}
		}

		// Close the sidebar with the close button
		function w3_close() {
			mySidebar.style.display = "none";
			overlayBg.style.display = "none";
		}
	</script>

</body>
</html>
