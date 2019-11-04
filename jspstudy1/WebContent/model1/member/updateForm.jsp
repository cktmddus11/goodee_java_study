<%@page import="model1.Member"%>
<%@page import="model1.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<%
String id = request.getParameter("id");
String login = (String) session.getAttribute("login");
	if(login != null){
		if(!login.equals("admin") && !id.equals(login)){
			%>
			<script>
				alert("내 정보만 수정이 가능합니다. ");
				location.href="main.jsp";
			</script>
			<% 
		}else{
			Member dao = new MemberDao().selectOne(id);
			//System.out.println(dao);
		%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>수정 </title>
<link rel="stylesheet" href="../css/main.css">
<script>
function win_upload(){
	var op = "width=500, height=150, left=50, top=150";
	open("pictureForm.jsp", "", op);
}
function inputcheck(f){
	<% if(!login.equals("admin")){ %>
	if(f.pass.value == ""){
		alert("비밀번호를 입력하세요.");
		f.pass.focus();
		return false;
	}
	<%}%>
}

function win_updatepw(){
	var op = "width=500, height=230, left=50, top=150";
	nw = open("passwordForm.jsp", "pw", op);
	<%-- nw.onload = function(){ // session으로 id하면 이거 할필요없음 
			nw.document.f.id2.value = "<%=dao.getId() %>"; 
	} --%>
}
</script>
</head>
<body>
	
	<form action="update.jsp" name="f" method="post" 
	onsubmit="return inputcheck(this)">
		<input type="hidden" name="picture" value="<%=dao.getPicture() %>"> <!-- 사진업로드에서 hidden값 넘겨주니까 알아서 사진바뀐걸로 경로 수정도미 -->	
		<table>
			<caption>회원 정보 수정</caption>
			<tr>
				<td rowspan="4" valign="bottom">
				<img src="picture/<%=dao.getPicture() %>" width="100" height="120" id="pic"><br>
				<font size="1"><a href="javascript:win_upload()">사진 수정</a></font></td>
				<th>아이디</th>
				
				<td><input type="text" name="id" value="<%=dao.getId() %>" readonly></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pass"></td>	
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" value="<%=dao.getName() %>"></td>	
			</tr>
			<tr>
				<th>성별</th>
				<td><input type="radio" name="gender" value="1" <%=dao.getGender()==1?"checked":"" %>>남
				<input type="radio" name="gender" value="2"  <%=dao.getGender()==2?"checked":"" %>>여</td>	
			</tr>
			<tr>
				<th>전화번호</th>
				<td colspan="2"><input type="text" name="tel" value="<%=dao.getTel() %>"></td>	
			</tr>
			<tr>
				<th>이메일</th>
				<td colspan="2"><input type="text" name="email" value="<%=dao.getEmail()%>" ></td>	
			</tr>
			<tr>
				<td colspan="3"><input type="submit" value="회원수정">
					<%if(!login.equals("admin")){ %>
					<input type="button" value="비밀번호 변경"  onclick="javascript:win_updatepw()"/>
					<%} %>
				</td>	
			</tr>
			
		</table>
	</form>
</body>
</html>
<% 
	}
		%>
			
		<% 
	}else{
		%>
		<script>
			alert("로그인하세요.")
			location.href="loginForm.jsp";
		</script>
		<% 
	}
%>    