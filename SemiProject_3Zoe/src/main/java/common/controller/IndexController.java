package common.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




public class IndexController extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		
		
			
		
		// super.setRedirect(false);   
		// this.setRedirect(false);
		// setRedirect(false);        
		// AbstractController 에서 isRedirect 는 default가 false(forward 방식) 이기에 생략해도 됨.
		
			super.setViewPage("/WEB-INF/index.jsp");
			
	
		
	}

}
