package pes.admin.controller;

import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import ljh.order.model.OrderVO;
import member.model.MemberVO;
import pes.orderList.model.InterOrderListDAO;
import pes.orderList.model.OrderListDAO;

public class OrderListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		if(loginuser != null && loginuser.getUserid().equals("testadmin")) {
			// 관리자 로그인일 경우
			InterOrderListDAO odao = new OrderListDAO();
			
			List<OrderVO> orderList = odao.getOrderList();
			
			request.setAttribute("orderList", orderList);

			super.setRedirect(false); 
			super.setViewPage("/WEB-INF/pes.admin/orderList.jsp");
	
		}
		
		else {
			// 로그인 안 한 경우 또는 일반회원 로그인일 경우
			String message = "※ 관리자만 접근 가능합니다. ※";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false); 
			super.setViewPage("/WEB-INF/msg.jsp");
			
		}
		
		
	}

}
