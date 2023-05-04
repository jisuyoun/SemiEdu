package ljh.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import cos.model.CosVO;
import ljh.member.model.InterMemberDAO;
import ljh.member.model.MemberDAO;
import ljh.order.model.InterOrderDAO;
import ljh.order.model.OrderDAO;
import ljh.order.model.OrderVO;
import member.model.MemberVO;

public class PayDetailtAction extends AbstractController {

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
		
			InterOrderDAO odao = new OrderDAO();
			
			
			// 로그인한 사람의 구매리스트 가져오기
			List<OrderVO> orderList= odao.getOrderList(loginuser.getUserid());
			
			// jsp로 넘긴다.
			request.setAttribute("orderList", orderList);
			
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/ljh.myPage/payDetail.jsp");
		}
	}

}
