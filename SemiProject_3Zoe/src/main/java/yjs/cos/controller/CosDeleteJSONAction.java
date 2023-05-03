package yjs.cos.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import cos.model.CosDAO;
import cos.model.CosVO;
import cos.model.InterCosDAO;

public class CosDeleteJSONAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String checkedJoin = request.getParameter("checkedJoin");
		
		InterCosDAO cdao = new CosDAO();
		
		CosVO cvo = new CosVO();
		
		Map<String, Object> paraMap = new HashMap<>();
		
		// paraMap.put("checkedJoin", checkedJoin);
		
		paraMap.put("checkedArr", checkedJoin.split("\\,"));
		
		int n = cdao.delectCos(paraMap);
		
		JSONObject jsonobj = new JSONObject();
		
		jsonobj.put("n", n);
		
		String json = jsonobj.toString();
		
		// 강의를 선택하여 삭제하는 것이므로 무조건 1이 나온다.
		request.setAttribute("json", json);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/jsonview.jsp");
		
	}

}
