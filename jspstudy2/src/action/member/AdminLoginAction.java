package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
/*
1. 로그아웃 상태 : 로그인이 필요합니다. 메세지 출력
							loginForm.jsp 로페이지 이동
2. 로그인 상태 
					일반 사용자 : 관리자만 가능한 거래입니다. 메시지 출력
										main.jsp 로 페이지 이동
					관리자  :  
*/

public abstract class AdminLoginAction implements Action{
	protected String login;
	protected String id;
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		login = (String) request.getSession().getAttribute("login");
		id = request.getParameter("id");
		
		if(login == null || login.trim().equals("")) {
			request.setAttribute("msg", "로그인이 필요합니다.");
			request.setAttribute("url", "loginForm.me");
			return new ActionForward(false, "../alert.jsp");
		}else { // 로그인 상태
			if(!login.equals("admin")) {
				request.setAttribute("msg", "관리자만 가능한 거래입니다.");
				request.setAttribute("url", "main.me");
				return new ActionForward(false, "../alert.jsp");
			}
		}
		return adminExecute(request, response);
	}
	protected abstract ActionForward adminExecute(HttpServletRequest request, HttpServletResponse response);

}
