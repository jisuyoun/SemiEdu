package ljh.member.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import common.controller.AbstractController;
import ljh.member.model.InterMemberDAO;
import ljh.member.model.MemberDAO;
import member.model.MemberVO;

public class DeleteWishListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String method = request.getMethod();
		
		if("post".equalsIgnoreCase(method)) {
			
			InterMemberDAO mdao = new MemberDAO();
			
			HttpSession session = request.getSession();
			//세션에서 로그인된 아이디 가져오기
			MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
			
			String courseCode = request.getParameter("courseCode");
			
			Map<String,String> paraMap = new HashMap<>();
			paraMap.put("courseCode", courseCode);
			paraMap.put("userid", loginuser.getUserid());
			
			// 클릭한 강의를 위시리스트에서 삭제한다.
			int result = mdao.deleteWishList(paraMap);
			
			// 삭제성공
			if(result == 1) {
				
				JSONObject jsonObj = new JSONObject();	//{}
				jsonObj.put("deleteWish",result);	//{"isExists":true} 또는
													//{"isExists":false}
				
				
				String json = jsonObj.toString();
				
				request.setAttribute("json", json);
				//이걸 다른 페이지에 보내려고.
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/jsonview.jsp");
				//중복결과 검사.
			}
			
		}
		
	}

}
