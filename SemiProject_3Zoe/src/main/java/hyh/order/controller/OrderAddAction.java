package hyh.order.controller;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import common.controller.AbstractController;
import cos.model.CosVO;
import hyh.cos.model.CosDAO;
import hyh.cos.model.InterCosDAO;
import member.model.MemberVO;



public class OrderAddAction extends AbstractController {

private InterCosDAO cdao = new CosDAO();
	
	// 주문코드(명세서번호)를 생성해주는 메소드
	private String getOdrcode() throws SQLException {
		
		// -- 주문코드(명세서번호)  주문코드 형식 : s+날짜+sequence ==> s20220503-1 , s20220503-2 , s20220503-3
		
		// 날짜 생성
		Date now = new Date();
		SimpleDateFormat smdatefm = new SimpleDateFormat("yyyyMMdd");
		String today = smdatefm.format(now);
		
		int seq = cdao.getSeq_tbl_order();
		// pdao.getSeq_tbl_order(); 는 시퀀스 seq_tbl_order 값을 채번해오는 것
		
		return "s"+today+"-"+seq;
	}
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int orderPoint = Integer.parseInt(request.getParameter("orderPoint"));
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
		String fk_userid = request.getParameter("fk_userid");
				
		String fk_courseCode = request.getParameter("fk_courseCode");
		int coursePrice = Integer.parseInt(request.getParameter("coursePrice"));
				
		HashMap<String, Object> paraMap = new HashMap<>();	// Object -> int, String 무엇이든 받아줌.
		
		// 주문 테이블(tbl_order)에 insert 할 데이터
		String odrcode = getOdrcode();  // 주문코드(명세서번호)를 생성해주는 메소드 호출하기
										// 주문코드 형식 : s+날짜+sequence ==> s20220503-1 , s20220503-2 , s20220503-3
		//int sum_totalPrice = cvo.getSalePrice();
		System.out.println(odrcode);
		
		paraMap.put("odrcode", odrcode); // 주문코드
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");	
		paraMap.put("userid", loginuser.getUserid());	// 회원아이디
		paraMap.put("totalPrice", totalPrice);	// 주문총액
		//paraMap.put("sum_totalPoint", sum_totalPoint);	// 주문총포인트
		
		// 주문상세 테이블(tbl_detailOrder)에 insert 할 데이터
		//paraMap.put("pnum_arr", courseCode_join.split("\\,")); // 제품번호	["5","3","4"]
		//paraMap.put("oqty_arr", oqty_join.split("\\,")); // 주문량	["3","5","2"]
		//paraMap.put("totalPrice_arr", totalPrice_join.split("\\,")); // 주문가격
		
		
		// 장바구니 테이블에 delete 할 데이터
		// 특정제품을 바로주문하기를 한 경우라면 cartno_join 의 값은 null 이다.
		//if(cartno_join != null) {
		//	paraMap.put("cartno_arr", cartno_join.split("\\,")); 
		//}
		
		
		// *** Transaction 처리를 해주는 메소드 호출하기 *** //
		int isSuccess = cdao.orderAdd(paraMap); // Transaction 처리를 해주는 메소드
		
		
		
		// **** 주문이 완료되었을시 세션에 저장되어져 있는 loginuser 정보를 갱신하고
	    //      이어서 주문이 완료되었다라는 email 보내주기  **** //
		if(isSuccess == 1) {
			
			// 세션에 저장되어져 있는 loginuser 정보를 갱신
			loginuser.setPoint( loginuser.getPoint() + (int)((totalPrice)*0.01)) ;
			
			///// === 주문이 완료되었다는 mail 보내기 시작 === /////
			GoogleMail mail = new GoogleMail();
			
			String[] pnum_arr = fk_courseCode.split("\\,");
			
			String pnumes = String.join("','", pnum_arr);
			// '5', '3', '4'
			
			pnumes = "'"+pnumes+"'";
			
			// 주문한 제품에 대해 email 보내기시 email 내용에 넣어 주문한 제품번호들에 대한 제품번호를 얻어오는 것.
			List<CosVO> jumunProductList = cdao.getJumunProductList(pnumes);
			//String[] oqty_arr = oqty_join.split("\\,");
			
			StringBuilder sb = new StringBuilder();
			
			sb.append("<div>");
			sb.append("주문코드번호 : <span style='color: blue; font-weight: bold;'>"+odrcode+"</span><br><br>");
			sb.append("<주문상품><br>");
			
			for(int i=0; i<jumunProductList.size(); i++) {
				sb.append(jumunProductList.get(i).getCourseCode()+"&nbsp;");
				sb.append("<img src='http://127.0.0.1:9090/SemiProject_3Zoe/images/"+jumunProductList.get(i).getImg1()+"' />");
				sb.append("<br>");
			}
			
			sb.append("<br>이용해 주셔서 감사합니다.");
			sb.append("</div>");
			
			String emailContents = sb.toString();
			
			mail.sendmail_OrderFinish(loginuser.getEmail(), loginuser.getName(), emailContents);
			///// === 주문이 완료되었다는 mail 보내기 끝 === /////
			
		}
		
		JSONObject jsobj = new JSONObject(); // {}
		jsobj.put("isSuccess", isSuccess);	 // {"isSuccess":1} 또는 {"isSuccess":0}
		
		String json = jsobj.toString();
		request.setAttribute("json", json);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/jsonview.jsp");
		
	}

}
