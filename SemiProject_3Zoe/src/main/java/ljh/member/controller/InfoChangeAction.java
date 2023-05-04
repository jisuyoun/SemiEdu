package ljh.member.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import ljh.member.model.InterMemberDAO;
import ljh.member.model.MemberDAO;
import member.model.MemberVO;

public class InfoChangeAction extends AbstractController {

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
			String method = request.getMethod();
			
			// 이 방법으로는 들어올 수 없다
			if("get".equalsIgnoreCase(method)) {
				String message = "잘못된 접근입니다.";
				String loc =request.getContextPath()+"/index.go";
				
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/msg.jsp");
			}
			
			
			// post 방식. 즉 변경하기를 누른 경우
			else {
				String email = request.getParameter("email");
				String checkEmail = request.getParameter("emailChk");
				// 0:거부 1:동의
				String mobile = request.getParameter("phone1")+request.getParameter("phone2")+request.getParameter("phone3");
				//01012345678 형식
				String checkMobile = request.getParameter("phoneChk");
				
				String postcode = request.getParameter("postcode");
				String address = request.getParameter("address");
				String detailAdress = request.getParameter("detailAdress");
				
				/*
				 * System.out.println(email); System.out.println(checkEmail);
				 * System.out.println(mobile); System.out.println(checkMobile);
				 * System.out.println(postcode); System.out.println(address);
				 * System.out.println(detailAdress);
				 */
				
				
				
				InterMemberDAO mdao = new MemberDAO();
				Map<String,String> paraMap = new HashMap<>();
				
				
				 paraMap.put("email", email);
				 paraMap.put("checkEmail", checkEmail);
				 paraMap.put("mobile", mobile); 
				 paraMap.put("checkMobile", checkMobile);
				 paraMap.put("postcode", postcode);
				 paraMap.put("address", address);
				 paraMap.put("detailAdress", detailAdress);
				 
				
				
				// 로그인된 아이디와 변경할 정보들을 넘긴다.
				int result = mdao.infoChange(loginuser.getUserid(),paraMap);
				
				
				// 정보 업데이트 성공
				if(result == 1) {
					String message = "정보수정이 완료되었습니다.";
					String loc =request.getContextPath()+"/index.go";
					session.removeAttribute("loginuser");
					
					request.setAttribute("message", message);
					request.setAttribute("loc", loc);
					
					super.setRedirect(false);
					super.setViewPage("/WEB-INF/msg.jsp");
				}
				
				// 정보 업데이트 실패
				else {
					String message = "정보수정이 실패했습니다.";
					String loc ="javascript:history.back()";
					
					request.setAttribute("message", message);
					request.setAttribute("loc", loc);
					
					super.setRedirect(false);
					super.setViewPage("/WEB-INF/msg.jsp");
				}
				
			}
			
		}
	}

}
