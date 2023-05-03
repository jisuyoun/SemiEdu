package pes.notice.model;

import java.util.List;



public class NoticeVO {

	 private int notice_seq;	// 글번호
     private String title;		// 제목
     private String wirter;		// 작성자
     private String contents;	// 공지사항 본문
     private int readcount;		// 조회수
     private int writeDate;		// 작성일자
     private String notice_img1;			  // 공지사항첨부이미지1
 	 private String notice_img2;			  // 공지사항첨부이미지2
 	 private String writeDate2;
 	 
 	
 	 
	public String getWriteDate2() {
		return writeDate2;
	}

	public void setWriteDate2(String writeDate2) {
		this.writeDate2 = writeDate2;
	}

	public String getNotice_img1() {
		return notice_img1;
	}

	public void setNotice_img1(String notice_img1) {
		this.notice_img1 = notice_img1;
	}

	public String getNotice_img2() {
		return notice_img2;
	}

	public void setNotice_img2(String notice_img2) {
		this.notice_img2 = notice_img2;
	}

	public int getNotice_seq() {
		return notice_seq;
	}
	
	public void setNotice_seq(int notice_seq) {
		this.notice_seq = notice_seq;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getWirter() {
		return wirter;
	}
	
	public void setWirter(String wirter) {
		this.wirter = wirter;
	}
	
	public String getContents() {
		return contents;
	}
	
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	public int getReadcount() {
		return readcount;
	}
	
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	
	public int getWriteDate() {
		return writeDate;
	}
	
	public void setWriteDate(int writeDate) {
		this.writeDate = writeDate;
	}

	
	
}
