package common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class IndexController extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		

		
		    super.setRedirect(false); // 디폴트가 false이기 때문에 생략가능
		//	또는 this.setRedirect(false);
		//	또는 setRedirect(false);
		
			super.setViewPage("/WEB-INF/index.jsp");
		//	또는 this.setViewPage("/WEB-INF/index.jsp");	
		
	}

}
