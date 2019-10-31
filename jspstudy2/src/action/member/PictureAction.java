package action.member;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import action.Action;
import action.ActionForward;

public class PictureAction implements Action{
// 	1. 파일 업로드 - java 영역
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String path = request.getServletContext().getRealPath("/") + "model2/member/picture";
		String fname = null;       // appliction객체 : getServletContext
		try{
			File f = new File(path);
			if(!f.exists()){ // 경로에 파일이 존재하지 않으면
				f.mkdirs(); // picture폴더 생성
			}
			MultipartRequest multi = new MultipartRequest(request, path, 10 *1024 * 1024, "euc-kr");
			fname = multi.getFilesystemName("picture"); // pictureForm name속성picture파라미터
		}catch(Exception e){
			e.printStackTrace();
		}
		request.setAttribute("fname", fname);
		return new ActionForward();
	}

}
