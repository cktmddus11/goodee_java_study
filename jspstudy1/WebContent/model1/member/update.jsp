<%@page import="model1.MemberDao"%>
<%@page import="model1.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%> 
    <%
     	request.setCharacterEncoding("euc-kr");
     %> <!--  주의 -->
    <%-- Member mem = new Member(); --%>
     <jsp:useBean id="mem" class="model1.Member" />
    <jsp:setProperty name="mem" property="*"/> <!--  입력한 비밀번호 -->
    <%-- mem.setId(request.getParameter("id")) --%>
    <% 
    // selectOne(id) : 사용자 id에 해당하는 db정보 Member 객체로 리턴
    // dbmem : 변경전 Member 정보 저장
    Member dbmem = new MemberDao().selectOne(mem.getId());
    String pass =  dbmem.getPass(); // db 비밀번호
    String login = (String) session.getAttribute("login");
    // 조건순서 주의,            mem.getPass랑 pass 순서주의 ??
   	if(!login.equals("admin") && !pass.equals(mem.getPass())){  
   		%> 
   		<script>
   			alert("비밀번호가 틀렸습니다.");
   			location.href="updateForm.jsp?id=<%=mem.getId() %>";
   		</script>
   		<% 
   	}else{ // 비밀번호가 일치하는 경우
   		MemberDao dao = new MemberDao();
   	// db에 회원 정보 변경 기능. 결과 정수값 리턴
   		int result  = dao.update(mem); // useBean 폼에서 입력한값 객체 mem
		if(result > 0){
			%>
			<script>
			alert("수정성공");
			location.href="info.jsp?id=<%=mem.getId() %>";
			</script>
			<% 
		}else{
			%>
			<script>
			alert("수정실패");
			location.href="main.jsp";
			</script>
			<% 
		}
   	}
    
    
    %>
  <%--
  1. 모든 파라미터 Member 객체에 저장
  2. 입력된 비밀번호와 db에 저장된 비밀번호가 같지 않으면
  		"비밀번호가 틀렸습니다". 메시지 출력 후, updateForm.jsp페이지로 이동
  3.  1번에 내용을 db에 수정하기
  		int MemberDao.update(Member) 
  		결과가 0보다 크면 수정성공 메시지 출력. info.jsp 페이지 이동 
  					0 이하면 수정 실패 메시지 출력. main.jsp 페이지 이동
  
   --%>
