package yjs.cos.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class CosRegisterAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 첫번째 카테고리 목록을 조회해온다.
		
				super.setRedirect(false); 
				
				super.setViewPage("/WEB-INF/cos/yjs_CosRegister.jsp");
				// /WEB-INF/cos/yjs_CosRegister.jsp
		
	}

}
