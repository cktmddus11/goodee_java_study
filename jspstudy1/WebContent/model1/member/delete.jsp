<%@page import="model1.MemberDao"%>
<%@page import="model1.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
  <% 
  String login = (String)session.getAttribute("login");
  String id = request.getParameter("id");
  String pass = request.getParameter("pass");
  String url = null;
  String msg = null;
  
  if(login == null || login.trim().equals("")){ // 로그아웃상태
	  msg = "로그인이 필요합니다.";
	  url = "loginForm.jsp";
  }else if(!login.equals(id) && !login.equals("admin")){ // 관리자가 아니고 일반사용자가 다른 사용자를 탈퇴시키려고
	  msg = "본인만 탈퇴가 가능합니다.";
	  url = "main.jsp";
  }else if(id.equals("admin")){ // 탈퇴대상이 되는 회원은 관리자 안됨
	  msg = "관리자는 탈퇴할 수 없습니다.";
	  url = "list.jsp";
  }else{  // 비밀번호 검증
	  MemberDao dao = new MemberDao();
	  Member mem = dao.selectOne(id);
	  if(login.equals("admin") || pass.equals(mem.getPass())){ // 순서 주의 
		  // 앞이 true되면 뒤에가 false여도 true로 처리
		 // int result = dao.delete(id);
		  if(dao.delete(id) > 0){ // 삭제 성공
			  if(login.equals("admin")){ // 관리자인 경우
				  msg = id + "사용자를 강제 탈퇴 성공";
				  url = "list.jsp";
				  // 세션지우면 안됨 
			  }else{ // 일반사용자인 경우 
				  msg = id+"님의 회원 탈퇴가 완료되었습니다.";
			  		url = "loginForm.jsp";
			  		session.invalidate();
			  }
		  }else{  // 삭제 실패
			  msg = id + "님의 탈퇴중 오류발생.";
			  if(login.equals("admin")) { // 관리자인 경우 
				  url = "list.jsp";
			  }else{
				  url = "info.jsp?id="+id;
			  }
		  }
	  }else{ // 관리자가 아니면서 비밀번호가 틀렸을때
		  msg = id + "님의 비밀번호가 틀립니다.";
		  url = "deleteForm.jsp?id="+id;
	  }
  }
  %> 
   
   
<script>
	alert("<%= msg %>");
	location.href="<%=url %>";
</script>