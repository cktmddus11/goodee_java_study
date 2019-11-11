<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <!--  ajax 파라미터는 utf-8 로 인코딩해야함 -->
<% request.setCharacterEncoding("UTF-8");%>
<h3>안녕하세요<font color="blue"> ${param.name}</font>입니다.</h3>