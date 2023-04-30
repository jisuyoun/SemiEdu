package ssh.member.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import member.model.MemberVO;
import ssh.member.model.*;


public class MemberRegisterAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		
		if("GET".equalsIgnoreCase(method)) {
			super.setRedirect(false);   // isRedirect ==> false 
			// 여기서는 회원가입 후 다시 회원가입을 눌렀을때의 404 오류를 방지하기 위해 super.setRedirect(false);를 생략하면 안된다. 
			super.setViewPage("/WEB-INF/ssh.member/join.jsp");
			// super를 써도 되고 this를 써도 됨 똑같음
		}
		else {
			String name = request.getParameter("name");
			String userid = request.getParameter("userid");
			String pwd = request.getParameter("pwd");
			String email = request.getParameter("email");
			String mobile1 = request.getParameter("mobile1");
			String mobile2 = request.getParameter("mobile2");
			String mobile3 = request.getParameter("mobile3");
			
			String mobile = mobile1+mobile2+mobile3;
			
			MemberVO member = new MemberVO(name, userid, pwd, email, mobile);
		
			String message = "";
			String loc = "";
			
			try {
				InterMemberDAO mdao = new MemberDAO();
				int n = mdao.registerMember(member);
				
				if(n==1) {
					message = "회원가입 성공";
					loc = request.getContextPath()+"/index.up"; // 시작페이지로 이동한가.
				}
			} catch(SQLException e) {
				message = "SQL구문 오류발생";
				loc = "javascript:history.back()";  //자바스크립트를 이용한 이전 페이지로
				e.printStackTrace();		
			}
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
	   	
		}
		
	}

}
