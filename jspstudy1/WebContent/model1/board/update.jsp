<%@page import="model1.BoardDao"%>
<%@page import="java.io.File"%>
<%@page import="model1.Board"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
1.  �Ķ������������ Board ��ü�� ����
2. ��й�ȣ ����
	��й�ȣ ��ġ�ϴ� ��� ����
		�Ķ���� �������� �ش� �Խù��� ������ �����ϱ�
		÷�������� ������ ���� ��� file2 �Ķ������ ������ �ٽ� �����ϱ�
	��й�ȣ ����ġ               ���������ʾ����� file1 = file2 
		��й�ȣ ���� �޽��� ����ϰ�, updateForm.jsp �� ������ �̵�
3. ���� ���� : �������� �޽��� ����ϰ�, info.jsp �� ������ �̵�
	���� ���� : ���� ���� �޽��� ����� updateForm.jsp �������� �̵�

 --%>
 <%
 // 1. �Ķ���� ���� Board ��ü�� ����
 Board board = new Board();
 String uploadPath = application.getRealPath("/model1/board/")+"file/";
MultipartRequest multi = new MultipartRequest(request, uploadPath, 10 *1024 * 1024, "euc-kr");
board.setNum(Integer.parseInt(multi.getParameter("num")));
board.setName(multi.getParameter("name"));
board.setPass(multi.getParameter("pass"));
board.setSubject(multi.getParameter("subject"));
board.setContent(multi.getParameter("content"));
board.setFile1(multi.getFilesystemName("file1")); // ���� �߰�

if(board.getFile1() == null || board.getFile1().equals("")){
	board.setFile1(multi.getParameter("file2")); // ����
}
String msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�.";
String url = "updateForm.jsp?num="+board.getNum();

BoardDao dao = new BoardDao();
Board dbBoard = dao.selectOne(board.getNum());

if(dbBoard.getPass().equals(board.getPass())){
	if(dao.update(board)){
		msg = "�Խù� �����Ϸ�";
		url = "info.jsp?num="+board.getNum();
	}else{
		msg = "�Խù���������";
	}
}

 %>
<script>
alert("<%=msg %>");
location.href="<%=url %>";
</script>