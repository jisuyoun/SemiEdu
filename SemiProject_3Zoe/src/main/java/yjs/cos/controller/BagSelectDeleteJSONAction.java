package yjs.cos.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import cos.model.CosDAO;
import cos.model.InterCosDAO;

public class BagSelectDeleteJSONAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String delCheckboxJoin = request.getParameter("delCheckboxJoin");
		
		String userid = request.getParameter("userid");
		
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("courseCodeArr", delCheckboxJoin.split("\\,"));
		paraMap.put("userid", userid);
		
		InterCosDAO cdao = new CosDAO();
		
		int n = cdao.BagSelectDelete(paraMap);
		
		JSONObject jsonobj = new JSONObject();
		
		jsonobj.put("n", n);
		
		String json = jsonobj.toString();
		
		request.setAttribute("json", json);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/jsonview.jsp");
				
	}

}
