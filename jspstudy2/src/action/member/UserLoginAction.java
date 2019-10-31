package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;

public abstract class UserLoginAction implements Action {
	protected String login; // 로그인 정보
	protected String id; // 파라미터 정보 - 상속관계접근가능

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		login = (String) request.getSession().getAttribute("login");
		id = request.getParameter("id");
		
		if(login == null || login.trim().equals("")) { // 로그인 안돼있으면
			request.setAttribute("msg", "로그인 후 거래하세요.");
			request.setAttribute("url", "loginForm.me");
			return new ActionForward(false, "../alert.jsp"); 
			// MainAction 이 이 클래스 상속받아서 이클래스를 먼저 들려서
			// 가기전에 여기서 걸려서 doExecute가 실행 안됨?
		}else { // 로그인 돼있으면 
			if(!login.equals("admin") && id != null && !login.equals(id)) { // 로그인정보가 admin이 아니면서 로그인정보와 파라미터 정보가 일치하지 않으면
				request.setAttribute("msg", "본인만 가능합니다.");
				request.setAttribute("url",  "main.me");
				return new ActionForward(false, "../alert.jsp");
			}
		}
		// 위에 조건문 다 아니면 로그인상태여야만 MainAction 클래스의 doExecute메서드호출됨
		return doExecute(request, response);
	}

	protected abstract ActionForward doExecute(HttpServletRequest request, HttpServletResponse response);

}
