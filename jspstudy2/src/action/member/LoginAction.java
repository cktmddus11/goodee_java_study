package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model.Member;
import model.MemberDao;
/*
 * 1. id, pass �Ķ���� ����
 * 2. id �ش��ϴ� ������ db�ּ� ��ȸ
 * 		- �����ϸ� ��й�ȣ Ȯ��
 * 		- �������� ������ id���� �޽����� ����ϰ� LoginForm.me �������� �̵�
 * 3. id �����ϸ� ��й�ȣ ����
 * 		- ��й�ȣ�� �´� ��� : session �α��� ���� ����
 * 											�α��� ���� �޽��� ���, main.me �������� �̵�
 * 		- ��й�ȣ�� Ʋ����� : �α��� ���� �޽����� ���, loginForm.me �������� �̵� 
 *  
 *  
 *  */
public class LoginAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String msg = "�ش��ϴ� id�� �������� �ʽ��ϴ�. ";
		String url = "loginForm.me";
		
		Member mem = new MemberDao().selectOne(id);
		if(mem != null) { // id�� �����ϸ�
			if(pass.equals(mem.getPass())) { // �Է��� ��й�ȣ�� db��й�ȣ��������
				request.getSession().setAttribute("login", id); // session�� �ڹ��� ���尴ü�� �ƴϰ� jsp�� ���尴ü? 
				msg = mem.getName() + "���� �α����ϼ̽��ϴ�.";
				url = "main.me";
			}else {// �Է��� ��й�ȣ�� db��й�ȣ�� �ٸ���
				msg = "��й�ȣ�� Ʋ���ϴ�.";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
		
	}
}
