package ljh.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import ljh.member.model.InterMemberDAO;
import ljh.member.model.MemberDAO;
import member.model.MemberVO;

public class DeleteMemberAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		
		String method = request.getMethod();
		
		if("get".equalsIgnoreCase(method)) {	//회원탈퇴 사이드탭을 눌러서 들어온 경우
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/ljh.memberEdit/deleteMember.jsp");
		}
		
		// 같은 페이지에서 회원탈퇴하기 버튼을 누른 경우
		else if("post".equalsIgnoreCase(method)) {
			// 이 경우는 체크박스도 누르고 비밀번호도 공백이 아니다.

			
			String inputPwd = request.getParameter("passwd");
			
			HttpSession session = request.getSession();
			//세션에서 로그인된 아이디 가져오기
			MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
			

			
			// 입력받은 비밀번호를 넘겨서 
			//String originPwd = mdao.checkPasswd(inputPwd);
			String originPwd = loginuser.getPwd();
			
			
			
			if( !originPwd.equals(inputPwd)) {// 입력된 비밀번호가 다르면
				
				String message = "비밀번호가 일치하지 않습니다.";
				String loc ="javascript:history.back()";
				
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/msg.jsp");
				
			}
			else {
				InterMemberDAO mdao = new MemberDAO();
				
				int n = mdao.deleteMember(loginuser.getUserid());
				
				//정답이면 status를 바꾸고, 메인화면으로 바꾸고, session에 있는 로그인된 유저 값을 비운다.
				
				
				if(n==1) {//status가 1에서 0으로 변경됨
					
					//sessionScope에 있는 로그인 유저 없애고 메인페이지로 이동
					session.invalidate();
					//System.out.println(loginuser.getUserid());
					//근데 이거 왜... 계속 나오냐
					
					String message = "탈퇴 완료 되었습니다.";
					String loc =request.getContextPath()+"/index.go";
					
					request.setAttribute("message", message);
					request.setAttribute("loc", loc);
					
					super.setRedirect(false);
					super.setViewPage("/WEB-INF/msg.jsp");
				}
				
				else {
					String message = "탈퇴가 진행되지 않았습니다.";
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
