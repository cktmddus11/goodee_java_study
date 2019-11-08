package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model.Member;
import model.MemberDao;
/* 
1. 파라미터 정보를 Member 객체에 저장
2. Member객체를 db에 추가하기
	- 성공 : 회원가입 완료 메시지 출력. LoginForm.me 페이지이동
	- 실패 : 실패메시지 출력, JoinForm.me 페이지 이동

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
		String msg = "회원가입 실패";
		String url = "loginForm.me";
		MemberDao dao = new MemberDao();
		if(dao.insert(mem) > 0) {
			msg =  mem.getId()+"회원가입 성공";
			url = "loginForm.me";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}
}
