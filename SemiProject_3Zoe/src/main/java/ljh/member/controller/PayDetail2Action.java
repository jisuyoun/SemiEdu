package ljh.member.controller;

import java.util.*;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import ljh.order.model.InterOrderDAO;
import ljh.order.model.OrderDAO;
import ljh.order.model.OrderVO;
import member.model.MemberVO;

public class PayDetail2Action extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		//세션에서 로그인된 아이디 가져오기
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		if(loginuser.getUserid() == "") {
			String message = "로그인을 하세요";
			String loc =request.getContextPath()+"/index.go";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
		}
		
		
		else {
			InterOrderDAO odao = new OrderDAO();
			
			
			String orderCode = request.getParameter("orderCode");
			
			Map<String,String> paraMap = new HashMap<>();
			paraMap.put("orderCode", orderCode);
			paraMap.put("userid", loginuser.getUserid());
			
			// 로그인한 사람이 선택한 구매리스트 가져오기
			OrderVO order= odao.getOrder(paraMap);
			
			// 로그인한 사람이 선택한 구매 상세 목록 가져오기
			List<OrderVO> orderDetailList = odao.getOrderDetail(paraMap);
			
			
			// jsp로 넘긴다.
			request.setAttribute("order", order);
			request.setAttribute("orderDetailList", orderDetailList);
			
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/ljh.myPage/payDetail2.jsp");
			
		}
	}

}
