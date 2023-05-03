package ssh.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import ssh.member.model.InterMemberDAO;
import ssh.member.model.MemberDAO;

public class PwdChangeAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		
		String userid = request.getParameter("userid");
		
		if("POST".equalsIgnoreCase(method)) {
			// 암호 변경하기 버튼을 클릭한 경우
			
			String pwd = request.getParameter("pwd");
			
			Map<String, String> paraMap = new HashMap<>();
			paraMap.put("pwd", pwd);
			paraMap.put("userid", userid);
						
			InterMemberDAO mdao = new MemberDAO();
			int n = mdao.pwdUpdate(paraMap);
			
		//	System.out.println(" n 확인용 : " + n);
			
			request.setAttribute("n", n);
			
		}
		
		request.setAttribute("method", method);
		request.setAttribute("userid", userid);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/ssh.login/pwdChangeEnd.jsp");
		
	}

}
