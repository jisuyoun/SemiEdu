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
import cos.model.YJS_ReviewVO;

public class ReviewShowJSONAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String courseCode = request.getParameter("courseCode");
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("courseCode", courseCode);
		
		InterCosDAO cdao = new CosDAO();
		
		List<YJS_ReviewVO> revoList = cdao.ReviewShow(paraMap);
		
		JSONArray jsonArr = new JSONArray();
		
		if(revoList.size() > 0){
			// DB에서 조회해온 결과물이 있을 경우를 뜻한다.
			
			for(YJS_ReviewVO rvo : revoList) {
				
				JSONObject jsonObj = new JSONObject();  
				jsonObj.put("fk_userid", rvo.getFk_userid());  
				jsonObj.put("reviewTitle", rvo.getReviewTitle());
				jsonObj.put("review", rvo.getReview());     
				jsonObj.put("reviewPoint", rvo.getReviewPoint());    	     
				jsonObj.put("writeDay", rvo.getWriteDay());
				
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
