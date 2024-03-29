<%@page import="model1.Board"%>
<%@page import="model1.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
1. 원글의 num을 파라미터로 받는다.
2. 원글의 num, grp, grplevel, grpstep 정보를 저장
3. 입력화면 표시

--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시글 답글 쓰기</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
	<form action="reply.do" method="post" name="f">
	<!-- 게시판 원글의 정보 -->
		<input type="hidden" name="num" value="${b.num}">
		<input type="hidden" name="grp" value="${b.grp}">
		<input type="hidden" name="grplevel" value="${b.grplevel}"> <!--  누구의 답글인지? -->
		<input type="hidden" name="grpstep" value="${b.grpstep}"> <!--  원글 순서? -->
		<table>
			<caption>게시판 답글 등록</caption>
			<tr>
				<th>글쓴이</th>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject" 
				value="RE:${b.subject}"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" rows="15"></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
				<a href="javascript:document.f.submit()">[답변글 등록]</a></td>
			</tr>
		</table>
	</form>
</body>
</html>