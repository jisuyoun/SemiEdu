package hyh.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import cos.model.CosDAO;
import cos.model.CosVO;
import cos.model.InterCosDAO;
import member.model.MemberVO;


public class PaymentAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		
		
		//super.setRedirect(false);
		//super.setViewPage("/WEB-INF/hyh.order/payment.jsp");
		
		String courseCode = request.getParameter("courseCode");
		
		InterCosDAO cdao = new CosDAO();
		
		//HttpSession session = request.getSession();
		//MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		// 제품번호를 가지고서 해당 제품의 정보를 조회해오기
		CosVO cvo = cdao.selectOneProductByCourseCode(courseCode);
		//합격

		
		if(cvo == null) {
			// GET방식이므로 사용자가 웹브라우저 주소창에 장난하는 것을 막는 것
			
			String message = "잘못된 접근입니다.";
	        String loc = "javascript:history.back()";
	         
	        request.setAttribute("message", message);
	        request.setAttribute("loc", loc);
	         
	        //super.setRedirect(false);
	        super.setViewPage("/WEB-INF/msg.jsp");

		}
		
		else {
			// 제품이 있는 경우
			request.setAttribute("cvo", cvo); // 제품의 정보
			//request.setAttribute("loginuser", loginuser);
			
			//super.setRedirect(false);
	        super.setViewPage("/WEB-INF/hyh.order/payment.jsp");
		}
		
		
	}

}
