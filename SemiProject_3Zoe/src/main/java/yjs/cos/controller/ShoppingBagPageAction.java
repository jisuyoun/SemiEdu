package yjs.cos.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class ShoppingBagPageAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		
		String courseCode = request.getParameter("courseCode");
		System.out.println(courseCode);
		
		String userid = request.getParameter("userid");
		System.out.println(userid);
		
		
		
		super.setRedirect(false); 
		
		super.setViewPage("/WEB-INF/yjs.cos/yjs_ShoppingBagPage.jsp");
		
		
	}

}
