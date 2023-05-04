package ljh.member.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import cos.model.CosVO;
import ljh.member.model.InterMemberDAO;
import ljh.member.model.MemberDAO;
import member.model.MemberVO;

public class WishListAction extends AbstractController {

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
			
			
			// 로그인한 사람의 위시리스트 가져오기
			List<CosVO> cosList= mdao.getWishList(loginuser.getUserid());
			
	
			// jsp로 넘긴다.
			request.setAttribute("cosList", cosList);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/ljh.myPage/wishList.jsp");
			
		}
	}

}
