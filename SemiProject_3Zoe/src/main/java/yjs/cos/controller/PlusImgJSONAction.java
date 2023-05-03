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
import cos.model.ImgVO;
import cos.model.InterCosDAO;

public class PlusImgJSONAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String courseCode = request.getParameter("courseCode");
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("courseCode", courseCode);
		
		InterCosDAO cdao = new CosDAO();	
		
		List<ImgVO> imgList = cdao.imgPlus(paraMap);
		
		JSONArray jsonArr = new JSONArray(); // 위와 같이 표현하기 위해서는 JSONArray 를 사용해주어야 한다.
		
		if(imgList.size() > 0){
			// DB에서 조회해온 결과물이 있을 경우를 뜻한다.
			
			for(ImgVO ivo : imgList) {
				
				JSONObject jsonObj = new JSONObject();  
				jsonObj.put("img", ivo.getImg3());  
				
	            jsonArr.put(jsonObj); 
	            
			} // end of for(ImgVO ivo : imgList) {} ----------------------------------------
			
		} // end of if(imgList.size() > 0){} ---------------------------------------------------
		
		String json = jsonArr.toString(); 
		
		request.setAttribute("json", json);
		
		// System.out.println("확인용 json" + json);
		// 확인용 json[{"courseName":"정보처리기사 필기","courseterm":90,"salePrice":790,"price":1300}]
        
		
        super.setRedirect(false);
        super.setViewPage("/WEB-INF/jsonview.jsp");
		
		
	}

}
