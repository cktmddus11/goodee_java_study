<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="./css/main.css">
<title></title>
</head>
<body>
<!-- �Էµ� ������ join.jsp �� ����ϱ� 
�� 1. useBean, setProperty �� �̿��ϱ�
2. BeanŬ������ �̸��� chap7.Member -->
		<% request.setCharacterEncoding("euc-kr");%>
		<!--                                                 ��ü ���� -->
		<jsp:useBean id="member" class="chap7.Member" />
		<!-- form  �Ķ���Ͷ� ������Ƽ����?�ؼ� ��?  *  -->
		<jsp:setProperty property="*" name="member" />
		<!--  member ��ü�� �Ķ���� ���� ���� ����� ���� -->
		<jsp:setProperty property="password" name="member" param="pass" />	 
		
		<table border="1" style="border-collapse:collapse;">
		<caption>ȸ������ </caption>
		<tr>	
			<td>���̵�</td>
			<td><jsp:getProperty name="member" property="id" /> </td>
		</tr>
		<tr>
			<td>��й�ȣ</td>
			<td><jsp:getProperty name="member" property="password" /> </td>
		</tr>
		<tr>
			<td>����</td>
		<%-- 	<td><jsp:getProperty name="member" property="gender" /> </td> --%>
<%-- 			<td><%=((member.getGender() == 1)?"����":"����") %></td> --%>
			<td><jsp:getProperty name="member" property="gender2" /> </td>
		</tr>
		<tr>
			<td>����</td>
			<td><jsp:getProperty name="member" property="age" /> </td>
		</tr>
		<tr>
			<td>�̸���</td>
			<td><jsp:getProperty name="member" property="email" /> </td>
		</tr>
		
		
		
	</table>
</body>
</html>