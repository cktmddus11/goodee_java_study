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
<title>JSoup �� �̿��� ũ�Ѹ� ����</title>
<style type="text/css">
table, td, th {border : 2px solid grey;}
</style>
</head>
<body>
<!--  
          /(DOW)
         html
      head
            body
 -->
<%
String url = "https://www.koreaexim.go.kr/site/program/financial/exchange?menuid=001001004002001";
String line = "";
Document doc = null;
try{
	doc = Jsoup.connect(url).get();  // url �� html �� �Ľ��ؼ� dow(document : ��������� �ֻ��� ��ü?)�������� 
	// e1 : url �� �����ϴ� html ���� �� �±װ� table �±׸� ����
	Elements e1 = doc.select("table");
	for(Element ele : e1){
		// ele : table �±� �Ѱ�
		Elements e2 = ele.select("tr");
		for(Element ele2 : e2){
			String temp = ele2.html(); // ele.html() : table�±׸� �� ���� html�±׵� ������
			System.out.println("=========================");
			System.out.println(temp);
			line += "<tr>"+temp+"</tr>";
		}
	}
}catch(Exception e){
	e.printStackTrace();
}

%><table><%=line %></table>
</body>
</html>