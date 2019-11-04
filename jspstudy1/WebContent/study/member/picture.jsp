<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
		1. 파일 업로드 - java 영역
		------------자바스크립트가 아래 두개 해줌-----
		2. opener 화면에 결과 전달 - client
		3. 현재 화면 close()  - client 
		
 --%>
 <%
 String path = application.getRealPath("")+"study/member/picture";
 String fname = null;
 
 try{
	 File f = new File(path);
	 if(!f.exists()){
		 f.mkdirs();
	 }
	 MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "euc-kr");
	fname = multi.getFilesystemName("picture");
 }catch(Exception e){
	 e.printStackTrace();
 }

 %>
 <script>
 var img = opener.document.getElementById("pic");
 img.src = "picture/<%=fname %>";
 opener.document.f.picture.value = "<%=fname %>";
 self.close();
 </script>