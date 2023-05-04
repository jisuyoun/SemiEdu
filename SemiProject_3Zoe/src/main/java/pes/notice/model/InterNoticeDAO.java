package pes.notice.model;

import java.sql.SQLException;
import java.util.ArrayList;

import cos.model.CosVO;

public interface InterNoticeDAO {

	// 글번호 채번 해오기
	public String getNotice_seqOfProduct() throws SQLException;

	// tbl_notice 테이블에 insert 하기 
	public int noticeAdd(NoticeVO nvo) throws SQLException;

	// tbl_notice SELECT
	public ArrayList<NoticeVO> noticeList()  throws SQLException;

	// notice_seq 값을 받아 공지사항 본문내용 알아오기
	public NoticeVO noticeDetailAction(String notice_seq) throws SQLException; 
	

	
	


	

}
