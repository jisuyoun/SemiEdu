package yjs.cos.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import cos.model.CosDAO;
import cos.model.InterCosDAO;

public class CosLikeJSONAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// checkedHeartJoin 는 찜한 강의코드다.
				String checkedHeart = request.getParameter("checkedHeart");
				
				String userid = request.getParameter("userid");
				
				Map<String, String> paraMap = new HashMap<>();
				paraMap.put("checkedHeart", checkedHeart);
				paraMap.put("userid", userid);
				
				InterCosDAO cdao = new CosDAO();
				
				int n = cdao.LikeTblAdd(paraMap);
				
				JSONObject jsonobj = new JSONObject();
				
				jsonobj.put("n", n);
				
				String json = jsonobj.toString();
				
				// 강의를 선택하여 삭제하는 것이므로 무조건 1이 나온다.
				request.setAttribute("json", json);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/jsonview.jsp");
		
	}

}
