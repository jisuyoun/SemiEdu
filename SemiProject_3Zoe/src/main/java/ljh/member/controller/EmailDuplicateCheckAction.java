package ljh.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import ljh.member.model.*;


public class EmailDuplicateCheckAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
	
		String method = request.getMethod();
		//get 또는 post
		
		if("post".equalsIgnoreCase(method)) {
			//post 방식일 때만 동작
			
			String email = request.getParameter("email");
			//System.out.println("확인용 email =>"+email);
			//확인용 email =>leess.
			// 이제 이걸 DB로 가져가서 중복된 값이 있는지 확인
			
			InterMemberDAO mdao = new MemberDAO();
			boolean isExists = mdao.emailDuplicateCheck(email);
			//true 또는 false
			
			JSONObject jsonObj = new JSONObject();	//{}
			jsonObj.put("isExists",isExists);	//{"isExists":true} 또는
												//{"isExists":false}
			
			
			String json = jsonObj.toString();	//문자열 형태인 "{"isExists":true}" 또는 "{"isExists":false}" 으로 만들어준다.
			//System.out.println(">>> 확인용 json => "+json);
			//	leess 입력했을 때 			>>> 확인용 json => {"isExists":true}
			// 이미 있으면 true, 없으면 false
			
			request.setAttribute("json", json);
			//이걸 다른 페이지에 보내려고.
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/jsonview.jsp");
			//중복결과 검사.
		}
		
	}

}
