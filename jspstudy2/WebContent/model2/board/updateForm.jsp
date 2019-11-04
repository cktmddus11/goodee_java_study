<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%--
 1. num 값의 게시물을 db에서 조회하여 화면 출력하기 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel = "stylesheet" href="../../css/main.css">
<script>
function file_delete(){
	document.f.file2.value=""; // hidden에있는거 지움
	file_desc.style.display ="none"; // id가 저거인를 화면에서 지움
}
</script>
<title>수정</title>
</head>
<body>
	<form action="update.do" name = "f" method="post" 
	enctype="multipart/form-data">
			<input type="hidden" name="num" value="${b.num}">
			<input type="hidden" name="file2" 
			value="${empty b.file1?'':b.file1}">
			<table>
				<caption>게시판 수정 화면</caption>
				<tr>
					<td>글쓴이</td>
					<td><input type="text" name="name" value="${b.name}"/></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pass"/></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="subject" value="${b.subject}"/></td>
				</tr>	
				<tr>
					<td>내용</td>
					<td><textarea row="15" name="content">${b.content}</textarea></td>
				</tr>	
				<tr>
					<td>첨부파일</td>
					<td style="text-align : left">
					<c:if test="${!empty b.file1}">
					<div id="file_desc">${b.file1}
					<a href="javascript:file_delete()">[첨부파일 삭제]</a>
					</div>
					</c:if>
					<input type="file" name="file1"></td>
				</tr>	
				<tr>
					<td colspan="2">
					<a href="javascript:document:f.submit()">[게시물수정]</a>
				</tr>
			</table>
	
	</form>
</body>
</html>