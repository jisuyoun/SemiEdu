package ljh.member.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import ljh.member.model.InterMemberDAO;
import ljh.member.model.MemberDAO;
import member.model.MemberVO;

public class PasswdChangeAction extends AbstractController {

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
			
			
			// 사이드탭에 있는 비밀번호 수정으로 들어온 경우
			if("get".equalsIgnoreCase(method)) {
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/ljh.memberEdit/passwdChange.jsp");
			}
			
			
			//변경하기 버튼을 누른 경우
			else if("post".equalsIgnoreCase(method)){
				//비밀번호를 확인하세요. 신규비밀번호가 서로 일치하지 않습니다. 비밀번호는 영문, 숫자, 특수문자 조합 8자 이상 입력하세요.
				//originPasswd newPasswd checkPasswd
				
				
				String originPasswd = request.getParameter("originPasswd");
				String newPasswd = request.getParameter("newPasswd");
				
				
				InterMemberDAO mdao = new MemberDAO();
				Map<String,String> paraMap = new HashMap<>();
		
				paraMap.put("userid", loginuser.getUserid());
				paraMap.put("passwd",originPasswd );
				
				boolean isCheck = mdao.checkPasswd(paraMap);
				
				
				//기존 비밀번호와 다른 것을 입력 했으면
				if(!isCheck) {
					String message = "기존 비밀번호가 일치하지 않습니다.";
					String loc ="javascript:history.back()";
					
					request.setAttribute("message", message);
					request.setAttribute("loc", loc);
					
					super.setRedirect(false);
					super.setViewPage("/WEB-INF/msg.jsp");
				}
				
				// 기본 비밀번호를 잘 입력했으면 비밀번호를 바꿔준다.
				else {
					Map<String,String> map = new HashMap<>();
					map.put("userid", loginuser.getUserid());
					map.put("passwd",newPasswd );
					
					// 로그인된 아이디와 새로운 비밀번호를 넘겨서 업데이트 해준다.
					int n = mdao.changePasswd(map);
					
					if(n==1) {
					
						String message = "비밀번호 변경이 완료되었습니다.";
						String loc =request.getContextPath()+"/index.go";
						
						session.removeAttribute("loginuser");
						
						request.setAttribute("message", message);
						request.setAttribute("loc", loc);
						
						super.setRedirect(false);
						super.setViewPage("/WEB-INF/msg.jsp");
					}
					
					else {
						String message = "비밀번호가 변경되지 않았습니다.";
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

}
