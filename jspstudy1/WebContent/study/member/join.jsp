<%@page import="model1.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%--
1. �Ķ���� ������ Member ��ü�� ����
2. Member ��ü�� db�� ���� => model ���
3. ȸ������ ���� : loginForm.jsp ������ �̵�
    ȸ������ ���� : joinForm.jsp ������ �̵�. - ���̵� �ߺ���
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
	msg = "ȸ������ ����";
	url = "loginForm.jsp";
}else{
	msg = "ȸ������ ����";
	url = "loginForm.jsp";
}
%>
<script>
alert("<%=msg %>");
location.href="<%=url%>";
</script>
