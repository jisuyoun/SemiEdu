package pes.customerService.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import member.model.MemberVO;
import pes.member.model.*;
import pes.notice.model.*;

public class NoticeDetailAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		String notice_seq = request.getParameter("notice_seq");
		InterNoticeDAO ndao = new NoticeDAO();
		NoticeVO nvo = ndao.noticeDetailAction(notice_seq);
		
		request.setAttribute("nvo", nvo);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/pes.customerService/noticeDetail.jsp");
		
	}

}
