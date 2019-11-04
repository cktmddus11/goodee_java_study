<%@page import="model1.Board"%>
<%@page import="model1.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
	1. num, pass 파라미터를 변수에 저장
	2. 입력된 비밀번호와 db 비밀번호 검증
		틀린경우 : 비밀번호 오류 메시지 출력, deleteForm.jsp 페이지 이동
	3. 비밀번호가 맞는 경우 : 게시물 삭제
		삭제 성공 : 삭제 성공 메시지 출력, list.jsp 페이지 이동
		삭제 실패 : 삭제 실패 메시지 출력, info.jsp

--%>
<%
int num = Integer.parseInt(request.getParameter("num"));
String pass = request.getParameter("pass");

BoardDao dao = new BoardDao();
Board b = dao.selectOne(num);

String msg = null;
String url = null;
if(b == null){
	msg = "없는 게시글 입니다.";
	url = "list.jsp";
}else{
	String dbpass = b.getPass();
	if(dbpass.equals(pass)){
		if(dao.delete(num)){
			msg = "삭제 되었습니다.";
			url = "list.jsp";
		}else{
			msg = "삭제중 오류 발생";
			url = "info.jsp?num="+num;
		}
	}else{
		msg = "비밀번호가 틀렸습니다.";
		url = "deleteForm.jsp?num="+num;
	}
}
%>
<script>
alert("<%=msg%>");
location.href="<%=url%>";
</script>