package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model1.MemberDao;

public class PassAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String id = request.getParameter("id");
		MemberDao dao = new MemberDao();
		String pw = dao.selectPW(email, tel, id);
		
		
		
		if(pw == null){
			String msg = "정보에 맞는 pw가 없습니다.";
			String url = "pwForm.me";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return new ActionForward(false, "../alert.jsp");
		}else {
			pw = pw.substring(pw.length()-2);
			request.setAttribute("pw", pw);
			System.out.println(pw);
			return new ActionForward();
		}
	}

}
