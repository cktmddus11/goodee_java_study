<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%--
1. num 파라미터 정보를 변수에 저장. 
2. num을 이용하여 db에서 게시물 정보를 조회
	Board b = new BoardDao.selectOne(num)
3. 조회수 증가시키키
	void BoardDao.readcntadd(num)
4. 2번에서 조회된 게시물 화면에 출력

 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시물 상세 보기</title>
<link rel = "stylesheet" href="../../css/main.css">
</head>
<body>
	<table>
		<caption>게시물 상세보기</caption>
		<tr>
			<th width="20%">글쓴이</th>
			<td width="80%" style="text-align:left"><input type="text" value="${b.name}"></td>
		</tr>
		<tr>	
			<th>제목</th>
			<td style="text-align : left"><input type="text" value="${b.subject}"></td>
		</tr>
		<tr>	
			<th>내용</th>
			<td><table style="width:100%; height:250px;">
               <td style="border-width:0px; vertical-align:top; text-align:left">
              <%--  <c:out value="${b.content}"/> --%>
              ${b.content}
          	 	</td>     
     		</table>
     		</td>
     	</tr>
	<tr>
		<th> 첨부파일</th>
		<td>
		<c:if test="${empty b.file1}">
			&nbsp;
		</c:if>
		<c:if test="${!empty b.file1}">
			<a href="file/${b.file1}">${b.file1}</a>
		</c:if>
		</td>
	</tr>
	<tr>	
		<td colspan="2">
		<a href = "replyForm.do?num=${b.num}">[답변]</a>
		<a href = "updateForm.do?num=${b.num}">[수정]</a>
		<a href = "deleteForm.do?num=${b.num}">[삭제]</a>
		<a href = "list.do">[목록]</a>
	</tr>
	</table>
</body>
</html>