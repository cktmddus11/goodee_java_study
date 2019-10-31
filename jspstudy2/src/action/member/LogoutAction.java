package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;

public class LogoutAction extends UserLoginAction{
	
	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {
		String msg = login+"´ÔÀÌ ·Î±×¾Æ¿ôµÇ¼Ì½À´Ï´Ù.";
		String url = "loginForm.jsp";
		request.getSession().invalidate();
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}

	

}
