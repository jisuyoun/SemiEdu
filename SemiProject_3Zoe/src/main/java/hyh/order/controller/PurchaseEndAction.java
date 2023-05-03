package hyh.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.MemberVO;

public class PurchaseEndAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		String courseCode = request.getParameter("courseCode");
		String courseName = request.getParameter("courseName");
		String salePrice = request.getParameter("salePrice");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String mobile = request.getParameter("mobile");
		
		System.out.println(courseCode);
		System.out.println(courseName);
		System.out.println(salePrice);
		System.out.println(email);
		System.out.println(name);
		System.out.println(mobile);
		
		request.setAttribute("courseName", courseName);
		request.setAttribute("courseCode", courseCode);
		request.setAttribute("salePrice", salePrice);
		request.setAttribute("email", email);
		request.setAttribute("name", name);
		request.setAttribute("mobile", mobile);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/hyh.order/paymentGateway.jsp");
	}

}
