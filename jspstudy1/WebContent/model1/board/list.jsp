<%@page import="java.util.List"%>
<%@page import="model1.BoardDao"%>
<%@page import="model1.Board"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
	1. 한 페이지당 10 건의 게시물을 출력하기.
	pageNum 파라미터값을 저장 => 없는 경우는 1로 설정.
	2. 최근 등록된 게시물을 가장 위에 배치함. 
	3. 화면에 출력. 
		- 게시물 출력 부분
		- 페이지 구분 출력 부분
	
 --%>  
<%
int pageNum = 1; // 파라미터가 없으면 1로 
try{
	pageNum = Integer.parseInt(request.getParameter("pageNum")); 
}catch(NumberFormatException e){ } 

int limit = 10; // 한페이지에 출력할 게시물 건수 

BoardDao dao = new BoardDao(); 

int boardcount = dao.boardCount(); // 등록된 전체 게시물의 건수
// 화면에 출력된 게시물 데이터
List<Board>list = dao.list(pageNum, limit);
/* 
maxpage : 총 페이지 갯수
	ex) 20 -> 2페이지
          501 -> 51페이지
  -  전체 게시물 건수 : 21건 => 3페이지
    21.0 / 10 + 0.95 => (int)(3.05) => 3
  -  전체 게시물 건수 : 20건 => 2페이지
      20.0 / 10 + 0.95 => (int)(2.95) => 2
   -  전체 게시물 건수 : 101건 => 11페이지
	   101 / 10 + 0.95 => (int)(11.05) => 11
*/
int maxpage = (int)((double) boardcount / limit + 0.95); 
/*
	startpage : 화면에 표시될 첫번째 페이지
	- pageNum : 2 => 1
			(2 / 10.0 + 0.9) => ((int)(1.1 -1) * 10 ) + 1 => 1
	- pageNum : 10 => 1
			(10 / 10.0 + 0.9) => ((int)(1.9 -1) * 10 ) + 1 => 10
	- pageNum : 11 => 11
			(11 / 10.0 + 0.9) => ((int)(2.0 -1) * 10 ) + 1 => 11				
1 ~ 10, 11 ~ 20, 21 ~ 30, ,31 ~ 40 
*/
int startpage = ((int) (pageNum / 10.0 + 0.9) -1) * 10 + 1; // 시작페이지
// endpage : 화면에 표시될 마지막 페이지
int endpage = startpage + 9; // 종료 페이지 번호
if(endpage > maxpage){
	endpage = maxpage;
}
int boardnum = boardcount - (pageNum -1) * limit; // 30 - (2 -1) * 10; 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시글 목록 보기</title>
<link rel = "stylesheet" href="../css/main.css">

</head>
<body>
	<table>
		<caption>게시판 목록</caption>
		<%if(boardcount ==0){ %>
			<tr>
				<td colspan="5">등록된 게시글이 없습니다.</td>
			</tr>
		<%} else{ // 등록된 게시물존재 %>
			<tr>
				<td colspan="5" style="text-align : right"> 글 개수 : <%=boardcount %> </td>
			</tr>
			<tr>
				<th width="8%">번호</th>
				<th width="50%">제목</th>
				<th width="14%">작성자</th>
				<th width="17%">등록일</th>
				<th width="11%">조회수</th>			
			</tr>
			<% for(Board b : list){%>
				<tr>
				<%-- 	<td><%=b.getNum() %></td> --%>
					<td><%=boardnum--%></td>
					<td style="text-align : left">
					<%if(b.getFile1() != null && !b.getFile1().trim().equals("")){ %>
						<a href="file/<%=b.getFile1()%>"style="text-decoration: none;">@</a>
					<%}else{ %>	
						&nbsp;&nbsp;&nbsp;
					<%} %>
					<% if(b.getGrplevel() >0){ %>
						<% for(int i = 1;i<b.getGrplevel();i++){ %>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<%} %>└
					<%} %> 
						<a href="info.jsp?num=<%=b.getNum() %>"><%=b.getSubject() %></a></td>
					<td><%=b.getName() %></td>
					<td><%=b.getRegdate() %></td>
					<td><%=b.getReadcnt() %></td>
				</tr>
			<%} // for구문 종료%>
				<tr>
					<td colspan="5">
						<!-- 이전 -->
						<%if (pageNum <= 1){ %> <!-- 처음 페이지면 이전 없음 -->
							[이전]
						<%}else{ %>
							<a href="list.jsp?pageNum = <%=pageNum-1 %>">[이전]</a>
						<%} %>
						<!-- 번호-->
						<% for(int a = startpage; a <= endpage; a++){ %>
								<% if(a == pageNum) { %> <!--  내가 보고있는 페이지는 링크 x -->
									[<%=a %>] 
								<% } else { %> 
									<a href="list.jsp?pageNum=<%=a %>">[<%=a %>]</a>
								<%} %>
						<%} %>
						<!-- 다음 -->
						<% if(pageNum >= maxpage){ %>  <!-- 마지막 페이지면 다음 없음 -->
							[다음]
						<%}else{ %>
							<a href="list.jsp?pageNum=<%=pageNum + 1 %>">[다음]</a>
						<%} %>
					</td>
				</tr> 
		<%} // else  구문 종료 %>
		<tr><td colspan="5" style="text-align : right">
			<a href="writeForm.jsp">[글쓰기]</a></td>
		</tr>
	</table>


</body>
</html>