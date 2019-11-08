
<%@page import="model1.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
1. 파라미터 값을 Board 객체에 저장하기 => useBean 태그 사용
	원글 정보 : num, grp, grplevel, grpstep
	답글 정보 : name, pass, subject, content => 등록정보
2. 같은 grp 값을 사용하는 게시물들의 grpstep값을 1 증가하기
3. Board 객체를 db에 insert 하기
	num : maxnum +1
	grp : 원글과 동일
	grplevel : 원글 + 1
	grpstep : 원글 + 1
4. 등록 성공 시 : "답변 등록 완료" 메시지 출력 후,  list.jsp로 페이지 이동
 	등록 실패 시 : "답변 등록시 오류발생" 메시지 출력 후, replyForm.jsp로 페이지 이동
 --%>
 <!-- 1. 파라미터 값을 Board 객체에 저장하기 -->
 <%
 	request.setCharacterEncoding("euc-kr");
 %>
 <jsp:useBean id="b" class="model1.Board"/>
 <jsp:setProperty name="b" property="*"/>
 <%
 	BoardDao dao = new BoardDao();
 	// 2. 같은 grp 값을 사용하는 게시물들의 grpstep값을 1 증가하기
 	dao.grpStepAdd(b.getGrp(), b.getGrpstep());
 	// 3.  Board 객체를 db에 insert 하기
 	int grplevel = b.getGrplevel();
 	int grpstep = b.getGrpstep();
 	int num = dao.maxnum();
 	String msg = "답변등록시 오류발생";
 	String url = "replyForm.jsp?num="+b.getNum();
 	b.setNum(++num);
 	b.setGrplevel(grplevel+1);
 	b.setGrpstep(grpstep + 1); // 원글  +1 -> 자기글 원글 바로 아래에달게함 
 	if(dao.insert(b)){
 		msg = "답변 등록 완료";
 		url = "list.jsp";
 	}
 	
 %>
<script>
alert("<%=msg %>");
location.href="<%=url%>";
</script>


