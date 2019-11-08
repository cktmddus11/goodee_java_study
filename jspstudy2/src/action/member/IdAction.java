package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model.MemberDao;

public class IdAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		MemberDao dao = new MemberDao();
		String id = dao.selectID(email, tel);
		//request.setAttribute("id", id);
		
		
		if(id != null){ 
			id = id.substring(0, id.length() -2);
			request.setAttribute("id", id);
			return new ActionForward();
		}else {
			String msg = "정보에 맞는 id가 없습니다.";
			String url = "idForm.me";
			request.setAttribute("msg", msg);
			request.setAttribute("url",  url);
			return new ActionForward(false, "../alert.jsp");
		}
	
		
		
	}

}
