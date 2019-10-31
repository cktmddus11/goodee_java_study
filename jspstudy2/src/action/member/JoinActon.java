package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model2.Member;
import model2.MemberDao;
/* 
1. �Ķ���� ������ Member ��ü�� ����
2. Member��ü�� db�� �߰��ϱ�
	- ���� : ȸ������ �Ϸ� �޽��� ���. LoginForm.me �������̵�
	- ���� : ���и޽��� ���, JoinForm.me ������ �̵�

*/
public class JoinActon implements Action{
@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Member mem = new Member();
		mem.setId(request.getParameter("id"));
		mem.setPass(request.getParameter("pass"));
		mem.setName(request.getParameter("name"));
		mem.setGender(Integer.parseInt(request.getParameter("gender")));
		mem.setTel(request.getParameter("tel"));
		mem.setEmail(request.getParameter("email"));
		mem.setPicture(request.getParameter("picture"));
		String msg = "ȸ������ ����";
		String url = "LoginForm.me";
		MemberDao dao = new MemberDao();
		if(dao.insert(mem) > 0) {
			msg =  mem.getId()+"ȸ������ ����";
			url = "LoginForm.me";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}
}