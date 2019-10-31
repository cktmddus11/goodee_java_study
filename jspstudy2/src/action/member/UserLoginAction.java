package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;

public abstract class UserLoginAction implements Action {
	protected String login; // �α��� ����
	protected String id; // �Ķ���� ���� - ��Ӱ������ٰ���

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		login = (String) request.getSession().getAttribute("login");
		id = request.getParameter("id");
		
		if(login == null || login.trim().equals("")) { // �α��� �ȵ�������
			request.setAttribute("msg", "�α��� �� �ŷ��ϼ���.");
			request.setAttribute("url", "loginForm.me");
			return new ActionForward(false, "../alert.jsp"); 
			// MainAction �� �� Ŭ���� ��ӹ޾Ƽ� ��Ŭ������ ���� �����
			// �������� ���⼭ �ɷ��� doExecute�� ���� �ȵ�?
		}else { // �α��� �������� 
			if(!login.equals("admin") && id != null && !login.equals(id)) { // �α��������� admin�� �ƴϸ鼭 �α��������� �Ķ���� ������ ��ġ���� ������
				request.setAttribute("msg", "���θ� �����մϴ�.");
				request.setAttribute("url",  "main.me");
				return new ActionForward(false, "../alert.jsp");
			}
		}
		// ���� ���ǹ� �� �ƴϸ� �α��λ��¿��߸� MainAction Ŭ������ doExecute�޼���ȣ���
		return doExecute(request, response);
	}

	protected abstract ActionForward doExecute(HttpServletRequest request, HttpServletResponse response);

}
