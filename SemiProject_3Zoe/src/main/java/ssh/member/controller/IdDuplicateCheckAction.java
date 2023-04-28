package ssh.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import ssh.member.model.*;

public class IdDuplicateCheckAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		
		if("post".equalsIgnoreCase(method)) {
			
			String userid = request.getParameter("userid");
			
			InterMemberDAO mdao = new MemberDAO();
			boolean isExists = mdao.idDuplicateCheck(userid);
			
			JSONObject jsonObj =  new JSONObject();
			jsonObj.put("isExists", isExists);
			
			String json = jsonObj.toString();
			request.setAttribute("json", json);
			
        //	super.setRedirect(false);
			super.setViewPage("/WEB-INF/jsonview.jsp");
		}
		
	}

}
