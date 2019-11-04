<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원탈퇴 비밀번호 입력 화면 </title>
<link rel = "stylesheet" href="../css/main.css">
</head>
<body>
	<form action="delete.jsp" method="post">
		<input type="hidden" name="id" value="<%=request.getParameter("id") %>">
		<table>
			<caption>회원 비밀번호 입력</caption>
			<tr>
				<th> 회원 비밀번호 입력</th>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="탈퇴하기"></td>
			</tr>
		</table>
	</form>
</body>
</html>
  <%-- 
  1. 로그아웃 상태 : 로그인하세요 메시지 출력, loginForm.jsp 페이지 이동
  2. 	로그인 상태 
  		- 관리자가 아니고, id와 login 이 다른 경우 
  				"본인만 탈퇴가 가능합니다." 메시지 출력. main.jsp 페이지로 이동 
  		- id가 관리자인 경우는 
  				"관리자는 탈퇴가 불가능합니다." 메시지 출력. list.jsp 페이지로 이동 
  				
  		- 일반 사용자
  		(1) 아이디, 비밀번호 정보를 파라미터로 전송
  		(2)  비밀번호 불일치 => 입력된 비밀번호와 db의 비밀번호를 검증
  			  		"비밀번호가 틀립니다. 메세지 출력. deleteForm.jsp 페이지 이동
  		- 관리자 
  		(1) 아이디 정보를 파라미터로 전송
  3. 관리자 로그인, 또는 비밀번호 일치하는 경우 db 에서 회원정보 삭제하기
  		삭제성공 : 일반사용자 : 로그아웃 후, 탈퇴메시지 출력. loginForm.jsp로 페이지 이동
  						관리자 : 탈퇴메시지 출력. list.jsp
  		삭제 실패 : 일반사용자 : 삭제실패 메시지 출력. info.jsp 페이지 이동. 
  						관리자 : 삭제 실패 메세지 출력. list.jsp 페이지 이동
  
  
   --%>