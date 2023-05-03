package pes.notice.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import pes.notice.model.NoticeVO;

public class NoticeDAO implements InterNoticeDAO {

	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool) 이다. 
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 사용한 자원을 반납하는 close() 메소드 생성하기
	private void close() {
		
		try {
			if(rs != null)    {rs.close(); rs=null;}
			if(pstmt != null) {pstmt.close(); pstmt=null;}
			if(conn != null)  {conn.close(); conn=null;}
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 생성자
	public NoticeDAO() {
		try {
			Context initContext = new InitialContext();
		    Context envContext  = (Context)initContext.lookup("java:/comp/env");
		    ds = (DataSource)envContext.lookup("jdbc/semi_oracle");		   
		}catch (NamingException e) {
			e.printStackTrace();
		}
	}

	
	
	// 글번호 채번 해오기
	@Override
	public String getNotice_seqOfProduct() throws SQLException {

		String notice_seq = "";
		
		try {
			conn = ds.getConnection();
			
			String sql = " select seq_notice.nextval AS NOTICESEQ "
					   + " from dual ";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			rs.next();
			
			notice_seq = rs.getString(1);
			
		} finally {
			close();
		}
		
		return notice_seq;
		
	}// end of public String getNotice_seqOfProduct() throws SQLException-----

	
	
	// tbl_notice 테이블에 insert 하기 
	@Override
	public int noticeAdd(NoticeVO nvo) throws SQLException {
		int result = 0;

	      try {
	         conn = ds.getConnection();

	         String sql = " insert into tbl_notice (notice_seq, title, contents, readcount, writeDate) "
	         		    + " values(seq_notice.nextval, ?, ?, ?, ?) ";
	         
	         pstmt = conn.prepareStatement(sql);


	         pstmt.setString(1, nvo.getTitle());    
	         pstmt.setString(2, nvo.getContents()); 
	         pstmt.setInt(3, nvo.getReadcount());    
	         pstmt.setInt(4, nvo.getWriteDate()); 
	 
	         result = pstmt.executeUpdate();

	      } finally {
	         close();
	      }
    
    return result;
		
	}// end of public int noticeAdd(NoticeVO nvo) throws SQLException-----------------

	
	
	// tbl_product_imagefile 테이블에 제품의 추가이미지 파일명 insert 해주기  
	@Override
	public int notice_imagefile_Insert(String notice_seq, String attachFileName) throws SQLException {
		int result = 0;
	      
	      try {
	         conn = ds.getConnection();
	         
	         String sql = " insert into tbl_extraImg(imgNum, notice_seq, img3) "
	                    + " values(seq_extraImg_imgNum.nextval, ?, ?) ";
	         
	         pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setString(1, notice_seq);
	         pstmt.setString(2, attachFileName);
	         
	        result =  pstmt.executeUpdate();
	         
	      } finally {
	         close();
	      }
    
    return result;
		
	}// end of public void notice_imagefile_Insert(String notice_seq, String attachFileName) throws SQLException------



	
	
	
	
	
	
	
	
	
	
		
	
	
	
}
