<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
		1. ���� ���ε� - java ����
		------------�ڹٽ�ũ��Ʈ�� �Ʒ� �ΰ� ����-----
		2. opener ȭ�鿡 ��� ���� - client
		3. ���� ȭ�� close()  - client 
		
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