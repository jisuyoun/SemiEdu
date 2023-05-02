package yjs.cos.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import cos.model.CosDAO;
import cos.model.InterCosDAO;

public class BagAllDeleteJSONAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String userid = request.getParameter("userid");
		
		InterCosDAO cdao = new CosDAO();
		
		int n = cdao.BagAllDelete(userid);
		
		JSONObject jsobj = new JSONObject();
		
		jsobj.put("n", n);
		
		String json = jsobj.toString();
		
		request.setAttribute("json", json);
		
        super.setRedirect(false);
        super.setViewPage("/WEB-INF/jsonview.jsp");
		
	}

}
