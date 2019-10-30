<%@page import="java.util.Date"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
      <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>jstl core 태그 : 반복문</title>
</head>
<body>
	<h3>반복 관련 태그</h3>
	<c:forEach var="test" begin="1" end="10">
		${test} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</c:forEach>
	
	<h3>forEach 태그를 이용하여 1부터 100 까지의 합 구하기</h3>
	<c:forEach var="i" begin="1" end="100"><!--  jstl 서버의 언어 client에서 보이지 않음 -->
		<c:set var="sum" value="${sum+i}"/>
	</c:forEach>
	1부터 100까지의 합 : ${sum}<br>
	
	<c:set var="sum" value="${0}"/>
	
	<h3>forEach 태그를 이용하여 1부터 100 까지의 짝수의합 구하기</h3>
	<c:forEach var="i" begin="1" end="100"><!--  jstl 서버의 언어 client에서 보이지 않음 -->
		<c:if test="${i % 2 == 0 }">
		<c:set var="sum" value="${sum+i}"/>
		</c:if>
	</c:forEach>
	1부터 100까지의 짝수합 : ${sum}<br>
	
	<c:set var="sum" value="${0}"/>
	
	<h3>forEach 태그를 이용하여 1부터 100 까지의 짝수의합 구하기</h3>
	<c:forEach var="i" begin="1" end="100"><!--  jstl 서버의 언어 client에서 보이지 않음 -->
		<c:if test="${i % 2 != 0 }"> <!--  step = "2" 하면 2개씩 증가 -->
		<c:set var="sum" value="${sum+i}"/>
		</c:if>
	</c:forEach>
	1부터 100까지의 홀수합 : ${sum}<br>
	
	<h3>forEach태그를 이용하여 2 ~ 9 단 구구단 출력하기 </h3>
	<c:forEach var="i" begin="2" end="9"> <!--  첨자 사용 -->
		<h4>${i }단</h4>
		<c:forEach var="j" begin="2" end="9"><br>
			${i } * ${j } = ${i * j }
		</c:forEach>
		<br>
	</c:forEach>
	
	<br>
	
	<h3>forEach 태그를 이용하여 list 객체 출력하기</h3>
	<%
	List<Integer> list = new ArrayList<Integer>();
	for(int i = 1;i<=10;i++){
		list.add(i * 10);
	}
	pageContext.setAttribute("list", list);
	%><!--  속성으로 사용하기 위해서 속성으로 list를 등록함 -->
	<!--                                   속성명 "list" -> ${list} 
	                    i 는 첨자가 아니라 요소값을 말함 -->
	<c:forEach var="i" items="${list }">  <!-- list의 item 한개씩 꺼내서 사용 -->
		${i }&nbsp;&nbsp;&nbsp;
	</c:forEach>
	
	<br><br>
	<!--                                                   첨자 : varStatus -->
	<c:forEach var="i" items="${list }" varStatus="stat">  
		<c:if test="${stat.index==0 }"> <!--  index는 0부터  -->
			<h4>forEach 태그의 varStatus 속성 연습</h4>
		</c:if> <!--  count는 1부터  -->
		${stat.count } : ${i }<br>
	</c:forEach>
	
	
	<br><br>
	
	<h3>forEach 태그를 이용하여 Map객체 출력하기</h3>
	<%
	Map<String, Object> map = new HashMap<String, Object>();
	map.put("name", "홍길등");
	map.put("today", new Date());
	map.put("age", 20);
	pageContext.setAttribute("maps", map); 
	//                                 속성명-이걸로사용 변수명 
	%>
	<!--   m  : key, value 쌍을 가져옴 -->
	<c:forEach var="m" items="${maps}" varStatus="stat">
		${stat.count } : ${m.key } = ${m.value }<br>
	</c:forEach>
	<h3>EL을 이용하여 Map 객체를 출력하기</h3>
	name = ${maps.name }<br> <!-- EL 객체를 직접 접근  -->
	today = ${maps.today } <!-- items = "${map}"은 속성명이다?!!! --><br>
	age = ${maps.age }<br>
	<!--  EL은 변수를 사용할 수 없음 속성명임 !! -->
	
	<br>
	<h3>forEach 태그를 이용하여 배열 객체 출력</h3>
	<!--  set으로 표현식으로도 설정가능 -->
	<c:set var="arr" value="<%=new int[]{10, 20, 30, 40, 50} %>" />
	<c:forEach var="a" items="${arr }" varStatus="stat">
		arr[${stat.index}] = ${a }<br>
	</c:forEach>
	${arr[0] }<br> <!--  EL 로 배열 값 접근 -->
	${list[2] }<br><!--  list도 배열처럼 사용가능  -->
	
	<h4>배열 객체의 두번째 요소 부터 세번째 요소까지 출력하기</h4>
	<c:forEach var="a" items="${arr }" varStatus="stat" begin="1" end="2">
		arr[${stat.index}] = ${a}<br>
	</c:forEach>
	
		<h4>배열 객체의 짝수 인덱스만 출력하기</h4>
	<c:forEach var="a" items="${arr }" varStatus="stat" step="2">
		arr[${stat.index}] = ${a}<br>
	</c:forEach>
	
		
		<h4>배열 객체의 홀수 인덱스만 출력하기</h4>
	<c:forEach var="a" items="${arr }" varStatus="stat" begin="1" step="2">
		arr[${stat.index}] = ${a}<br>
	</c:forEach>
	
	
</body>
</html>