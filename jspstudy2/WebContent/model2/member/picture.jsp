<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%--
	
		------------�ڹٽ�ũ��Ʈ�� �Ʒ� �ΰ� ����-----
		2. opener ȭ�鿡 ��� ���� - client
		3. ���� ȭ�� close()  - client 
		
 --%>
<script type="text/javascript">
	img = opener.document.getElementById("pic");
	img.src = "picture/${fname}"; <%-- img src ��� ���� --%>
	opener.document.f.picture.value = "${fname}"; <%-- hidden �� ����--%>
	self.close();
</script>