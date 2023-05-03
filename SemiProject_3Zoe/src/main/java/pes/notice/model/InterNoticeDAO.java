package pes.notice.model;

import java.sql.SQLException;
import java.util.ArrayList;

import cos.model.CosVO;

public interface InterNoticeDAO {

	// 글번호 채번 해오기
	public String getNotice_seqOfProduct() throws SQLException;

	// tbl_notice 테이블에 insert 하기 
	public int noticeAdd(NoticeVO nvo) throws SQLException;

	
	public ArrayList<NoticeVO> noticeList()  throws SQLException; 
	

	
	


	

}
