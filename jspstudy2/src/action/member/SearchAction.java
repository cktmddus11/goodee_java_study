package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model1.MemberDao;

public class SearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String id = request.getParameter("id");
		if(id == null) { // id찾기
			return idSearch(request, tel, email);
		}else { // id찾기 실패
			return pwSearch(request, id, tel, email);
		}
		
		
		
	}
	private ActionForward pwSearch(HttpServletRequest request,String id, String tel, String email) {
		MemberDao dao = new MemberDao();
		String pw = dao.selectPW(email, tel, id);

		if(pw == null){ //  비밀번호 찾기 실패
			String msg = "정보에 맞는 pw가 없습니다.";
			String url = "pwForm.me";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return new ActionForward(false, "../alert.jsp");
		}else {// 비밀번호 찾기 성공
			pw = pw.substring(pw.length()-2);
			request.setAttribute("pw", pw);
			System.out.println(pw);
			return new ActionForward();
		}
	}
	private ActionForward idSearch(HttpServletRequest request, String tel, String email) {
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
