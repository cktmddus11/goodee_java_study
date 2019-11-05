package action.board;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

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
			b.setGrp(num);
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
	/* 
	 * 	1. 한 페이지당 10 건의 게시물을 출력하기.
			pageNum 파라미터값을 저장 => 없는 경우는 1로 설정.
		2. 최근 등록된 게시물을 가장 위에 배치함. 
		3. 화면단에 필요한 정보를 속성으로 등록하고 
	 * 
	 * */
	public ActionForward list(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		int limit = 10;
		int pageNum = 1;
		
		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}catch(NumberFormatException e) {}
		
		String column = request.getParameter("column");
		String find = request.getParameter("find");
		// 검색조건
		if(column != null && column.trim().equals("")) { // 입력내용 띄어쓰기?
			column = null;
		}if(find != null && find.trim().equals("")) {
			find = null;
		}if(column == null || find == null) { // 두개다 있어야지 검색되게 
			column = null;
			find = null;
		}

		int boardcnt = dao.boardCount(column, find);
		List<Board> list = dao.list(pageNum, limit, column, find);
		
		int maxpage = (int)((double) boardcnt / limit + 0.95);
		int startpage = ((int)(pageNum / 10.0 + 0.9)-1) * 10 + 1;
		int endpage = startpage + 9;
		if(endpage > maxpage) {
			endpage = maxpage;
		}
		int boardnum = boardcnt - (pageNum -1) * limit;
	
		request.setAttribute("boardcnt", boardcnt);
		request.setAttribute("list", list);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage",  startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("boardnum", boardnum);
		request.setAttribute("pageNum", pageNum);
		return new ActionForward();
	}
	public ActionForward info(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		int num = Integer.parseInt(request.getParameter("num"));
		Board b = dao.selectOne(num); 
		// request.getRequestURI() : /jspstudy2/model2/info.do 
		// 수정 등 상세보기가 아닐때는 조회수 증가되지 않게 
		if(request.getRequestURI().contains("board/info.do")) {
			dao.readcntadd(num); 
		}
		System.out.println(b);
		request.setAttribute("b", b);
		return new ActionForward();
		
	}
	/* 
	 * 1. 파라미터 값을 Board 객체에 저장하기
	원글 정보 : num, grp, grplevel, grpstep
	답글 정보 : name, pass, subject, content => 등록정보
	2. 같은 grp 값을 사용하는 게시물들의 grpstep값을 1 증가하기
	3. Board 객체를 db에 insert 하기
	num : maxnum +1
	grp : 원글과 동일
	grplevel : 원글 + 1
	grpstep : 원글 + 1
	4. 등록 성공 시 : "답변 등록 완료" 메시지 출력 후,  list.jsp로 페이지 이동
 	등록 실패 시 : "답변 등록시 오류발생" 메시지 출력 후, replyForm.jsp로 페이지 이동
	 * 
	 * */
	public ActionForward reply(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		Board b = new Board();
		// 답글 정보
		b.setName(request.getParameter("name"));
		b.setPass(request.getParameter("pass"));
		b.setSubject(request.getParameter("subject"));
		b.setContent(request.getParameter("content"));
		// 원글 정보
		b.setNum(Integer.parseInt(request.getParameter("num")));
		b.setGrp(Integer.parseInt(request.getParameter("grp")));
		b.setGrplevel(Integer.parseInt(request.getParameter("grplevel")));
		b.setGrpstep(Integer.parseInt(request.getParameter("grpstep")));
		
		dao.grpStepAdd(b.getGrp(), b.getGrpstep());
		
		int grplevel = b.getGrplevel();
	 	int grpstep = b.getGrpstep();
	 	int num = dao.maxnum();
	 	String msg = "답변등록시 오류발생";
	 	String url = "replyForm.do?num="+b.getNum();
	 	
	 	b.setNum(++num);
	 	b.setGrplevel(grplevel+1);
	 	b.setGrpstep(grpstep + 1); 
	 	System.out.println("수정한 내용"+b);
	 	if(dao.insert(b)){
	 		msg = "답변 등록 완료";
	 		url = "list.do";
	 	}
	 	request.setAttribute("msg", msg);
	 	request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}
	/* 
	 * 1.  파라미터정보들을 Board 객체에 저장
		2. 비밀번호 검증
			비밀번호 일치하는 경우 수정
			파라미터 내용으로 해당 게시물의 내용을 수정하기
			첨부파일의 변경이 없는 경우 file2 파라미터의 내용을 다시 저장하기
			비밀번호 불일치               수정하지않았으면 file1 = file2 
			비밀번호 오류 메시지 출력하고, updateForm.do 로 페이지 이동
		3. 수정 성공 : 수정성공 메시지 출력하고, info.do 로 페이지 이동
			수정 실패 : 수정 실패 메시지 출력후 updateForm.do 페이지로 이동

	 * 
	 * */
	public ActionForward update(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		Board board = new Board();
		String uploadPath =	request.getServletContext().getRealPath("/")+"model2/board/file/";
		MultipartRequest multi;
		String msg = null;
		String url = null;
		
		try {
			multi = new MultipartRequest(request, uploadPath, 10 *1024 * 1024, "euc-kr");
			board.setNum(Integer.parseInt(multi.getParameter("num")));
			board.setName(multi.getParameter("name"));
			board.setPass(multi.getParameter("pass"));
			board.setSubject(multi.getParameter("subject"));
			board.setContent(multi.getParameter("content"));
			board.setFile1(multi.getFilesystemName("file1"));
			msg = "비밀번호가 틀렸습니다.";
			url = "updateForm.do?num="+board.getNum();
			// 첨부파일 수정이 안된 경우
			if(board.getFile1() == null || board.getFile1().equals("")){
				board.setFile1(multi.getParameter("file2")); // 원본
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		Board dbBoard = dao.selectOne(board.getNum());
		
		if(dbBoard.getPass().equals(board.getPass())){
			if(dao.update(board)){
				msg = "게시물 수정완료";
				url = "info.do?num="+board.getNum();
			}else{
				msg = "게시물수정실패";
			}
		}
		request.setAttribute("url", url);
		request.setAttribute("msg", msg);
		return new ActionForward(false, "../alert.jsp");
		
	}
	/* 
	 * 	1. num, pass 파라미터를 변수에 저장
	2. 입력된 비밀번호와 db 비밀번호 검증
		틀린경우 : 비밀번호 오류 메시지 출력, deleteForm.jsp 페이지 이동
	3. 비밀번호가 맞는 경우 : 게시물 삭제
		삭제 성공 : 삭제 성공 메시지 출력, list.jsp 페이지 이동
		삭제 실패 : 삭제 실패 메시지 출력, info.jsp
	 * 
	 * */
	public ActionForward delete(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		int num = Integer.parseInt(request.getParameter("num"));
		String pass = request.getParameter("pass");

		Board b = dao.selectOne(num);
		String msg = null;
		String url = null;
		if(b == null){
			msg = "없는 게시글 입니다.";
			url = "list.do";
		}else{
			String dbpass = b.getPass();
			if(dbpass.equals(pass)){
				if(dao.delete(num)){
					msg = "삭제 되었습니다.";
					url = "list.do";
				}else{
					msg = "삭제중 오류 발생";
					url = "info.do?num="+num;
				}
			}else{
				msg = "비밀번호가 틀렸습니다.";
				url = "deleteForm.do?num="+num;
			}
		}
		request.setAttribute("url", url);
		request.setAttribute("msg", msg);
		return new ActionForward(false, "../alert.jsp");
		
		
	}
	/* CKEDITOR 에서 이미지를 게시판 내용에 추가하기*/
	public ActionForward imgupload(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getServletContext().getRealPath("/")+
				"model2/board/imgfile/";
		File f = new File(path);
		if(!f.exists()) f.mkdirs();
		MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "euc-kr");
		// upload라는 이름으로 파일을 전달해줌 - 내부적인 파라미터 이름
		String fileName = multi.getFilesystemName("upload");
		request.setAttribute("fileName", fileName);
		request.setAttribute("CKEditorFuncNum", request.getParameter("CKEditorFuncNum"));
		return new ActionForward(false, "ckeditor.jsp");
		
	}
	
}