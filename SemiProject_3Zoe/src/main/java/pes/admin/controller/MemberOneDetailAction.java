package pes.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;

import member.model.*;
import pes.member.model.InterMemberDAO;
import pes.member.model.MemberDAO;

public class MemberOneDetailAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		if(loginuser != null && loginuser.getUserid().equals("testadmin")) {
		// 관리자로 로그인 했을 때만 보여지도록	
			
			String userid = request.getParameter("userid");
			InterMemberDAO mdao = new MemberDAO();
			MemberVO mvo = mdao.memberOneDetailAction(userid);
			
			request.setAttribute("mvo", mvo);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/pes.admin/memberOneDetail.jsp");
			
		}
		
		else{
			// 로그인을 안 한 경우 또는 일반사용자 로그인 한 경우
			String message = "※ 관리자만 접근 가능합니다. ※";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
		}
		
	}

}
