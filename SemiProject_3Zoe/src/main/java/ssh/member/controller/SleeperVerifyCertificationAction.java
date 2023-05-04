package ssh.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import ssh.member.model.InterMemberDAO;
import ssh.member.model.MemberDAO;

public class SleeperVerifyCertificationAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String method = request.getMethod();
	
		if("POST".equalsIgnoreCase(method)) {	
			String userCertificationCode = request.getParameter("userCertificationCode");
			String userid = request.getParameter("userid");
			String logip = request.getRemoteAddr();
			
			HttpSession session = request.getSession(); // 세션불러오기
			String certificationCode = (String)session.getAttribute("certificationCode");
			
			String message = "";
			String loc = "";
			
			if( certificationCode.equals(userCertificationCode)) {
				
				// idle 칼럼 상태 update하기
				InterMemberDAO mdao = new MemberDAO();
				int n = mdao.activateMember(userid, logip);
				
				if(n==1) {
					
					message = "휴먼상태가 해제되었습니다. 다시 로그인 하세요.";
					loc = request.getContextPath()+"/login/login.go";
					
					request.setAttribute("message", message);
					request.setAttribute("loc", loc);
					
					super.setRedirect(false);
					super.setViewPage("/WEB-INF/msg.jsp");
					
					session.invalidate();
			
				}
				else {
					loc = request.getContextPath()+"/error.go";
					
					request.setAttribute("message", message);
					request.setAttribute("loc", loc);
					
					super.setRedirect(false);
					super.setViewPage("/WEB-INF/msg.jsp");
				}
			}
			// 인증코드 불일치시
			else {
				String email = request.getParameter("email");
				String lastLogdate = request.getParameter("lastLogdate");
				String idleDate = request.getParameter("idleDate");
				
				request.setAttribute("userid", userid);
				request.setAttribute("email", email);
				request.setAttribute(lastLogdate, lastLogdate);
				request.setAttribute(idleDate, idleDate);
				
				// 인증창으로 다시 돌아간다.
				super.setViewPage("/WEB-INF/ssh.login/sleeperAccount.jsp");
				
				
				return;
				
			}
			
		
		}
	}		
}
