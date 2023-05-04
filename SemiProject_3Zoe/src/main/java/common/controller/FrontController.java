package common.controller;

import java.io.*;
import java.lang.reflect.Constructor;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(
		description = "사용자가 웹에서 *.go 을 했을 경우 이 서블릿이 응답을 해주도록 한다.",
		urlPatterns = { "*.go" }, 
		initParams = { 
				@WebInitParam(name = "propertyConfig", value = "C:/git/SemiProject_3Zoe/SemiProject_3Zoe/src/main/webapp/WEB-INF/command.properties", description = "*.go에 대한 클래스의 매핑파일")
		})

public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Map<String, Object> cmdMap = new HashMap<>();
	

	public void init(ServletConfig config) throws ServletException {
	/*
	 	웹브라우저 주소창에서 *.go 을 하면 FrontController 서블릿이 응대를 해오는데,
	 	맨 처음에 자동적으로 실행되어지는 메소드가 init(ServletConfig config) 이다.
	 	여기서 중요한 것은 init(ServletConfig config) 메소드는 WAS(톰캣)가 구동되어진 후 
	 	딱 한 번만 init(ServletConfig config) 메소드가 실행되어지고, 그 이후에는 실행되어지지 않는다.
	 	그러므로 init(ServletConfig config) 메소드에는 FrontController 서블릿이 동작해야할 환경설정을 잡아주는데 사용된다.
	*/
		// *** 확인용 ***//
		// System.out.println("~~~ 확인용 => 서블릿 FrontController 의 init(ServletConfig config) 메소드가 실행됨." );
		
		FileInputStream fis = null; // 특정 파일에 있는 내용을 읽어오기 위한 용도로 쓰이는 객체
	
		String props = config.getInitParameter("propertyConfig");
		// System.out.println("~~~~~~ 확인용 props => " + props);
		// ~~~~~~ 확인용 props => C:/NCS/workspace(jsp)/MyMVC/src/main/webapp/WEB-INF/Command.properties 파일의 내용을 읽어오기 위한 용도로 쓰이는 객체다.
		// 즉, C:/NCS/workspace(jsp)/MyMVC/src/main/webapp/WEB-INF/Command.properties 내 내용들을 모두 분석해준다.
		
		try {
			fis = new FileInputStream(props);
			// fis 는 props C:/NCS/workspace(jsp)/MyMVC/src/main/webapp/WEB-INF/Command.properties
			
			Properties pr = new Properties();
		/*
			Properties 는 HashMap의 구버전인 Hashtable을 상속받아 구현한 것으로,
			Hashtable 은 키와 값(Object, Object)의 형태로 저장하는데 비해서
			Properties 는 (String 키, String 밸류값)의 형태로 저장하는 단순화된 컬렉션 클래스이다.
		    키는 고유해야 한다. 즉, 중복을 허락하지 않는다. 
		    중복된 값을 넣으면 마지막에 넣은 값으로 덮어씌운다.
		    주로 어플리케이션의 환경설정과 관련된 속성(property)을 저장하는데 사용되며, 
		    데이터를 파일로 부터 읽고 쓰는 편리한 기능을 제공한다.    
		 */
			
			pr.load(fis);
			
		/*
		 	pr.load(fis); 은 fis 객체를 사용하여
		 	C:/NCS/workspace(jsp)/MyMVC/src/main/webapp/WEB-INF/Command.properties 파일의 내용을 읽어다가
		 	Properties 클래스의 객체인 pr 에 로드시킨다.
		 	그러면 pr 은 읽어온 파일(Command.properties)의 내용에서
		 	= 을 기준으로 왼쪽은 Key 로 보고, 오른쪽은 Value 로 인식한다.  
		 */
			
			Enumeration<Object> en = pr.keys();
			// keys 는 properties 내 = 기준으로 왼편에 있는 모든 key들을 가져온다.
			
			while(en.hasMoreElements()) {
			// hasMoreElements() 는 boolean 타입으로, 데이터가 있다면 true로, while(en.hasMoreElements()) 은 pr.key를 전부 다 불러올때까지 반복한다.
			
				 String key = (String) en.nextElement();
			/*	  
				 System.out.println("~~~~ 확인용 key ~~~~" + key);
			*/
				 pr.getProperty(key);
				 // 만약 key에 "/test1.up" 을 적어줄 경우 /test1.up 에 매핑되어진 test.controller.Test1Controller 가 실행된다.
				 
			//	 System.out.println("### 확인용 value => " + pr.getProperty(key));
			/*
			 	### 확인용 value => test.controller.Test2Controller
				### 확인용 value => test.controller.Test1Controller
			 */
				 String className = pr.getProperty(key);
				 
				 if(className != null) {
					 // key 는 있으나 = 왼편에 test.controller.Test1Controller 이런것을 적지 않았을 경우를 방지하기 위해 적어준다.
					 
					  className = className.trim();
					 // 공백이 있을 경우 공백까지 파일명으로 보기 때문에 공백을 제거해주어야 한다.
					 
					  Class<?> cls = Class.forName(className);
					  // Class.forName(className) 은 properties 내 매핑된 test.controller.Test1Controller 와 같은 파일이 실제로 존재해야 사용이 가능하다.
					  // 여기서 ? 은 gereric 인데 어떤 클래스 타입인지는 모르지만 클래스 파일이 들어온다는 뜻이다.
					  // Class<?> cls = Class.forName(className);는 string 타입으로 되어진 className 을 클래스와 시켜주는 것이다.
					  
					  
					  Constructor<?> constrt = cls.getDeclaredConstructor();
					  // 생성자 만들기
					  
					  Object obj = constrt.newInstance();
					  // 생성자로부터 실제 객체(인스턴스)를 생성해주는 것이다.
					  
					  // System.out.println("~~~ 확인용 obj.toString => " + obj.toString());
					  /*
					    obj 결과
					   	~~~ 확인용 => test.controller.Test2Controller@2bfa59c9
						~~~ 확인용 => test.controller.Test1Controller@4a937515
						
						obj.toString 결과
						~~~ 확인용 obj.toString => ### 클래스 Test2Controller 의 인스턴스 메소드 toString()을 호출함 ###
						~~~ 확인용 obj.toString => @@@ 클래스 Test1Controller 의 인스턴스 메소드 toString()을 호출함 @@@
	
					   */
					  
					  cmdMap.put(key, obj);
					  /*
					   	cmdMap 에서 키값으로 Command.properties 파일에 저장되어진 URL 을(키값을) 주면
					   	cmdMap 에서 해당 클래스에 대한 객체(인스턴스)를 얻어오도록 만든 것이다. 
					   */
					  
				 } // end of if(classname != null) {}
				
			} // end of while(en.hasMoreElements()) {}
			
		} catch (FileNotFoundException e) {
			System.out.println(">>> C:/git/SemiProject_3Zoe/SemiProject_3Zoe/src/main/webapp/WEB-INF/command.properties 파일이 없습니다. <<<");
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			System.out.println(">>> 문자열로 명명되어진 클래스가 존재하지 않습니다.");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 웹브라우저 주소 입력창에서 
		// http://localhost:9090/MyMVC/member/idDuplicateCheck.up?userid=leess 와 같이 입력되었더라면
		String url = request.getRequestURL().toString();
		// System.out.println("~~~~~ 확인용 url => " + url);
		// ~~~~~ 확인용 url => http://localhost:9090/MyMVC/member/idDuplicateCheck.up
		// ? 를 기준으로 데이터인 userid=leess은 빼고 출력된다.
		
		// 웹브라우저 주소 입력창에서 
		// http://localhost:9090/MyMVC/member/idDuplicateCheck.up?userid=leess 와 같이 입력되었더라면
		String uri = request.getRequestURI();
		// System.out.println("~~~~~ 확인용 uri => " + uri);
		// ~~~~~ 확인용 uri => /MyMVC/member/idDuplicateCheck.up
		
		// request.getContextPath();
		// /MyMVC
		
		String key = uri.substring(request.getContextPath().length());
		// /member/idDuplicateCheck.up 이것은 매핑되는 uri가 없다. 즉, null 값이 나온다.
		// /test1.up
		// /test1/test2.up
		
		AbstractController action = (AbstractController) cmdMap.get(key);
		
		if(action == null) {
			System.out.println(">>> " + key + "은 URI 패턴에 매핑된 클래스가 없습니다. <<<");
			// /member/idDuplicateCheck.up은 '>>> /member/idDuplicateCheck.up은 URI 패턴에 매핑된 클래스가 없습니다. <<<' 이 출력된다.

		}
		else {
			try {
			/*
                post 방식으로 넘어온 데이터중 영어는 글자가 안깨지지만,
                한글은 글자모양이 깨져나온다.
                그래서  post 방식에서 넘어온 한글 데이터가 글자가 안깨지게 하려면 
                아래처럼 request.setCharacterEncoding("UTF-8"); 을 해야 한다.
                주의할 것은 request.getParameter("변수명"); 보다 먼저 기술을 해주어야 한다는 것이다.      
             */
				
				request.setCharacterEncoding("UTF-8");
				
				action.execute(request, response);
				
				boolean bool = action.isRedirect();
				// isRedirect 변수의 값이 false 라면 view 단 페이지(.jsp)로 forward(dispatcher) 하겠다.
				// isRedirect 변수의 값이 true 라면 view sendRedirect 로 하겠다.
				
				String viewPage = action.getViewPage();
				
				if(!bool) {
					// viewPage 에 명기된 view단 페이지로 forward 해준다.
					// forward 가 되어지면 웹브라우저의 URL 주소는 변경되지 않고 그대로이면서 화면에 보여지는 내용은 forward 되어지는 jsp 파일이 보여진다.
					// 또한, forward 방식은 forward 되어지는 페이지로 데이터를 전달할 수 있다.
					
					if(viewPage != null) {
						RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
						dispatcher.forward(request, response);
					}
					
				} // end of if(!bool) {}
				
				else {
					// viewPage 에 명기된 주소로 sendRedirect(웹브라우저의 URL 주소 변경됨) 해준다.
					// 즉, 단순 페이지 이동을 하겠다는 뜻이다.
					// 암기할 내용은 sendRedirect 방식은 sendRedirect 되어지는 페이지로 데이터를 전달할 수 없다는 것이다.
					if(viewPage != null) {
						response.sendRedirect(viewPage);
					}
				}
					
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
