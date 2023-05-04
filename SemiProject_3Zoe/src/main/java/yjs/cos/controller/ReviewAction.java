package yjs.cos.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class ReviewAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String courseCode = request.getParameter("courseCode");
		
		request.setAttribute("courseCode", courseCode);
		
		super.setRedirect(false); 
		
		super.setViewPage("/WEB-INF/yjs.cos/ReviewRegister.jsp");
		
	}

}
