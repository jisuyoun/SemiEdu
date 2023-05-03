package yjs.cos.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import cos.model.CosDAO;
import cos.model.CosVO;
import cos.model.InterCosDAO;

public class CRSearchAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String search = request.getParameter("search");
		
		InterCosDAO cdao = new CosDAO();
		
		Map<String, String> paraMap = new HashMap<>();
		
		List<CosVO> cosList = cdao.searchCos(paraMap);	
		
	}

}
