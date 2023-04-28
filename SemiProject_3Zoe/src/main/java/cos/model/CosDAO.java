package cos.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import member.model.MemberVO;



public class CosDAO implements InterCosDAO {

	private DataSource ds;   // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool) 이다.
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 사용한 자원을 반납하는 close 메소드
	private void close() {
		try {		
			if(rs != null) {
				rs.close();
				rs = null;
			} 
			
			if(pstmt != null) {
				pstmt.close();
				pstmt = null;
			}
			
			if(conn != null) {
				conn.close();
				conn = null;
			}
			
		}catch (SQLException e) {
			e.printStackTrace();
		}	
		
	} // end of private void close() {}
	
	// 생성자
		public CosDAO() {
			try {
			    Context initContext = new InitialContext();
			    Context envContext  = (Context)initContext.lookup("java:/comp/env");
			    ds = (DataSource)envContext.lookup("jdbc/semi_oracle");
			} catch(NamingException e) {
				e.printStackTrace();
			}
		}
	
	// 강의 리스트 불러오기 메소드 생성하기
	@Override
	public List<CosVO> selectBySpecName(Map<String, String> paraMap) throws SQLException {
		
		List<CosVO> cosList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			
			// System.out.println("~~~~ 확인용 conn : " + conn);
			
			// System.out.println("확인용 " + paraMap.get("ClickData"));
			
			String sql = " select courseCode, coursename, price, saleprice, courseterm, teacher, img1, img2 "
					   + " from tbl_course "
					   + " where fk_categorycode = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, paraMap.get("ClickData"));

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				CosVO cvo = new CosVO();
				
				cvo.setCourseCode(rs.getString(1));		// 강의코드
				cvo.setCourseName(rs.getString(2));      // 강의명
				cvo.setPrice(rs.getInt(3)); 		 	 // 가격
				cvo.setSalePrice(rs.getInt(4));  		 // 할인가
				cvo.setCourseTerm(rs.getInt(5)); 		 // 강의기간
				cvo.setTeacher(rs.getString(6)); 		 // 강사명
				cvo.setImg1(rs.getString(7));		    // 강의썸네일
				cvo.setImg2(rs.getString(8));		    // 강의소개메인이미지 
				
				cosList.add(cvo);
	            
			} // end of while --------------------------------------------------------------------------------
			
			// System.out.println("확인용" + cosList.size());
			
		} finally {
			close();
		}
		
		return cosList;
	}

	
	// 강의삭제하기에서 체크된 강의들 삭제하는 메소드 구현하기
	@Override
	public int delectCos(Map<String, String> paraMap) throws SQLException {
		
		int n = 0;
		
		try {
			
			conn = ds.getConnection();
			
			String sql = " delete from tbl_course "
						+ "where courseCode in(?) ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, paraMap.get("checkedJoin"));
			
			n = pstmt.executeUpdate();
			
		} finally {
			close();
		}
		
		return n;
	} // end of public int delectCos(Map<String, String> paraMap) throws SQLException {} -----------------------
	
	
	
	// 찜한 강의 찜 테이블에 올려주는 메소드 생성하기
	@Override
	public int LikeTblAdd(String checkedHeart, String userid) throws SQLException {
	
		int n = 0;
		
		try {
			
			conn = ds.getConnection();
			
			conn.setAutoCommit(false);
			
			String sql = " insert into tbl_like(fk_courseCode, fk_userid)"
					   + " values(?, ?) ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, checkedHeart);
			pstmt.setString(2, userid);
			
			n = pstmt.executeUpdate();
					
			if(n==1) {
				conn.commit();
			}
			
		} catch(SQLIntegrityConstraintViolationException e) {
			
			conn.rollback();
			
		} finally {
			
			conn.setAutoCommit(true);
			close();
		}
			
		return n;
	} // end of public int LikeTblAdd(String checkedHeart, String userid) throws SQLException {} ----------------------

	
	// 찜 풀은 강의 찜 테이블에서 삭제해주는 메소드 생성하기
	@Override
	public int dislike(String discheckedHeart, String userid) throws SQLException {
		
		int n = 0;
		
		try {
			
			conn = ds.getConnection();
			
			conn.setAutoCommit(false);
			
			String sql = " delete from tbl_like "
					   + " where fk_courseCode = ? and fk_userid = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, discheckedHeart);
			pstmt.setString(2, userid);
			
			n = pstmt.executeUpdate();
					
			if(n==1) {
				conn.commit();
			}
				
		} catch(SQLIntegrityConstraintViolationException e) {
		
			conn.rollback();
			
		} finally {
			
			conn.setAutoCommit(true);
			close();
		}
			
		return n;
	}

}

	
	
	
