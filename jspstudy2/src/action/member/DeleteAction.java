package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model.Member;
import model.MemberDao;
/* 
 * 1. 로그아웃 상태 : 로그인하세요 메시지 출력, loginForm.jsp 페이지 이동 -- 상속받으면 알아서 해결
  2. 	로그인 상태 
  		- 관리자가 아니고, id와 login 이 다른 경우 
  				"본인만 탈퇴가 가능합니다." 메시지 출력. main.jsp 페이지로 이동   -- 상속받으면 알아서 해결
  		--------------------------------------
  		1. - id가 관리자인 경우는 
  				"관리자는 탈퇴가 불가능합니다." 메시지 출력. list.jsp 페이지로 이동 
  				
  		2. - 탈퇴 조건
  		입력된 비밀번호 db의 비밀번호 검증
  			- 관리자가 아니면서 비밀번호 불일치
  				"비밀번호가 틀립니다." 메시지 출력 deleteForm.me 페이지로 이동
  		3. 관리자 로그인, 또는 비밀번호 일치하는 경우 db에서 회원정보 삭제하기
  			삭제 성공 : 일반 사용자 : 로그아웃 후, 탈퇴 메시지 출력, loginForm.me 로 페이지 이동
  							관리자 : 탈퇴메시지 출력, list.me로 이동
  			삭제 실패 : 일반 사용자 : 삭제 실패 메시지 출력. info.me 페이지로 이동
  							관리자 : 삭제 실패 메시지 출력. list.me 페이지 이동
   				
 * 
 * */
public class DeleteAction extends UserLoginAction{
	
	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {
		  String pass = request.getParameter("pass");
		  String url = null;
		  String msg = null;
		  
		  	
		 if(id.equals("admin")){ // 탈퇴대상이 되는 회원은 관리자 안됨
			  msg = "관리자는 탈퇴할 수 없습니다.";
			  url = "list.jsp";
		  }else{  // 비밀번호 검증
			  MemberDao dao = new MemberDao();
			  Member mem = dao.selectOne(id);
			  if(login.equals("admin") || pass.equals(mem.getPass())){
				  // 이거 순서 중요 앞에께 맞으면 뒤에꺼 보지도 않음 
				  // 관리자인 경우 비밀번호검증이 앞에있으면 nullpointerexception이 발생하니까
				  // admin 먼저 검증
				  if(dao.delete(id) > 0){ // 삭제 성공
					  if(login.equals("admin")){ // 관리자인 경우
						  msg = id + "사용자를 강제 탈퇴 성공";
						  url = "list.me";
					  }else{ // 일반사용자인 경우 
						 msg = id+"님의 회원 탈퇴가 완료되었습니다.";
					  	url = "loginForm.me";
					  	request.getSession().invalidate();
					  }
				  }else{  // 삭제 실패
					  msg = id + "님의 탈퇴중 오류발생.";
					  if(login.equals("admin")) { // 관리자인 경우 
						  url = "list.me";
					  }else{
						  url = "info.me?id="+id;
					  }
				  }
			  }else{ // 관리자가 아니면서 비밀번호가 틀렸을때
				  msg = id + "님의 비밀번호가 틀립니다.";
				  url = "deleteForm.me?id="+id;
			  }
		  }
		 request.setAttribute("msg", msg);
		 request.setAttribute("url", url);
		 return new ActionForward(false, "../alert.jsp");
		 
	}

}
