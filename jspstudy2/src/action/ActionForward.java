package action;

public class ActionForward {
	private boolean redirect;
	private String view;
	
	public ActionForward() {}
	public ActionForward(boolean redirect, String view) {
		this.redirect = redirect;
		this.view = view;
	}
	// setter, getter
	public boolean isRedirect() { // 리턴값이 boolean get메서드 is 로 시작 
		return redirect;
	}
	public void setRedirect(boolean redirect) {
		this.redirect = redirect;
	}
	public String getView() {
		return view;
	}
	public void setView(String view) {
		this.view = view;
	}
	

	
	
	
}
