package hyh.order.controller;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import hyh.member.model.InterMemberDAO;
import hyh.member.model.MemberDAO;
import member.model.MemberVO;



public class GoUpdateLoginUserAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		
		
		if("POST".equalsIgnoreCase(method)) {
			// POST 방식이라면
			
			String userid = request.getParameter("userid");
			String salePrice = request.getParameter("salePrice");
			
			Map<String, String> paraMap = new HashMap<>();
			paraMap.put("userid", userid);
			paraMap.put("salePrice", salePrice);
			
			InterMemberDAO mdao = new MemberDAO();
			int n = mdao.pointUpdate(paraMap);	// DB에 포인트 증가하기
			
			String message = "";
		    String loc = "";
		    
		    if(n==1) {
		    	
		    	HttpSession session = request.getSession();
		    	MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		    	
		    	// !!! 세션값을 변경하기 !!! //
		    	loginuser.setPoint(loginuser.getPoint() + (int)(Integer.parseInt(salePrice)*0.01));
		    	
		    	DecimalFormat df = new DecimalFormat("#,###");
	            System.out.println(df.format(df.format(n)));
	            // "2,005,100"
		    	
		    	message = loginuser.getName()+"님의 "+ df.format(Long.parseLong(salePrice)) +"원 결제가 완료되었습니다.";
			    loc = request.getContextPath()+"/index.go";
		    }
		    else {
		    	message = "코인액 결제가 실패되었습니다.";
			    loc = "javascript:history.back()";
		    }
		    
		    request.setAttribute("message", message);
		    request.setAttribute("loc", loc);
		      
		    super.setRedirect(false);
		    super.setViewPage("/WEB-INF/msg.jsp");
		    
		}
		else {
			// POST 방식이 아니라면
		      String message = "비정상적인 경로로 들어왔습니다.";
		      String loc = "javascript:history.back()";
		      
		      request.setAttribute("message", message);
		      request.setAttribute("loc", loc);
		      
		      super.setRedirect(false);
		      super.setViewPage("/WEB-INF/msg.jsp");
		}
		
	}

}
