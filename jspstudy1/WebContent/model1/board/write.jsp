<%@page import="model1.BoardDao"%>
<%@page import="model1.Board"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%--
 1. 파라미터 값을 model1.board/write.jsp
 	 useBean 사용불가 : request 정보의 파라미터와 빈 클래스의 프로퍼티 비교
 								request 객체를 사용할 수 없음
 2. 게시물 번호 num 현재 등록된 num의 최대값을 조회. 최대값 + 1 등록된 게시물 번호
 		db 에서 maxnum을 구해서 +1  값으로 num 설정하기 
3. board 내용을 db 에 등록하기.
	등록 성공 : 메시지 출력. list.jsp 페이지 이동
	등록 실패 : 메시지 출력. writeForm.jsp 페이지 이동
  --%>
  <%
  // 1. 파라미터 값을 model1.Board 객체 저장
  String uploadpath = application.getRealPath("/")+
  													"model1/board/file/";
  File f = new File(uploadpath);
  // uploadpath 폴더가 없는 경우
  if(!f.exists()) {
	  f.mkdirs(); // 여러단계 폴더 생성
  }
  int size = 10 * 1024 * 1024;
  MultipartRequest multi = new MultipartRequest(request, uploadpath, size, "euc-kr");
  // 업로드 완료 
  
  Board board = new Board();
  board.setName(multi.getParameter("name"));
  board.setPass(multi.getParameter("pass"));
  board.setSubject(multi.getParameter("subject"));
  board.setContent(multi.getParameter("content"));
  board.setFile1(multi.getFilesystemName("file1"));
  
  BoardDao dao = new BoardDao();
  int num = dao.maxnum(); // db 에 등록된 게시물중 게시물 번호 최대값
  String msg = "게시물 등록 실패";
  String url = "writeForm.jsp";
  // setNum, setGrp같은 번호로 묶임
  board.setNum(++num); // num의 최대값 + 1
  board.setGrp(num); // 게시물 그룹 번호
  if(dao.insert(board)){
	  msg = "게시물 등록 성공";
	  url = "list.jsp";
 	}
  
  %>
  <script>
  	alert("<%=msg %>");
  	location.href="<%=url %>";
  </script>
