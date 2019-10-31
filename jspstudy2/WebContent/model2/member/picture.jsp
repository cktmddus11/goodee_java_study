<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%--
	
		------------자바스크립트가 아래 두개 해줌-----
		2. opener 화면에 결과 전달 - client
		3. 현재 화면 close()  - client 
		
 --%>
<script type="text/javascript">
	img = opener.document.getElementById("pic");
	img.src = "picture/${fname}"; <%-- img src 경로 설정 --%>
	opener.document.f.picture.value = "${fname}"; <%-- hidden 값 설정--%>
	self.close();
</script>