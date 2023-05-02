package pes.admin.controller;

import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.controller.AbstractController;
import cos.model.CosVO;
import member.model.MemberVO;
import pes.cos.model.InterProductDAO;
import pes.cos.model.ProductDAO;

public class ProductRegisterAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 관리자로 로그인 했을 때만 제품등록이 가능하도록
		HttpSession session = request.getSession();
		
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		if(loginuser != null && "testadmin".equals(loginuser.getUserid())) {
			
			String method = request.getMethod();
			
			if(!"POST".equalsIgnoreCase(method)) {
				
				// 카테고리 목록 조회해오기
				super.getCategoryList(request);
				
				super.setRedirect(false); 
				super.setViewPage("/WEB-INF/pes.admin/productRegister.jsp");
				
			}
			
			else {
				
				MultipartRequest mtrequest = null;

				
				// 1. 첨부되어진 파일이 디스크에 업로드 될 경로
				ServletContext svlCtx = session.getServletContext();
				String uploadFileDir = svlCtx.getRealPath("/yjs.images"); 
				
				System.out.println("=== 첨부되어지는 이미지 파일이 올라가는 절대경로 uploadFileDir ==> " + uploadFileDir);
				// === 첨부되어지는 이미지 파일이 올라가는 절대경로 uploadFileDir ==> C:\NCS\workspace(jsp)\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\MyMVC\images
			
				
				// === 파일을 업로드  해준다. ===
				try {
					mtrequest = new MultipartRequest(request, uploadFileDir, 10*1024*1024, "UTF-8", new DefaultFileRenamePolicy() );
				} catch (Exception e) {
					request.setAttribute("message", "업로드 되어질 경로가 잘못되었거나 또는 최대용량 10MB를 초과했으므로 파일업로드 실패하였습니다.");
					request.setAttribute("loc", request.getContextPath()+"/pes.admin/productRegister.go");
					
					super.setRedirect(false);
					super.setViewPage("/WEB-INF/msg.jsp");
					return; // 종료
				}
				
				// === 첨부 이미지 파일을 올렸으니 그 다음으로 제품정보 (제품명, 정가, 제품수량, .....)를 DB 의 tbl_course 테이블에 insert 를 해주어야 한다. === 
				
				// 새로운 제품 등록시 form 태그에서 입력한 값들을 얻어오기
				String fk_categoryCode = mtrequest.getParameter("fk_categoryCode");
				if(fk_categoryCode.equals("정보처리")) {
					fk_categoryCode = "1";
				}else if(fk_categoryCode.equals("데이터관련")) {
					fk_categoryCode = "2";
				}else if(fk_categoryCode.equals("전자계산기")) {
					fk_categoryCode = "3";
				}else if(fk_categoryCode.equals("패키지")) {
					fk_categoryCode = "4";
				}
				String courseName = mtrequest.getParameter("courseName");
				String teacher = mtrequest.getParameter("teacher");
				String courseTerm = mtrequest.getParameter("courseTerm");
				String price = mtrequest.getParameter("price");
				String salePrice = mtrequest.getParameter("salePrice");
				String point = mtrequest.getParameter("point");
				
				
				
				// 업로드되어진 시스템의 첨부파일 이름(파일서버에 업로드 되어진 실제파일명)을 얻어 올때는 
	            // cos.jar 라이브러리에서 제공하는 MultipartRequest 객체의 getFilesystemName("form에서의 첨부파일 name명") 메소드를 사용 한다. 
	            // 이때 업로드 된 파일이 없는 경우에는 null을 반환한다.
				String img1 = mtrequest.getFilesystemName("img1"); // 강의 이미지 파일명(파일서버에 업로드 되어진 실제파일명)
				String img2 = mtrequest.getFilesystemName("img2"); // 강의 이미지 파일명(파일서버에 업로드 되어진 실제파일명)
				System.out.println("~~~ 확인용 pimage1 : " + img1); 
				System.out.println("~~~ 확인용 pimage2 : " + img2); 

				
				// 크로스 사이트 스크립트 공격에 대응하는 안전한 코드(시큐어코드)
				String courseList = mtrequest.getParameter("courseList");
				courseList = courseList.replaceAll("<", "&lt;");
				courseList = courseList.replaceAll("<", "&gt;");
				// 입력한 내용에서 엔터는 <br>로 변환시키기기
				courseList = courseList.replaceAll("\r\n", "<br>");

				
				InterProductDAO pdao = new ProductDAO();
				
				String courseCode = pdao.getCourseCodeOfProduct(); // 강의코드 채번 해오기
	
				CosVO cvo = new CosVO();
				
				cvo.setCourseCode(courseCode);
				cvo.setFk_categoryCode(fk_categoryCode);
				cvo.setCourseName(courseName);
				cvo.setPrice(Integer.parseInt(price));
		        cvo.setSalePrice(Integer.parseInt(salePrice));
				cvo.setTeacher(teacher);		        
		        cvo.setCourseTerm(Integer.parseInt(courseTerm));
		        cvo.setCourseList(courseList);
		        cvo.setImg1(img1);
		        cvo.setImg2(img2);

		        String message = "";
		        String loc = "";
		        
		        
		        try {

		        	// tbl_course 테이블에 insert 하기 
			        pdao.productInsert(cvo);

			        // 추가이미지파일이 있다라면 tbl_extraImg 테이블에 제품의 추가이미지 파일명 insert
			        String str_attachCount = mtrequest.getParameter("attachCount"); 
		            // str_attachCount 이 추가이미지 파일의 개수이다. "" "0" ~ "10" 이 들어온다.
			        
			        int attachCount = 0;
			        
				        if(!"".equals(str_attachCount)) {
				        	attachCount = Integer.parseInt(str_attachCount);
				        }
				        
				        // 첨부파일의 파일명(파일서버에 업로드 되어진 실제 파일명) 알아오기 
				        for(int i=0; i<attachCount; i++) {
				        	String attachFileName = mtrequest.getFilesystemName("attach"+i);
				        	
				        	pdao.product_imagefile_Insert(courseCode, attachFileName);
				        							   // courseCode 은 위에서 채번해 온 제품번호이다. 
				        }//end of for----------------
				        
			        message = "신규강좌가 등록되었습니다.";
			        loc = request.getContextPath() + "/cos/yjs_CosRegister.go";
			        
				
		        	
				} catch (SQLException e) {
					e.printStackTrace();
					
					message = "제품등록을 실패하였습니다.";
	                loc = request.getContextPath()+"/pes.admin/productRegister.go";

				}

		        request.setAttribute("message", message);
		        request.setAttribute("loc", loc);
		        
		        super.setRedirect(false);
				super.setViewPage("/WEB-INF/msg.jsp");
			}
			
		}
		
		else { 
			
			// 로그인 안한 경우 또는 일반사용자로 로그인 한 경우
			String message = "※ 관리자만 접근 가능합니다. ※";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
		}
		
	}

}
