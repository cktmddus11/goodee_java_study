<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--������������ ���� ó�� �������� --%>
<%@ page isErrorPage="true" %>    <%-- exception ��ü ���� --%>
<!DOCTYPE html>
<html>
<head>
<!--  �������������� �����߻��� error.jsp ���� �̵� -->
<meta charset="EUC-KR">
<title>���� ������</title>
</head>
<body>
	<h1>�Ķ���� name�� �Է����ּ���. </h1>
	<h1>��� ���� �߻��� ����η� ��ȭ ��� </h1>
	<h1>����� : ȫ�浿, ��ȭ : 1234 </h1>
	<%=exception.getClass().getName() %>
	<% exception.printStackTrace(response.getWriter()); %>
	<!-- ������������ ��� �뷮�� 500����Ʈ �̸��� ���
	���������� ���� �������� �ƴ� http ������������ ����� �� 
	���� �׷��Ƿ� 500����Ʈ �̻��� �ǵ��� 
 ������������ �޽����� ����ؾ���. �̺κ��� 500����Ʈ�� 
 �ѱ�� ���� �޽����� -->>
</body>
</html>