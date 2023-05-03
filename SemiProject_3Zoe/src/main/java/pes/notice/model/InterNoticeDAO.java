package pes.notice.model;

import java.sql.SQLException;

import cos.model.CosVO;

public interface InterNoticeDAO {

	// 글번호 채번 해오기
	public String getNotice_seqOfProduct() throws SQLException;

	// tbl_notice 테이블에 insert 하기 
	public int noticeAdd(NoticeVO nvo) throws SQLException;

	// tbl_product_imagefile 테이블에 제품의 추가이미지 파일명 insert 해주기  
	public int notice_imagefile_Insert(String notice_seq, String attachFileName) throws SQLException;

	
	
	

	
	


	

}
