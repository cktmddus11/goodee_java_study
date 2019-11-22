<%@page import="org.jsoup.Jsoup"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "org.jsoup.nodes.Element" %>
<%@ page import ="java.io.IOException" %>
<%@ page import="org.jsoup.nodes.*" %>
<%@ page import="org.jsoup.select.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSoup 을 이용한 크롤링 예제</title>
<style>
table, td, th {border : 2px solid grey;}
</style>
</head>
<body>
<%
String url = "https://www.koreaexim.go.kr/site/program/financial/exchange?menuid=001001004002001";
String line = "";
Document doc = null;
try{
	doc = Jsoup.connect(url).get();  // url 을 html 로 파싱해서 dow(document : 문서노드의 최상위 객체?)형식으로 
	// e1 : url 이 제공하는 html 문서 중 태그가 table 태그만 저장
	Elements e1 = doc.select("table");
	for(Element ele : e1){
		// ele : table 태그 한개
		String temp = ele.html(); // ele.html() : table태그를 뺀 안쪽 html태그들 가져옴
		System.out.println("=========================");
		System.out.println(temp);
		line += temp;
	}
}catch(Exception e){
	e.printStackTrace();
}

%><table><%=line %></table>
</body>
</html>