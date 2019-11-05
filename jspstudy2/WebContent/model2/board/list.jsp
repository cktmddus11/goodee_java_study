<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%--

	3. 화면에 출력. 
		- 게시물 출력 부분
		- 페이지 구분 출력 부분
	
 --%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시글 목록 보기</title>
<link rel = "stylesheet" href="../../css/main.css">
<script>
	function listdo(page){
		document.sf.pageNum.value = page;
		document.sf.submit(); //페이지 눌러도 검색창 파라미터 유지
	}
</script>
</head>
<body>
<form action="list.do" method="post" name="sf">
	<input type="hidden" name="pageNum" value="1">
	<table>
		<tr>
			<td style="border-width : 0px;">
			<select name="column">
				<option value="">선택하세요</option>
				<option value="subject">제목</option>
				<option value="name">작성자</option>
				<option value="content">내용</option>
				<option value="subject,content">제목 + 내용</option>
				<option value="name,content">작성자 + 내용</option>				
			</select> 
			<script type="text/javascript">document.sf.column.value = "${param.column}";</script>
			<input type="text" name="find" value="${param.find}" style="width:50%;">
			<input type="submit" value="검색"></td>
		</tr>
	</table>
</form>


	<table>
		<caption>게시판 목록</caption>
		<c:if test="${boardcnt == 0 }">
			<tr>
				<td colspan="5">등록된 게시글이 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${boardcnt > 0 }">
			<tr>
				<td colspan="5" style="text-align : right"> 글 개수 : ${boardcnt} </td>
			</tr>
			<tr>
				<th width="8%">번호</th>
				<th width="50%">제목</th>
				<th width="14%">작성자</th>
				<th width="17%">등록일</th>
				<th width="11%">조회수</th>			
			</tr>
			<c:forEach var="b" items="${list}">
				<tr>
				<%-- 	<td><%=b.getNum() %></td> --%>
					<td>${boardnum}</td>
					<c:set var="boardnum" value="${boardnum - 1}" />
					<td style="text-align : left">
					<!--  첨부파일 표시 -->
					<c:if test="${!empty b.file1}">
						<a href="file/${b.file1}" style="text-decoration: none;">@</a>
					</c:if>
					<c:if test="${empty b.file1}">
						&nbsp;&nbsp;&nbsp;
					</c:if>
					<!--  답글 표시하기 -->
					<c:if test="${b.grplevel > 0}">
						<c:forEach begin="1" end="${b.grplevel}">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</c:forEach>└
					</c:if>                            <!--  EL에 쓰는거 property가져옴 (get 안쓴다는거) -->
					<a href="info.do?num=${b.num}">${b.subject}</a></td>
					<td>${b.name}</td>
					
					<c:set var="today" value="<%=new java.util.Date() %>"></c:set>
					<fmt:formatDate value = "${today}" pattern="yy-MM-dd"  var="today2"/>
					<fmt:formatDate value ="${b.regdate}" pattern="yy-MM-dd"  var="regdate"/>
					<td>
					<c:if test="${today2 == regdate}">
					  <fmt:formatDate value = "${b.regdate}" pattern="HH:mm:ss"  var="r"/>	
						 	${r}
					</c:if>			<!--  위아래 변수가 달라야지 아래 IF문 또 실행안되네 -->
					<c:if test="${today2 != regdate}">
						<fmt:formatDate value = "${b.regdate}" pattern="yy-MM-dd HH:mm"  var="regdate"/>
						${regdate}
					</c:if>
					</td>
					
					
					
					<td>${b.readcnt}</td>
				</tr>
			</c:forEach>
				<tr>
					<td colspan="5">
								<!-- 이전 -->
						<c:if test="${pageNum <= 1}">
							[이전]
						</c:if>
						<c:if test="${pageNum > 1}">
							<a href="javascript:listdo(${pageNum-1})">[이전]</a>
						</c:if>
						<!-- 번호-->
						<c:forEach begin="${startpage}" end="${endpage}" var="a">
								<c:if test="${a == pageNum }">
									[${a}] 
								</c:if>
								<c:if test="${a != pageNum }">
									<a href="javascript:listdo(${a})">[${a}]</a>
								</c:if>
						</c:forEach>
						<!-- 다음 -->
						<c:if test="${pageNum >= maxpage}">
							[다음]
						</c:if>
						<c:if test="${pageNum < maxpage}">
							<a href="javascript:listdo(${pageNum + 1})">[다음]</a>
						</c:if>
					</td>
				</tr> 
		</c:if>
		<tr><td colspan="5" style="text-align : right">
			<a href="writeForm.do">[글쓰기]</a></td>
		</tr>
	</table>


</body>
</html>