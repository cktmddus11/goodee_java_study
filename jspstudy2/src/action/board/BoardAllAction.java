package action.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model1.BoardDao;

public class BoardAllAction {
	private BoardDao dao = new BoardDao();
	public ActionForward hello(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("hello",  "Hello, World");
		return new ActionForward();
	}
}
