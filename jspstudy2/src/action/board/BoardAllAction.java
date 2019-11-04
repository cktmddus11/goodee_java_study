package action.board;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import action.ActionForward;
import model1.Board;
import model1.BoardDao;

public class BoardAllAction {
	private BoardDao dao = new BoardDao();
	public ActionForward hello(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("hello",  "Hello, World");
		return new ActionForward();
	}
	/* 
	 * 1. multipart/form-data 타입의 전송이므로 MultipartRequest 객체생성
	 *  2. 파라미터 값을 model1.Board객체 저장
 	3. 게시물 번호 num 현재 등록된 num의 최대값을 조회. 최대값 + 1 등록된 게시물 번호
 		db 에서 maxnum을 구해서 +1  값으로 num 설정하기 
	4. board 내용을 db 에 등록하기.
		등록 성공 : 메시지 출력. list.me 페이지 이동
		등록 실패 : 메시지 출력. writeForm.me 페이지 이동
	 * 
	 * */
	public ActionForward write(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		String uploadPath = request.getServletContext().getRealPath("/")+"model2/board/file/";
		String msg = "게시물 등록 실패";
		String url = "writeForm.do";
		try {
			File f = new File(uploadPath);
			if(!f.exists()) f.mkdirs();
			MultipartRequest multi = new MultipartRequest(request, uploadPath, 10 * 1024 * 1024, "euc-kr");
			
			Board b = new Board();
			b.setName(multi.getParameter("name"));
			b.setPass(multi.getParameter("pass"));
			b.setSubject(multi.getParameter("subject"));
			b.setContent(multi.getParameter("content"));
			b.setFile1(multi.getFilesystemName("file1"));

			int num = dao.maxnum(); // 게시물의 max값
			b.setNum(++num); // 게시물 최대값 + 1
			if(dao.insert(b)) {
				msg = "게시물 등록 성공";
				url = "list.do";
			}
		} catch (IOException e) {
			throw new ServletException(e);
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}
	
	
	
	
}
