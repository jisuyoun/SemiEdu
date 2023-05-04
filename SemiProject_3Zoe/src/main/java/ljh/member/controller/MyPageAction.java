package ljh.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import ljh.member.model.InterMemberDAO;
import ljh.member.model.MemberDAO;
import member.model.MemberVO;

public class MyPageAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		//세션에서 로그인된 아이디 가져오기
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		if(loginuser == null) {
			String message = "로그인을 하세요";
			String loc =request.getContextPath()+"/index.go";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
		}
		
		
		else {
			InterMemberDAO mdao = new MemberDAO();
			
			// 로그인된 회원의 위시리스트 갯수 가져오기
			int count = mdao.wishListCount(loginuser.getUserid());
			
			request.setAttribute("count", count);
	
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/ljh.myPage/myPage.jsp");
		}
	}

}
