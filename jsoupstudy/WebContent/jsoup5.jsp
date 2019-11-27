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
<title>JSoup 을 이용한 크롤링 예제- jsoup3.jsp 페이지에 통화국가명 추가하기</title>
<style type="text/css">
table, td, th {border : 2px solid grey;}
</style>
<script type="text/javascript" 
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
<body>
<%
String url = "http://www.hanwhaeagles.co.kr/html/players/player/hitter_view.asp?sGubunCd=PLPPIF&sMSId=P190";
String line = "";
Document doc = null;
List<String> list = new ArrayList<String>();

try{
	doc = Jsoup.connect(url).get();  // url 을 html 로 파싱해서 dow(document : 문서노드의 최상위 객체?)형식으로 
	// e1 : url 이 제공하는 html 문서 중 태그가 table 태그만 저장
	Elements e1 = doc.select("#container .img");
	for(Element ele : e1){
		
		out.print(ele.toString());
	}
/* 	for(Element ele : e1){
		Elements e2 = ele.select("tr");
		for(Element ele2 : e2){
			String temp = ele2.html(); // ele.html() : table태그를 뺀 안쪽 html태그들 가져옴
			System.out.println("=========================");
			System.out.println(temp);
			line += "<tr>"+temp+"</tr>";
		}
	}	
 */
}catch(Exception e){
	e.printStackTrace();
}


pageContext.setAttribute("list", list); 
%><table><%=line %></table>
</body>
</html>