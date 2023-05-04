package hyh.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.MemberVO;

public class PurchaseEndAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String courseCode = request.getParameter("courseCode");
		String courseName = request.getParameter("courseName");
		String salePrice = request.getParameter("salePrice");
		
		request.setAttribute("courseCode", courseCode);
		request.setAttribute("courseName", courseName);
		request.setAttribute("salePrice", salePrice);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/hyh.order/paymentGateway.jsp");
	}

}
