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

public class CosRecommendJSONAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String fk_categoryCode = request.getParameter("fk_categoryCode");
		
		InterCosDAO cdao = new CosDAO();
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("fk_categoryCode", fk_categoryCode);
		
		List<CosVO> cvoList = cdao.RecommendCos(paraMap);
		
		JSONArray jsonArr = new JSONArray();
		
		if(cvoList.size() > 0) {
			
			for(CosVO cvo : cvoList) {
				
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("fk_categoryCode", fk_categoryCode);
				jsonObj.put("courseCode", cvo.getCourseCode());
				jsonObj.put("courseName", cvo.getCourseName());
				jsonObj.put("img1", cvo.getImg1());
				
				jsonArr.put(jsonObj);
				
			} // end of for(CosVO cvo : cvoList)
			
		} // end of if(cvoList.size() > 0)
		
		String json = jsonArr.toString();
		
		request.setAttribute("json", json);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/jsonview.jsp");
		
	}

}
