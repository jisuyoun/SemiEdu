package yjs.cos.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import cos.model.CosDAO;
import cos.model.CosVO;
import cos.model.InterCosDAO;

public class CosRegisterAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 첫번째 카테고리 목록을 조회해온다.
		/*
		 * InterCosDAO cdao = new CosDAO();
		 * 
		 * List<CosVO> cvoList = cdao.searchCosList();
		 * 
		 * request.setAttribute("cvoList", cvoList);
		 */
		super.setRedirect(false); 
		
		super.setViewPage("/WEB-INF/cos/yjs_CosRegister.jsp");
		// /WEB-INF/cos/yjs_CosRegister.jsp
		
	}

}
