package pes.notice.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import member.model.MemberVO;
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
			
			notice_seq = rs.getString("NOTICESEQ");
			
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
  
	         
	         String sql = " insert into tbl_notice (notice_seq, title, contents, readcount, writeDate, notice_img1, notice_img2) "
	         		    + " values(?, ?, ?, ?, default, ?, ?)";
	         
	         pstmt = conn.prepareStatement(sql);
	         
	         

	         pstmt.setInt(1, nvo.getNotice_seq());
	   //    System.out.println("notice_seq noticeAdd:"+nvo.getNotice_seq());
	         pstmt.setString(2, nvo.getTitle());  
	   //    System.out.println("title noticeAdd: "+nvo.getTitle());
	         pstmt.setString(3, nvo.getContents()); 
	   //    System.out.println("Contents noticeAdd:"+nvo.getContents());
	         pstmt.setInt(4, nvo.getReadcount());    
	   //    System.out.println("Readcount noticeAdd:"+ nvo.getReadcount());
	         pstmt.setString(5, nvo.getNotice_img1());
	         pstmt.setString(6, nvo.getNotice_img2());
	 
	         result = pstmt.executeUpdate();
	         System.out.println("result"+result);
	      } finally {
	         close();
	      }
    
    return result;
		
	}// end of public int noticeAdd(NoticeVO nvo) throws SQLException-----------------

	
	
	
	// tbl_notice SELECT
	public  ArrayList<NoticeVO> noticeList() throws SQLException {
		
		 ArrayList<NoticeVO> lists = new  ArrayList<NoticeVO>();
		 
		 String sql = " select * "
		 			+ " from tbl_notice "
		 			+ " order by notice_seq ";
		 
		 try {
			conn = ds.getConnection();
			
			 pstmt = conn.prepareStatement(sql);
			 rs = pstmt.executeQuery();
			 
			
				
			 while(rs.next()) {
				 NoticeVO nvo = new NoticeVO();
				 nvo.setNotice_seq(rs.getInt("notice_seq"));
				 nvo.setTitle(rs.getString("title"));
				 nvo.setWriteDate2(rs.getString("writedate").substring(0,10));
				 //System.out.println("rs.getString(\"WRITEDATE\").substring(0,10)"+rs.getString("WRITEDATE").substring(0,10));
				 nvo.setReadcount(rs.getInt("readcount"));
				 
				 lists.add(nvo);
			 }
			 
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
	         close();
	    }
		 return lists;
		
	}// end of 

	
	
	// notice_seq 값을 받아 공지사항 본문내용 알아오기
	@Override
	public NoticeVO noticeDetailAction(String notice_seq) throws SQLException  {

		 NoticeVO notice = null;
		 
		 try {
				conn = ds.getConnection();
				
				String sql = " select notice_seq, title, contents, writeDate, readcount, notice_img1, notice_img1 "
						   + " from tbl_notice "
						   + " where notice_seq = ? ";
		
			 pstmt = conn.prepareStatement(sql);
			 
			 pstmt.setString(1, notice_seq);
			 
			 rs = pstmt.executeQuery();

			 if(rs.next()) {

				 notice = new NoticeVO();
				 
				 notice.setNotice_seq(rs.getInt(1));
				 notice.setTitle(rs.getString(2));
				 notice.setContents(rs.getString(3));
				 notice.setWriteDate2(rs.getString(4).substring(0,10));
				 notice.setReadcount(rs.getInt(5));
				 notice.setNotice_img1(rs.getString(6));
				 notice.setNotice_img2(rs.getString(7));
				 
			 }
			 
	
		 } finally {
			close();
		 }
		 
		 return notice;
		
	}


	
	
	
	
	
	
	
	
	
	
		
	
	
	
}
