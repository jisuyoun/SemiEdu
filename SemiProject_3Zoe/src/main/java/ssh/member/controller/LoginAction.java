package ssh.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.*;
import ssh.member.model.InterMemberDAO;
import ssh.member.model.MemberDAO;


public class LoginAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		
		if("GET".equalsIgnoreCase(method)) {
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/ssh.login/login.jsp");
		}
		
		else {
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		
		// ==> 클라이언트의 IP 주소를 알아오는 것 <==
		String logip = request.getRemoteAddr();
		
		Map<String, String> paraMap = new HashMap<>();
		
		paraMap.put("userid", userid);
		paraMap.put("pwd", pwd);
		paraMap.put("logip", logip);
		
		InterMemberDAO mdao = new MemberDAO();
		
		MemberVO loginuser = mdao.selectOneMember(paraMap);
		
		if(loginuser != null) {
			
			if(loginuser.getIdle() == 1) {
				
				String lastLogdate = loginuser.getLastLogdate().substring(0,10);
				int lastLoginyear = Integer.parseInt(lastLogdate.substring(0, 4));
				int idleyear = lastLoginyear + 1;
				String idleDate = idleyear+lastLogdate.substring(4);
				
				request.setAttribute("userid", loginuser.getUserid());
				request.setAttribute("email", loginuser.getEmail());
				request.setAttribute("lastLogdate", lastLogdate);
				request.setAttribute("idleDate", idleDate);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/ssh.login/sleeperAccount.jsp");
				
				return; // 메소드종료 
				
			}

			
			// 로그인 성공 시 
			// System.out.println(">>> 확인용 로그인한 사용자명 : " + loginuser.getName());
			
			HttpSession session = request.getSession();
			session.setAttribute("loginuser", loginuser);
			
			
			// 비밀번호를 변경한지 3개월이 지났을 경우 
			if(loginuser.isRequirePwdChange() == true) {
				
				request.setAttribute("userid", loginuser.getUserid());
				
				// 비밀번호 변경 페이지로 이동
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/ssh.login/pwdChange.jsp");
				
				return;
			}
			else {
				// 비밀번호를 변경한지 3개월 이내인 경우
				
				// 페이지 이동을 시킨다.
				super.setRedirect(true);
				super.setViewPage(request.getContextPath()+"/index.go");
				
				}
			
			
		}
		else {
			String message = "로그인 실패!! 아이디, 비밀번호를 확인하세요!!";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
		}
		
	  }	
	  
	}
}
