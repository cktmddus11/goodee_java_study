<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.File"%>
<%@page import="java.awt.Graphics2D"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.media.jai.JAI"%>
<%@page import="javax.media.jai.RenderedOp"%>
<%@page import="java.awt.image.renderable.ParameterBlock"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>원본 이미지와 썸네일 이미지 보기</title>
</head>
<body>
	<%
	// path ; 이미지 업로드 위치 
	/*C:\Users\GDJ_19\eclipse-workspace\HTML\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\jspstudy1 */
	String path = application.getRealPath("/")+"thumbnail/";
	int size = 10 * 1024 * 1024; // 최대 업로드 크기 10M
	// request : 요청객체, 파일 이름정보, 파일내용정보, 파라미터 정보
	// path : 파일 업로드 폴더 정보
	// size : 최대 업로드 될 수 있는 파일의 크기
	// "euc-kr" : 인코등 정보
	// => 파일 업로드 완료
	MultipartRequest multi = new MultipartRequest(request, path, size, "euc-kr");
	// fname : 업로드된 파일의 이름
	String fname = multi.getFilesystemName("picture");
	// new File(path +fname) : 업로드 된 이미지의 위치
	// BufferedImage : 이미지를 읽어서 메모리에 로드. 
	// bi : 원본 이미지의 메모리 로드 데이터 정보
	BufferedImage bi = ImageIO.read(new File(path + fname));
	int width = bi.getWidth() / 5; // 원본 이미지의 가로크기의 1 / 5
	int height = bi.getHeight() / 5; //  원본 이미지의 세로크기의 1 / 5
	// thumb : 원본이 1 / 5 크기의 이미지 버퍼를 생성 색성은 컬러로 설정.
	// thumb : 빈 도화지 객체 생성
	BufferedImage thumb = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
	// g : 그리기 도구 객체
	Graphics2D g = thumb.createGraphics();
	// drawImage : 이미지 그리기. 이미지버퍼에 원본의 1/5 크기의 이미지 생성
	g.drawImage(bi, 0, 0, width, height, null);
	File f = new File(path + "sm_" + fname);
	// 이미지 버퍼의 내용을 파일로 생성
	ImageIO.write(thumb, "jpg", f);

	
	%>
	<h3> 원본이미지</h3>
	<img src="<%=fname %>"><p>
	<h3>썸네일 이미지</h3>
	<img src="sm_<%=fname %>"><p>
	
</body>
</html>