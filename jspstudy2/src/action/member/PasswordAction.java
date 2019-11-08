package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model.Member;
import model.MemberDao;

/* 
 *     1. 로그아웃상태인 경우. 로그인 하세요. 메시지 출력 
    	다른 사용자의 비밀번호 변경 불가
    	Opner 페이지를 loginForm.jsp 페이지 이동. 
    	현재 페이지 닫기 -> opener 상대편에 있는 윈도우 객체.location? 
    2. pass, chgpass 파라미터값 저장 
    3. pass 비밀번호가 db에 저장된 비밀번호와 틀리면 
    	비밀번호 오류 메시지 출력. passwordForm.jsp 페이지 이동
    4. pass 비밀번호가 db에 저장된 비밀번호와 같으면 
    	비밀번호 수정. opner 페이지를 info.jsp 페이지 이동
    	현재 페이지 닫기 
 * 
 * */ // 다른 오프너로 보내고 그래야 해서 상속 안됨
public class PasswordAction implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String login = (String)request.getSession().getAttribute("login");
		
		String msg = null;
		String url = null;
		
		boolean opener = false;
		boolean closer = false;
		
		if(login != null) { // 로그인 상태
			MemberDao dao = new MemberDao();
			Member mem = dao.selectOne(login);
			String dbPass = mem.getPass();
			String pass = request.getParameter("beforepass"); // 현재비번
			String chgpass = request.getParameter("afterpass"); // 바꾼 비먼
			if(dbPass.equals(pass)) {
				if(dao.updatePw(login,  chgpass) >0) {
					msg = "비밀번호가 변경되었습니다.";
					url = "info.me?id="+login; 
					opener = true;
					closer = true;
				}else {
					msg = "비밀번호 오류입니다.";
					url = "passwordForm.me";
				}
			}else {
				msg = "비밀번호가 틀립니다.";
				url = "passwordForm.me";
			}
			
		}else {
			msg = " 로그인 하세요.";
			url = "loginForm.me";
			opener = true;
			closer = true;
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		request.setAttribute("opener", opener);
		request.setAttribute("closer", closer);
		return new ActionForward();
	}
	

}
