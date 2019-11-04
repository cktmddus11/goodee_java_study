<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String path = application.getRealPath("") + "model1/member/picture";
String fname = null;
try{
	File f = new File(path);
	if(!f.exists()){ // 경로에 파일이 존재하지 않으면
		f.mkdirs(); // picture폴더 생성
	}
	MultipartRequest multi = new MultipartRequest(request, path, 10 *1024 * 1024, "euc-kr");
	fname = multi.getFilesystemName("picture"); // pictureForm name속성picture파라미터
}catch(Exception e){
	e.printStackTrace();
}
%>
<%--
		1. 파일 업로드 - java 영역
		------------자바스크립트가 아래 두개 해줌-----
		2. opener 화면에 결과 전달 - client
		3. 현재 화면 close()  - client 
		
 --%>
<script type="text/javascript">
	img = opener.document.getElementById("pic");
	img.src = "picture/<%=fname%>"; <%-- img src 경로 설정 --%>
	opener.document.f.picture.value = "<%=fname%>"; <%-- hidden 값 설정--%>
	self.close();
</script>