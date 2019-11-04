<%@page import="model1.MemberDao"%>
<%@page import="model1.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%--
    1. 로그아웃상태인 경우. 로그인 하세요. 메시지 출력 
    	다른 사용자의 비밀번호 변경 불가
    	Opner 페이지를 loginForm.jsp 페이지 이동. 
    	현재 페이지 닫기 -> opener 상대편에 있는 윈도우 객체.location? 
    2. pass, chgpass 파라미터값 저장 
    3. pass 비밀번호가 db에 저장된 비밀번호와 틀리면 
    	비밀번호 오류 메시지 출력. passwordForm.jsp 페이지 이동
    4. pass 비밀번호가 db에 저장된 비밀번호와 같으면 
    	비밀번호 수정. opner 페이지를 updateForm.jsp 페이지 이동
    	현재 페이지 닫기 
     --%>
<%
String login = (String)session.getAttribute("login");
boolean opener = false;
boolean closer = false;
String msg = null;
String url = null;

if(login == null  || login.trim().equals("")){	
	opener = true;
	closer = true;
	msg = "로그인 하세요";
	url = "loginForm.jsp";
}else{
	//String id = request.getParameter("id2");
	Member dao = new MemberDao().selectOne(login); // 현재 로그인된 id로 db에서 비밀번호 조회 
	String dbpass = dao.getPass(); // 조회된 비밀번호

	String afterpass = request.getParameter("afterpass"); //바꾼 비밀번호
	String beforepass = request.getParameter("beforepass"); // 현재 비밀번호
	if(!dbpass.equals(beforepass)){ // 현재 입력한 비밀번호와 db 비밀번호가 다르면 비밀번호 변경 로직x
		msg = "비밀번호 오류입니다. 확인하세요.";
		url = "passwordForm.jsp";
	}else{ // 현재 입력한 비밀번호와 db 비밀번호가 같으면 비밀번호 변경 로직
		MemberDao mdao = new MemberDao();
		int result = mdao.updatePw(login, afterpass); // 현재 로그인된 id와 바꾼 비밀번호넘겨줘서 비밀번호 변경
		//System.out.println(result);
		if(result >0){
			opener = true;
			closer = true;
			msg = "변경되었습니다";
			url = "updateForm.jsp?id="+login;
		}
	}
}
%>
<script>
<%-- opner true 면 큰 화면으로 나타나게 하고 opner false
면 자식 창에 그대로 뜨게함--%>
	alert("<%=msg%>");  
	<%if(opener){ %>
		opener.location.href="<%=url %>";
	<%}else {%>
		location.href="<%=url%>";
	<%}%>
	<%if(closer){ %>
		self.close();
	<%} %>
</script>


