<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>방명록 내용 보기</title>
</head>
<body>
	<%-- String writer = request.getParameter("writer")  --%>
	
	<% request.setCharacterEncoding("euc-kr");%>
	<jsp:useBean id="book" class="chap7.Book"/> <!-- scope="page" 생략되어있음 --> 
	<%-- 		1. Book book = new Book(); 객체 생성 
	 			2. pageContext.setAttribute("book", book);
	 			scope가 request이면 request.setAttribute("book", book)
	 --%>
	<jsp:setProperty property="*" name="book" />
	<%-- book.setWriter(request.getParameter("name")) --%> 
	<jsp:setProperty property="writer" name="book" param="name" />	 
	<%--
			book.setWriter(request.getParameter("write"));
			book.setTitle(request.getParameter("title"));
			....
			
			프로퍼티****
				set프로퍼티
				setXxx() => xxx 소문자 
			
	 --%>
	
	<table border="1" style="border-collapse:collapse;">
		<caption>방명록 조회 </caption>
		<tr>	
			<td>작성자</td>
			<%-- book.getWriter() 메서드 호출 --%>
			<td><jsp:getProperty name="book" property="writer" /> </td>
			<%-- <td><%=book.getWriter() %> --%>
		</tr>
		<tr>
			<td>제목</td>
			<%-- book.getTitle() 메서드 호출 --%>
			<td><jsp:getProperty name="book" property="title" /> </td>
		<%-- 	<td><%=book.getTitle() %> --%>
		</tr>
		<tr>
			<td>내용</td>
			<%-- book.getContent() 메서드 호출 --%>
			<td><jsp:getProperty name="book" property="content" /> </td>
		<%-- 	<td><%=book.getContent() %> --%>
	</table>
	
</body>
</html>