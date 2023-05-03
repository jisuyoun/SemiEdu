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
import pes.notice.model.*;

public class NoticeAddAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		// 관리자로 로그인 했을 때만 공지사항 게시가 가능하도록
		HttpSession session = request.getSession();
		
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		if(loginuser != null && "testadmin".equals(loginuser.getUserid())) {
			
			String method = request.getMethod();
			
			if(!"POST".equalsIgnoreCase(method)) {
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/pes.admin/noticeAdd.jsp");
				
			}
			
			else {
				
				MultipartRequest mtrequest = null;

				// 1. 첨부되어진 파일이 디스크에 업로드 될 경로
				ServletContext svlCtx = session.getServletContext();
				String uploadFileDir = svlCtx.getRealPath("/es_noticeImages"); 
				System.out.println("1111111");
				System.out.println("=== [공지사항] 첨부되어지는 이미지 파일이 올라가는 절대경로 uploadFileDir ==> " + uploadFileDir);
				System.out.println("22222222");
				// === 파일을 업로드  해준다. ===
				try {
					mtrequest = new MultipartRequest(request, uploadFileDir, 10*1024*1024, "UTF-8", new DefaultFileRenamePolicy() );
				} catch (Exception e) {
					request.setAttribute("message", "업로드 되어질 경로가 잘못되었거나 또는 최대용량 10MB를 초과했으므로 파일업로드 실패하였습니다.");
					request.setAttribute("loc", request.getContextPath()+"/pes.admin/noticeAdd.go");
					
					super.setRedirect(false);
					super.setViewPage("/WEB-INF/msg.jsp");
					return; // 종료
				}
				
				// tbl_notice 테이블에 insert 				
				// 새로운 제품 등록시 form 태그에서 입력한 값들을 얻어오기	
				System.out.println("33333333");
				String title = mtrequest.getParameter("title");					// 제목
				String wirter = (String)session.getAttribute("name");				// 작성자
				String contents = mtrequest.getParameter("contents");			// 공지사항 본문
				String readcount = mtrequest.getParameter("readcount");			// 조회수
				
				System.out.println("title"+title);
				System.out.println("wirter"+wirter);
				System.out.println("contents"+contents);
				System.out.println("readcount"+readcount);

				System.out.println("444444444");
				
				// 크로스 사이트 스크립트 공격에 대응하는 안전한 코드(시큐어코드)
				String noticeList = mtrequest.getParameter("noticeList");
				noticeList = noticeList.replaceAll("<", "&lt;");
				noticeList = noticeList.replaceAll("<", "&gt;");
				// 입력한 내용에서 엔터는 <br>로 변환시키기기
				noticeList = noticeList.replaceAll("\r\n", "<br>");

				InterNoticeDAO ndao = new NoticeDAO();
				
				String notice_seq = ndao.getNotice_seqOfProduct(); // 글번호 채번 해오기
				
				NoticeVO nvo = new NoticeVO();
				
				nvo.setTitle(title);
				nvo.setWirter(wirter);
				nvo.setContents(contents);
				nvo.setReadcount(Integer.parseInt(readcount));

				
		        String message = "";
		        String loc = "";
		        
		        try {
		        	ndao.noticeAdd(nvo);
		        	// tbl_course 테이블에 insert 하기 
		        	

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
				        	
				        	ndao.notice_imagefile_Insert(notice_seq, attachFileName);
				        							   // courseCode 은 위에서 채번해 온 제품번호이다. 
				        }//end of for----------------
				        
			        message = "공지사항이 등록되었습니다.";
			        loc = request.getContextPath() + "/pes.customerService/noticeList.go";
			        
				
		        	
				} catch (SQLException e) {
					e.printStackTrace();
					
					message = "공지사항 등록을 실패하였습니다.";
	                loc = request.getContextPath()+"/pes.admin/noticeAdd.go";

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
