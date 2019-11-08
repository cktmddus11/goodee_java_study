package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model.Member;
import model.MemberDao;
/* 
 * 1. �α׾ƿ� ���� : �α����ϼ��� �޽��� ���, loginForm.jsp ������ �̵� -- ��ӹ����� �˾Ƽ� �ذ�
  2. 	�α��� ���� 
  		- �����ڰ� �ƴϰ�, id�� login �� �ٸ� ��� 
  				"���θ� Ż�� �����մϴ�." �޽��� ���. main.jsp �������� �̵�   -- ��ӹ����� �˾Ƽ� �ذ�
  		--------------------------------------
  		1. - id�� �������� ���� 
  				"�����ڴ� Ż�� �Ұ����մϴ�." �޽��� ���. list.jsp �������� �̵� 
  				
  		2. - Ż�� ����
  		�Էµ� ��й�ȣ db�� ��й�ȣ ����
  			- �����ڰ� �ƴϸ鼭 ��й�ȣ ����ġ
  				"��й�ȣ�� Ʋ���ϴ�." �޽��� ��� deleteForm.me �������� �̵�
  		3. ������ �α���, �Ǵ� ��й�ȣ ��ġ�ϴ� ��� db���� ȸ������ �����ϱ�
  			���� ���� : �Ϲ� ����� : �α׾ƿ� ��, Ż�� �޽��� ���, loginForm.me �� ������ �̵�
  							������ : Ż��޽��� ���, list.me�� �̵�
  			���� ���� : �Ϲ� ����� : ���� ���� �޽��� ���. info.me �������� �̵�
  							������ : ���� ���� �޽��� ���. list.me ������ �̵�
   				
 * 
 * */
public class DeleteAction extends UserLoginAction{
	
	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {
		  String pass = request.getParameter("pass");
		  String url = null;
		  String msg = null;
		  
		  	
		 if(id.equals("admin")){ // Ż������ �Ǵ� ȸ���� ������ �ȵ�
			  msg = "�����ڴ� Ż���� �� �����ϴ�.";
			  url = "list.jsp";
		  }else{  // ��й�ȣ ����
			  MemberDao dao = new MemberDao();
			  Member mem = dao.selectOne(id);
			  if(login.equals("admin") || pass.equals(mem.getPass())){
				  // �̰� ���� �߿� �տ��� ������ �ڿ��� ������ ���� 
				  // �������� ��� ��й�ȣ������ �տ������� nullpointerexception�� �߻��ϴϱ�
				  // admin ���� ����
				  if(dao.delete(id) > 0){ // ���� ����
					  if(login.equals("admin")){ // �������� ���
						  msg = id + "����ڸ� ���� Ż�� ����";
						  url = "list.me";
					  }else{ // �Ϲݻ������ ��� 
						 msg = id+"���� ȸ�� Ż�� �Ϸ�Ǿ����ϴ�.";
					  	url = "loginForm.me";
					  	request.getSession().invalidate();
					  }
				  }else{  // ���� ����
					  msg = id + "���� Ż���� �����߻�.";
					  if(login.equals("admin")) { // �������� ��� 
						  url = "list.me";
					  }else{
						  url = "info.me?id="+id;
					  }
				  }
			  }else{ // �����ڰ� �ƴϸ鼭 ��й�ȣ�� Ʋ������
				  msg = id + "���� ��й�ȣ�� Ʋ���ϴ�.";
				  url = "deleteForm.me?id="+id;
			  }
		  }
		 request.setAttribute("msg", msg);
		 request.setAttribute("url", url);
		 return new ActionForward(false, "../alert.jsp");
		 
	}

}
