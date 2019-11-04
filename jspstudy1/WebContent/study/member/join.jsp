<%@page import="model1.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%--
1. 파라미터 정보를 Member 객체에 저장
2. Member 객체에 db에 저장 => model 담당
3. 회원가입 성공 : loginForm.jsp 페이지 이동
    회원가입 실패 : joinForm.jsp 페이지 이동. - 아이디 중복시
 --%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="member" class="model1.Member" />
<jsp:setProperty property="*" name="member"/>

<% 
MemberDao dao = new MemberDao();
int result = dao.insert(member);
String msg = null;
String url = null;
if(result > 0){
	msg = "회원가입 성공";
	url = "loginForm.jsp";
}else{
	msg = "회원가입 실패";
	url = "loginForm.jsp";
}
%>
<script>
alert("<%=msg %>");
location.href="<%=url%>";
</script>
