<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="mb" class="mail.MailBean"/>
<jsp:setProperty property="*" name="mb"/>
<%
	if(mb.sendMail()){
		out.println("<center><H2>������ �߼۵Ǿ����ϴ�.</H2>");
		out.println("<HR><a href=mailform.html>���� �ۼ��ϱ�</a></center>");
	}else{
		out.println("<script>alert('���� ������ ������ �߻��߽��ϴ�.'); history.go(-1)");
	}

%>