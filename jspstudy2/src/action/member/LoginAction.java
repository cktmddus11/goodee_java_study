package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model.Member;
import model.MemberDao;
/*
 * 1. id, pass 파라미터 저장
 * 2. id 해당하는 정보를 db애서 조회
 * 		- 존재하면 비밀번호 확인
 * 		- 존재하지 않으면 id없음 메시지를 출력하고 LoginForm.me 페이지로 이동
 * 3. id 존재하면 비밀번호 검증
 * 		- 비밀번호가 맞는 경우 : session 로그인 정보 저장
 * 											로그인 성공 메시지 출력, main.me 페이지로 이동
 * 		- 비밀번호가 틀린경우 : 로그인 실패 메시지를 출력, loginForm.me 페이지로 이동 
 *  
 *  
 *  */
public class LoginAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String msg = "해당하는 id가 존재하지 않습니다. ";
		String url = "loginForm.me";
		
		Member mem = new MemberDao().selectOne(id);
		if(mem != null) { // id가 존재하면
			if(pass.equals(mem.getPass())) { // 입력한 비밀번호와 db비밀번호가같으면
				request.getSession().setAttribute("login", id); // session은 자바의 내장객체가 아니고 jsp에 내장객체? 
				msg = mem.getName() + "님이 로그인하셨습니다.";
				url = "main.me";
			}else {// 입력한 비밀번호와 db비밀번호가 다르면
				msg = "비밀번호가 틀립니다.";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
		
	}
}
