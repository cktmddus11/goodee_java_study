<%@page import="model1.Board"%>
<%@page import="model1.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
1. num 파라미터 정보를 변수에 저장. 
2. num을 이용하여 db에서 게시물 정보를 조회
	Board b = new BoardDao.selectOne(num)
3. 조회수 증가시키키
	void BoardDao.readcntadd(num)
4. 2번에서 조회된 게시물 화면에 출력

 --%>
 <%
int num = Integer.parseInt(request.getParameter("num"));
BoardDao d = new BoardDao();
// 상세페이지에 조회수할꺼면 함수호출 순서바꾸기
Board dao = d.selectOne(num); // num에 해당하는 게시물 조회
System.out.println(dao);
d.readcntadd(num); // num에 해당하는 게시물의 조회건수 1증가

 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시물 상세 보기</title>
<link rel = "stylesheet" href="../css/main.css">
</head>
<body>
	<table>
		<caption>게시물 상세보기</caption>
		<tr>
			<th width="20%">글쓴이</th>
			<td width="80%" style="text-align:left"><input type="text" value="<%=dao.getName() %>"></td>
		</tr>
		<tr>	
			<th>제목</th>
			<td style="text-align : left"><input type="text" value="<%=dao.getSubject() %>"></td>
		</tr>
		<tr>	
			<th>내용</th>
			<td><table style="width:100%; height:250px;">
               <td style="border-width:0px; vertical-align:top; text-align:left">
               <%=dao.getContent() %>
           	</td>     
     		</table>
     		</td>
     	</tr>
	<table>
	<tr>
		<th> 첨부파일</th>
		<td>
		<% if(dao.getFile1() == null || dao.getFile1().trim().equals("")) {%>
			&nbsp;
		<%}else{ %>
			<a href="file/<%=dao.getFile1() %>"><%=dao.getFile1() %></a>
		<%} %>
		</td>
	</tr>
	<tr>	
		<td colspan="2">
		<a href = "replyForm.jsp?num=<%=num %>">[답변]</a>
		<a href = "updateForm.jsp?num=<%=num %>">[수정]</a>
		<a href = "deleteForm.jsp?num=<%=num %>">[삭제]</a>
		<a href = "list.jsp">[목록]</a>
	</tr>
	</table>
</body>
</html>