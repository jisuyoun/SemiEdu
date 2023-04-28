package yjs.cos.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import common.controller.AbstractController;
import cos.model.CosDAO;
import cos.model.CosVO;
import cos.model.InterCosDAO;
import member.model.MemberVO;

public class CosLikeJSONAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// checkedHeartJoin 는 찜한 강의코드다.
		String checkedHeart = request.getParameter("checkedHeart");
		
		String userid = request.getParameter("userid");
		
		InterCosDAO cdao = new CosDAO();
		
		int n = cdao.LikeTblAdd(checkedHeart, userid);
		
		JSONObject jsonobj = new JSONObject();
		
		jsonobj.put("n", n);
		
		String json = jsonobj.toString();
		
		// 강의를 선택하여 삭제하는 것이므로 무조건 1이 나온다.
		request.setAttribute("json", json);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/jsonview.jsp");
		
	}

}
