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

public class ShoppingBagPageJSONAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String userid = request.getParameter("userid");
		
		InterCosDAO cdao = new CosDAO();
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("userid", userid);
		
		List<CosVO> cosList = cdao.ShoppingBagList(paraMap);
		
		JSONArray jsonArr = new JSONArray();
		
		if(cosList.size() > 0){
			// DB에서 조회해온 결과물이 있을 경우를 뜻한다.
			
			for(CosVO cvo : cosList) {
				
				JSONObject jsonObj = new JSONObject();  
				jsonObj.put("courseCode", cvo.getCourseCode()); 
				jsonObj.put("courseName", cvo.getCourseName());     
				jsonObj.put("price", cvo.getPrice());    	     
				jsonObj.put("salePrice", cvo.getSalePrice());
				
	            jsonArr.put(jsonObj); // 이걸 여러번 해서 [{},{},{}] 식으로 많이 묶어준다.
	            
	            // [{}, {}, {} ...] 된 것을 문자열로 변환해준 후 웹에서 보여주어야 한다.
 
	            
			} // end of forfor(CosVO cvo : cosList) {} ----------------------------------------
			
		} // end of if(prodList.size() > 0){} ---------------------------------------------------
		
		String json = jsonArr.toString(); 
		
		request.setAttribute("json", json);
		
		// System.out.println("확인용 json" + json);
		// 확인용 json[{"courseName":"정보처리기사 필기","courseterm":90,"salePrice":790,"price":1300}]
        
		
        super.setRedirect(false);
        super.setViewPage("/WEB-INF/jsonview.jsp");
		
		
	}

}
