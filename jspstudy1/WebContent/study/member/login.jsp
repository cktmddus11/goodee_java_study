<%@page import="model1.MemberDao"%>
<%@page import="model1.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
  <%-- 
1. id �� �ش��ϴ� ������ db���� ��ȸ
2. -������ �����ϸ� ��й�ȣ ����
	-> db �� ��й�ȣ�� �Էµ� ��й�ȣ Ȯ��
		�´� ��� : session �α��� ���� ���. Ȯ�� �޽��� ���.
		Ʋ�� ��� :  '��й�ȣ�� Ʋ���ϴ�' �޽��� 
	- id �� ������ ȭ�鿡 '���̵� Ȯ���ϼ���' �޽��� ���
		=> loginForm.jsp �������� �̵�

 --%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α��� action</title>
</head>
<body>
	<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	Member member = new MemberDao().selectOne(id);
	if(member == null){%>
		<script>alert("���̵� Ȯ���ϼ���."); 
		location.href="loginForm.jsp"</script>
	<%}else{
		if(pass.equals(member.getPass())){
			session.setAttribute("login", id);
			%>
			<script>alert("<%=member.getId()%>���� �α��� ����");
			location.href="main.jsp"</script>
		<%
		}else{%>
			<script>
				alert("��й�ȣ�� Ʋ���ϴ�. ");
				location.href="loginForm.jsp";
			</script>
		<% }
	}
			
			
	%>
</body>
</html>