<%@page import="model1.Member"%>
<%@page import="model1.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!--  admin은 모두 수정가능 사용자는 자기 내용만 수정
    로그인 상태 확인 
    
    1. id 파리미터 조회
    2. login 정보 조회
    	로그인이 안된경우 "로그인하세요" 메시지 출력 loginForm.jsp페이지 이동
    3. 로그인 된경우 : 로그인이 admin이 아니면서 다른사람의 정보를 조회하면
    							"내 정보 수정만 가능합니다. main.jsp" 페이지 이동
    4. 내정보이거나 admin인 경우 -> id의 정보를 db에서 읽어서 Member 객체에 저장
    5. Member 객체를 화면에 출력
    
    -->

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>수정 </title>
<link rel="stylesheet" href="../../css/main.css">
<script>
function win_upload(){
	var op = "width=500, height=150, left=50, top=150";
	open("pictureForm.me", "", op);
}
function inputcheck(f){
	<c:if test ="${sessionScope.login !='admin'}">
	if(f.pass.value == ""){
		alert("비밀번호를 입력하세요.");
		f.pass.focus();
		return false;
	}
	</c:if>
}

function win_updatepw(){
	var op = "width=500, height=230, left=50, top=150";
	nw = open("passwordForm.me", "pw", op);
	<%-- nw.onload = function(){ // session으로 id하면 이거 할필요없음 
			nw.document.f.id2.value = "<%=dao.getId() %>"; 
	} --%>
}
</script>
</head>
<body>
	
	<form action="update.me" name="f" method="post" 
	onsubmit="return inputcheck(this)">
		<input type="hidden" name="picture" value="${info.picture}"> <!-- 사진업로드에서 hidden값 넘겨주니까 알아서 사진바뀐걸로 경로 수정도미 -->	
		<table>
			<caption>회원 정보 수정</caption>
			<tr>
				<td rowspan="4" valign="bottom">
				<img src="picture/${info.picture}" width="100" height="120" id="pic"><br>
				<font size="1"><a href="javascript:win_upload()">사진 수정</a></font></td>
				<th>아이디</th>
				
				<td><input type="text" name="id" value="${info.id}" readonly></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pass"></td>	
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" value="${info.name}"></td>	
			</tr>
			<tr>
				<th>성별</th>
				<td><input type="radio" name="gender" value="1" ${info.gender==1?"checked":"" }>남
				<input type="radio" name="gender" value="2"  ${info.gender==2?"checked":""}>여</td>	
			</tr>
			<tr>
				<th>전화번호</th>
				<td colspan="2"><input type="text" name="tel" value="${info.tel}"></td>	
			</tr>
			<tr>
				<th>이메일</th>
				<td colspan="2"><input type="text" name="email" value="${info.email}" ></td>	
			</tr>
			<tr>
				<td colspan="3"><input type="submit" value="회원수정">
				<c:if test="${info.id != 'admin'}">
					<input type="button" value="비밀번호 변경"  onclick="javascript:win_updatepw()"/>
					</c:if>
				</td>	
			</tr>
			
		</table>
	</form>
</body>
</html>
