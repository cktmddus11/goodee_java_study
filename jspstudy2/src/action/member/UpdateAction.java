package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model.Member;
import model.MemberDao;

/*
   1. 모든 파라미터 Member 객체에 저장
  2. 입력된 비밀번호와 db에 저장된 비밀번호가 같지 않으면
  	"비밀번호가 틀렸습니다". 메시지 출력 후, updateForm.me페이지로 이동
  3.  1번에 내용을 db에 수정하기
  		int MemberDao.update(Member) 
  		결과가 0보다 크면 수정성공 메시지 출력. info.me 페이지 이동 
  					0 이하면 수정 실패 메시지 출력. main.me 페이지 이동
*/
public class UpdateAction extends UserLoginAction {

	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {
		Member mem = new Member();
		mem.setId(request.getParameter("id"));
		mem.setPass(request.getParameter("pass"));
		mem.setName(request.getParameter("name"));
		mem.setGender(Integer.parseInt(request.getParameter("gender")));
		mem.setTel(request.getParameter("tel"));
		mem.setEmail(request.getParameter("email"));
		mem.setPicture(request.getParameter("picture"));
		
		MemberDao dao = new MemberDao();
		Member m = dao.selectOne(id);
		String msg = null;
		String url = null;
		if(request.getParameter("pass").equals(m.getPass())) {
			if(dao.update(mem)>0) {
				msg = "수정성공";
				url = "info.me?id="+id;
			}else {
				msg = "수정실패";
				url = "main.me";
			}
		}else {
			msg = "비밀번호가 틀렸습니다.";
			url = "updateForm.me?id="+id; // admin인데 다른사람 수정 가능해야하니까 id로 
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}



}
