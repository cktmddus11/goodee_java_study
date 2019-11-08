package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model.Member;
import model.MemberDao;

public class InfoAction extends UserLoginAction{

	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {
		// 로그인 정보를 이미 검증한 상태임
		Member info = new MemberDao().selectOne(id);
		request.setAttribute("info", info);
		return new ActionForward();
	}

}
