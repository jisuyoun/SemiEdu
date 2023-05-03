package pes.customerService.controller;

import java.util.ArrayList;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.MemberVO;
import pes.notice.model.InterNoticeDAO;
import pes.notice.model.NoticeDAO;
import pes.notice.model.NoticeVO;

public class NoticeListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		
		InterNoticeDAO ndao = new NoticeDAO();
		 ArrayList<NoticeVO> lists = ndao.noticeList();
		/*for(int i=0; i<lists.size();i++) {
			System.out.println("*********************");
			System.out.println(lists.get(i).getNotice_seq());
			System.out.println(lists.get(i).getTitle());
			System.out.println(lists.get(i).getReadcount());
			System.out.println(lists.get(i).getWriteDate2());
			System.out.println("*********************");
		}*/
		request.setAttribute("lists",lists);
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/pes.customerService/noticeList.jsp");
		
	}

}
