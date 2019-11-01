package action.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model1.Member;
import model1.MemberDao;

public class ListAction extends AdminLoginAction{

	@Override
	protected ActionForward adminExecute(HttpServletRequest request, HttpServletResponse response) {
		MemberDao dao = new MemberDao();
		List<Member> list = dao.list();
		request.setAttribute("list", list);
		return new ActionForward();
	}

}
