package yjs.cos.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import cos.model.CosDAO;
import cos.model.CosVO;
import cos.model.InterCosDAO;

public class ShoppingBagPageAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String courseCode = request.getParameter("courseCode");
		
		CosVO cvo = new CosVO();
		
		if(courseCode == null) {
			super.setRedirect(false); 
			
			super.setViewPage("/WEB-INF/yjs.cos/yjs_ShoppingBagPage.jsp");
		}
		
		else {
			String userid = request.getParameter("userid");
			
			Map<String, String> paraMap = new HashMap<>();
			paraMap.put("courseCode", courseCode);
			paraMap.put("userid", userid);
			
			InterCosDAO cdao = new CosDAO();
			
			int n = cdao.ShoppingBagAdd(paraMap);
		
			
			if( n == 0 ) {
				
				String message = "장바구니에 이미 존재하는 강의입니다.";
				
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
			
				super.setViewPage("/WEB-INF/yjs.cos/yjs_ShoppingBagPage.jsp");
				
			}
		}
		
	}

}