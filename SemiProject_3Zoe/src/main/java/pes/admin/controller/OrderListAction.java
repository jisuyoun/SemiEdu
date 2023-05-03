package pes.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.MemberVO;
import pes.member.model.InterMemberDAO;
import pes.member.model.MemberDAO;

public class OrderListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		if(loginuser != null && loginuser.getUserid().equals("testadmin")) {
			// 관리자 로그인일 경우
			InterMemberDAO mdao = new MemberDAO();
			
			// 회원 검색 기능
			String searchType = request.getParameter("searchType");
			String searchWord = request.getParameter("searchWord"); 
			
			if(searchType == null || 
			  (!"name".equals(searchType) && 
			   !"userid".equals(searchType) && 
			   !"email".equals(searchType)) ) {
				searchType = "";
			}
			
			if(searchWord == null ||
			  (searchWord != null && searchWord.trim().isEmpty()) ){
				searchWord = "";
			}
			
			
			Map<String, String> paraMap = new HashMap<>();
			paraMap.put("searchType", searchType);
			paraMap.put("searchWord", searchWord);
			
			String currentShowPageNo = request.getParameter("currentShowPageNo");
			
			String sizePerPage = request.getParameter("sizePerPage");
			
			if(currentShowPageNo == null) {
				currentShowPageNo = "1";
			}
			
			if( sizePerPage == null || !( "3".equals(sizePerPage) || "5".equals(sizePerPage) || "10".equals(sizePerPage)) ) {
				sizePerPage = "10";
			}
			
			// currentShowPageNo 에 숫자가 아닌 문자를 입력하거나 범위를 초과한 숫자를 입력한 경우라면 1페이지로 만들기.
			try {
				if(Integer.parseInt(currentShowPageNo) < 1) {
					currentShowPageNo =	"1"; 
				}
			} catch (NumberFormatException e) {
				currentShowPageNo =	"1"; 
			}
			
			paraMap.put("currentShowPageNo", currentShowPageNo); 
			paraMap.put("sizePerPage", sizePerPage);

			// 페이징 처리를 위한 검색이 있는 또는 검색이 없는 전체회원에 대한 총페이지 알아오기
			int totalPage = mdao.getTotalPage(paraMap);
				
			
			// GET 방식 이므로 웹브라우저 주소창 장난을 막아준다.
			if( Integer.parseInt(currentShowPageNo) > totalPage ) { 
				currentShowPageNo =	"1"; 
				paraMap.put("currentShowPageNo", currentShowPageNo);
			}
			
			List<MemberVO> memberList = mdao.selectPagingMember(paraMap);
			request.setAttribute("memberList", memberList);
			
			request.setAttribute("searchType", searchType);
			request.setAttribute("searchWord", searchWord);
			request.setAttribute("sizePerPage", sizePerPage);
			
		
			// 페이지바 만들기 시작			
			String pageBar = "";

			int blockSize = 10;
			int loop = 1;
			int pageNo = ( (Integer.parseInt(currentShowPageNo) - 1)/blockSize ) * blockSize + 1;
			
			// 맨처음, 이전 
			pageBar += "<li class='page-item'><a class='page-link' href='memberList.go?searchType="+searchType+"&searchWord="+searchWord+"&currentShowPageNo=1&sizePerPage="+sizePerPage+"'>[맨처음]</a></li>";

			if(pageNo != 1) {
				pageBar += "<li class='page-item'><a class='page-link' href='memberList.go?searchType="+searchType+"&searchWord="+searchWord+"&currentShowPageNo="+(pageNo-1)+"&sizePerPage="+sizePerPage+"'>[이전]</a></li>";
			}
			
			while( !(loop > blockSize || pageNo > totalPage) ) {
				if(pageNo == Integer.parseInt(currentShowPageNo)) {
					pageBar += "<li class='page-item es_active'><a class='page-link' href='#'>" + pageNo + "</a></li>";
				}
				else {
					pageBar += "<li class='page-item'><a class='page-link' href='memberList.go?searchType="+searchType+"&searchWord="+searchWord+"&currentShowPageNo="+pageNo+"&sizePerPage="+sizePerPage+"'>" + pageNo + "</a></li>";
				}
				
				loop++;  
				pageNo++; 
				
			}//end of while-----------------------
			
			
			// 다음, 마지막
			if(pageNo <= totalPage) {
				pageBar += "<li class='page-item'><a class='page-link' href='memberList.go?searchType="+searchType+"&searchWord="+searchWord+"&currentShowPageNo="+pageNo+"&sizePerPage="+sizePerPage+"'>[다음]</a></li>";
			}

			pageBar += "<li class='page-item'><a class='page-link' href='memberList.go?searchType="+searchType+"&searchWord="+searchWord+"&currentShowPageNo="+totalPage+"&sizePerPage="+sizePerPage+"'>[마지막]</a></li>";
			
			request.setAttribute("pageBar", pageBar);
						
			
			super.setRedirect(false); 
			super.setViewPage("/WEB-INF/pes.admin/orderList.jsp");
	
		}
		
		else {
			// 로그인 안 한 경우 또는 일반회원 로그인일 경우
			String message = "※ 관리자만 접근 가능합니다. ※";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false); 
			super.setViewPage("/WEB-INF/msg.jsp");
			
		}
		
		
	}

}
