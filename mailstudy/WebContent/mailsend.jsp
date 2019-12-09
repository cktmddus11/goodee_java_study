<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="mb" class="mail.MailBean"/>
<jsp:setProperty property="*" name="mb"/>
<%
	if(mb.sendMail()){
		out.println("<center><H2>메일이 발송되었습니다.</H2>");
		out.println("<HR><a href=mailform.html>메일 작성하기</a></center>");
	}else{
		out.println("<script>alert('메일 전송중 문제가 발생했습니다.'); history.go(-1)");
	}

%>