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

public class CosOrderPageAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String courseCode = request.getParameter("courseCode");
		// System.out.println(courseCode);
		
		String fk_categoryCode = request.getParameter("fk_categoryCode");
		
		InterCosDAO cdao = new CosDAO();
		
		CosVO cvo = cdao.selectOneProductByCourseCode(courseCode);
		
		// Map<String, String> paraMap = new HashMap<>();
		// paraMap.put("fk_categoryCode", fk_categoryCode);
		// paraMap.put("fk_categoryCode", fk_categoryCode);
		
		// List<CosVO> cvoList = cdao.RecommendCos(paraMap);
		
		if(cvo == null) {
			String message = "검색하신 제품은 존재하지 않습니다.";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message); 
			request.setAttribute("loc", loc);
			
			super.setViewPage("/WEB-INF/msg.jsp");
		}
		
		else {
			request.setAttribute("cvo", cvo);
		//	request.setAttribute("cvoList", cvoList);
			
			super.setRedirect(false); 
		
			super.setViewPage("/WEB-INF/yjs.cos/yjs_OrderPage.jsp");
		}
		
		
		
	}

}
