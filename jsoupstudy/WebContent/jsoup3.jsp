<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.jsoup.Jsoup"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "org.jsoup.nodes.Element" %>
<%@ page import ="java.io.IOException" %>
<%@ page import="org.jsoup.nodes.*" %>
<%@ page import="org.jsoup.select.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSoup 을 이용한 크롤링 예제- class 속성으로 조회하기</title>
<style type="text/css">
table, td, th {border : 2px solid grey;}
</style>
<script type="text/javascript" 
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
<body>
<%
String url = "https://www.koreaexim.go.kr/site/program/financial/exchange?menuid=001001004002001";
String line = "";
Document doc = null;
List<String> list = new ArrayList<String>();
try{
	doc = Jsoup.connect(url).get();  // url 을 html 로 파싱해서 dow(document : 문서노드의 최상위 객체?)형식으로 
	// e1 : url 이 제공하는 html 문서 중 태그가 table 태그만 저장
	Elements e1 = doc.select(".tc");
	for(Element ele : e1){
		list.add(ele.html()); // 클래스가 tc인 태그 내용들만 가져와서 리스트에 넣
	}
}catch(Exception e){
	e.printStackTrace();
}
pageContext.setAttribute("list", list);
%><table>
<c:forEach items = "${list }" var = "v" varStatus = "stat">
	<c:choose>
		<c:when test="${stat.index % 7 == 0 }"><%-- 통화코드 --%>
			<tr><td rowspan="6">${v}</td>
		</c:when>
		<c:when test="${stat.index % 7 == 1 }">
			<td> ${v}</td></tr>
		</c:when>
		<c:otherwise>
			<tr><td>${v}</td></tr>
		</c:otherwise>
	</c:choose>
</c:forEach>
</table>
</body>
</html>