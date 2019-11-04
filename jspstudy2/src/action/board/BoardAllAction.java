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
	 * 1. multipart/form-data Ÿ���� �����̹Ƿ� MultipartRequest ��ü����
	 *  2. �Ķ���� ���� model1.Board��ü ����
 	3. �Խù� ��ȣ num ���� ��ϵ� num�� �ִ밪�� ��ȸ. �ִ밪 + 1 ��ϵ� �Խù� ��ȣ
 		db ���� maxnum�� ���ؼ� +1  ������ num �����ϱ� 
	4. board ������ db �� ����ϱ�.
		��� ���� : �޽��� ���. list.me ������ �̵�
		��� ���� : �޽��� ���. writeForm.me ������ �̵�
	 * 
	 * */
	public ActionForward write(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		String uploadPath = request.getServletContext().getRealPath("/")+"model2/board/file/";
		String msg = "�Խù� ��� ����";
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

			int num = dao.maxnum(); // �Խù��� max��
			b.setNum(++num); // �Խù� �ִ밪 + 1
			if(dao.insert(b)) {
				msg = "�Խù� ��� ����";
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
