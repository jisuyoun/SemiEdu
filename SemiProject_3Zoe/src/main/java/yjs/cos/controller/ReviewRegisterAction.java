package yjs.cos.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import cos.model.CosDAO;
import cos.model.CosVO;
import cos.model.InterCosDAO;
import cos.model.YJS_ReviewVO;

public class ReviewRegisterAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String reviewStar = request.getParameter("reviewStar");
		
		String courseCode = request.getParameter("courseCode");
		
		String userid = request.getParameter("userid");
		
		String reviewTitle = request.getParameter("reviewTitle");
		
		String review = request.getParameter("reviewContent");
		
		//System.out.println(reviewStar);
		//System.out.println(userid);
		
		YJS_ReviewVO rvo = new YJS_ReviewVO();
		
		InterCosDAO cdao = new CosDAO();
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("courseCode", courseCode);
		paraMap.put("reviewPoint", reviewStar);
		paraMap.put("userid", userid);
		paraMap.put("reviewTitle", reviewTitle);
		paraMap.put("review", review);
		
		int result = cdao.reviewRegister(paraMap);
	
		if( result == 0 ) {
			
			String message = "수강후기를 이미 작성하신 강의입니다.";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", "javascript:history.back()");
			
			super.setRedirect(false); 
			
			super.setViewPage("/WEB-INF/msg.jsp");
		}
		
		else {
			
			
			List<CosVO> cvoList = cdao.ShoppingBagList(paraMap);
			
			// request.setAttribute("courseCode", courseCode);
			request.setAttribute("cvoList", cvoList);
			
			super.setRedirect(false); 
		
			super.setViewPage("/WEB-INF/index.jsp");
			
		}
		
	}

}
