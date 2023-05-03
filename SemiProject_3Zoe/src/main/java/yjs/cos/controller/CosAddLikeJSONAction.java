package yjs.cos.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import cos.model.CosDAO;
import cos.model.InterCosDAO;

public class CosAddLikeJSONAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String userid = request.getParameter("userid");
		String courseCode = request.getParameter("courseCode");
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("userid", userid);
		paraMap.put("courseCode", courseCode);
		
		InterCosDAO cdao = new CosDAO();
		
		int result = cdao.addLike(paraMap);
		
		JSONObject jsonobj = new JSONObject();
		
		jsonobj.put("result", result);
		
		String json = jsonobj.toString();
		
		request.setAttribute("json", json);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/jsonview.jsp");
		
	}

}
