<%@page import="model1.MemberDao"%>
<%@page import="model1.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<script>
<%-- opner true 면 큰 화면으로 나타나게 하고 opner false
면 자식 창에 그대로 뜨게함--%>
	alert("${msg}");  
	<c:choose>
	<c:when test="${opener}">
		opener.location.href="${url}";
	</c:when>
	<c:otherwise>
		location.href="${url}";
	</c:otherwise>
	</c:choose>
	<c:if test="${closer}">
		self.close();
	</c:if>
</script>


