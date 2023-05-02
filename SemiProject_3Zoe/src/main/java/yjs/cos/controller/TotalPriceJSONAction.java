package yjs.cos.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import common.controller.AbstractController;
import cos.model.CosDAO;
import cos.model.CosVO;
import cos.model.InterCosDAO;

public class TotalPriceJSONAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String courseCode = request.getParameter("courseCode");
		
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("courseCodeArr", courseCode.split("\\,"));
		
		InterCosDAO cdao = new CosDAO();
		
		List<CosVO> cvoList = cdao.SelectPrice(paraMap);
		
		JSONArray jsonArr = new JSONArray();
		
		if(cvoList.size() > 0){
			// DB에서 조회해온 결과물이 있을 경우를 뜻한다.
			
			for(CosVO cvo : cvoList) {
				
				JSONObject jsonObj = new JSONObject();  
				jsonObj.put("courseCode", cvo.getCourseCode());    
				jsonObj.put("price", cvo.getPrice());    	     
				jsonObj.put("salePrice", cvo.getSalePrice());
				
	            jsonArr.put(jsonObj); 
	            
			} 
			
		} // end of if(prodList.size() > 0){} ---------------------------------------------------
		
		String json = jsonArr.toString(); 
		
		request.setAttribute("json", json);
		
        super.setRedirect(false);
        super.setViewPage("/WEB-INF/jsonview.jsp");
		
	}

}
