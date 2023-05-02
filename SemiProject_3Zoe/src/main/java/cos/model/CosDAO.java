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
	public int delectCos(Map<String, Object> paraMap) throws SQLException {
		
		int n = 0;
		
		String[] checkedArr = (String[]) paraMap.get("checkedArr"); 
		
		String sql = "";
		
		try {
			
			conn = ds.getConnection();
			
			for(int i=0; i<checkedArr.length; i++) {
				
				sql = " delete from tbl_course "
					+ " where courseCode = ? ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, checkedArr[i]);
				
				n = pstmt.executeUpdate();
				
				
			} // end of for(int i=0; i<pnum_arr.length; i++) {} -----------------------------
		
		} finally {
			close();
		}
		
		return n;
	} // end of public int delectCos(Map<String, String> paraMap) throws SQLException {} -----------------------
	
	
	
	
	// 찜한 강의 알아오기 메소드 생성하기
	@Override
	public List<CosVO> SelectLike(Map<String, String> paraMap) throws SQLException {

		List<CosVO> cosList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			
			String sql = " select fk_courseCode "
					   + " from tbl_like "
					   + " where fk_userid = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, paraMap.get("userid"));

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				CosVO cvo = new CosVO();
				
				cvo.setCourseCode(rs.getString(1));		// 강의코드
				
				cosList.add(cvo);
	            
			} // end of while --------------------------------------------------------------------------------
			
			// System.out.println("확인용" + cosList.size());
			
		} finally {
			close();
		}
		
		return cosList;
	}
	
	
	
	// 찜한 강의 찜 테이블에 올려주는 메소드 생성하기
	@Override
	public int LikeTblAdd(Map<String, String> paraMap) throws SQLException {
		
		int n = 0;
		
		try {
			System.out.println(paraMap.get("checkedHeart"));
			
			conn = ds.getConnection();
			
			/* conn.setAutoCommit(false); */
			
			String sql = " insert into tbl_like(fk_courseCode, fk_userid) values(?, ?) ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("checkedHeart"));
			pstmt.setString(2, paraMap.get("userid"));
			
			n = pstmt.executeUpdate();
			
			System.out.println("dao n값 : " + n);
			
			
		} finally {
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

	
	// 물품 상세보기에서 물품 보여주는 메소드 생성하기
	@Override
	public CosVO selectOneProductByCourseCode(String courseCode)  throws SQLException {
		
		CosVO cvo = null;
		
		try {
			
			conn = ds.getConnection();
			
			String sql = " select courseName, price, salePrice, courseTerm, courseList, img1, img2, teacher"
					   + " from tbl_course "
					   + " where courseCode = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, courseCode);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String courseName = rs.getString(1);
				int price = rs.getInt(2);
				int salePrice = rs.getInt(3);
				int courseTerm = rs.getInt(4);
				String courseList = rs.getString(5);
				String img1 = rs.getString(6);
				String img2 = rs.getString(7);
				String teacher = rs.getString(8);
				
				cvo = new CosVO();
				
				cvo.setCourseCode(courseCode);
				cvo.setCourseName(courseName);
				cvo.setPrice(price);
				cvo.setSalePrice(salePrice);
				cvo.setCourseTerm(courseTerm);
				cvo.setCourseList(courseList);
				cvo.setTeacher(teacher);
				
				cvo.setImg1(img1);
				cvo.setImg2(img2);
				
			}
		
		} finally {
			close();
		}
		
		return cvo;
	}

	// 비슷한 강의 보여주는 메소드 생성하기
	@Override
	public List<CosVO> CategoryListByCourseCode(Map<String, String> paraMap) throws SQLException {
		
		List<CosVO> cosList = null;
		
		try {
			
			conn = ds.getConnection();
			
			String sql = " select C.courseName, C.img1, C.img2, E.img3 "
					   + " from tbl_course C join tbl_extraImg E "
					   + " on C.fk_categoryCode = E.fk_courseCode "
					   + " where C.fk_categoryCode = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("courseCode"));
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String courseName = rs.getString(1);
				String img1 = rs.getString(2);
				String img2 = rs.getString(3);
				String img3 = rs.getString(4);
				
				CosVO cvo = new CosVO();
				
				cvo.setCourseName(rs.getString("courseName"));
				cvo.setImg1(rs.getString("img1"));
				cvo.setImg2(rs.getString("img2"));
				
				ImgVO ivo = new ImgVO();
				ivo.setImg3(rs.getString("img3"));
				cvo.setImgvo(ivo);
				
				cosList.add(cvo);
				
			}
			
			
		} finally {
			close();
		}
		
		return cosList;
	}

	
	// tbl_category 테이블에서 categoryCode, categoryName 조회해오기 
	@Override
	   public List<Map<String, String>> getCategoryList() throws SQLException {
	      
	      List<Map<String, String>> categoryList = new ArrayList<>();
	      
	      try {
	         conn = ds.getConnection();
	         
	         String sql =  " select categoryCode, categoryName "
	                  + " from tbl_category "
	                  + " order by categoryCode asc ";
	            
	         pstmt = conn.prepareStatement(sql);
	         
	         rs = pstmt.executeQuery();
	         
	         while(rs.next()) {
	            
	            Map<String, String> map = new HashMap<>();
	            map.put("categoryCode", rs.getString(1));
	            map.put("categoryName", rs.getString(2));
	            
	            categoryList.add(map);
	            
	         }// end of while-----
	               
	      } finally {
	         close();
	      }
	      
	      return categoryList;
	   }// end of public List<Map<String, String>> getCategoryList()

	
	// 장바구니 페이지에 정보 보내기 메소드 생성하기
	@Override
	public int ShoppingBagAdd(Map<String, String> paraMap) throws SQLException {
		
		int n = 0;
		
		try {
			
			conn = ds.getConnection();
			
			String sql = " select * "
					   + " from tbl_shoppingbag "
					   + " where fk_courseCode = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("courseCode"));
			
			rs = pstmt.executeQuery();
			
			if(!rs.next()) {
				sql = " insert into tbl_shoppingbag(shoppingbagNum, fk_userid, fk_courseCode) "
					 + " values(seq_shoppingbag_shoppingbagNum.nextval, ?, ?) ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, paraMap.get("userid"));
				pstmt.setString(2, paraMap.get("courseCode"));
				
				n = pstmt.executeUpdate();
				
			}
			else {
				n = 0;
			}
			
		} finally {
			close();
		}
		
		return n;
	}

	
	// 장바구니 리스트 보기 메소드 생성하기
	@Override
	public List<CosVO> ShoppingBagList(Map<String, String> paraMap) throws SQLException {
		
		List<CosVO> cvoList = new ArrayList<>();
		
		try {
			
			conn = ds.getConnection();
			
			String sql = " select C.courseCode, C.courseName, C.price, C.salePrice "
					   + " from tbl_course C join tbl_shoppingbag S "
					   + " on C.courseCode = S.fk_courseCode "
					   + " where S.fk_userid = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("userid"));
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				CosVO cvo = new CosVO();
				
				cvo.setCourseCode(rs.getString(1));
				cvo.setCourseName(rs.getString(2));
				cvo.setPrice(rs.getInt(3));
				cvo.setSalePrice(rs.getInt(4));
				
				cvoList.add(cvo);

			}
			
		} finally {
			close();
		}
		
		return cvoList;
	}

	// 장바구니에 체크된 강의들 가격 알아오는 메소드 생성하기
	@Override
	public List<CosVO> SelectPrice(Map<String, Object> paraMap) throws SQLException {
		
		List<CosVO> cvoList = new ArrayList<>();
		
		String[] courseCodeArr = (String[]) paraMap.get("courseCodeArr");
		
		CosVO cvo = null;
		
		String sql = "";
		
		String courseCode = "";
		
		try {
			
			courseCode = String.join(",", (String []) paraMap.get("courseCodeArr"));
			
			if (courseCodeArr.length > 0) {
	
				conn=ds.getConnection();
				
				for(int i=0; i<courseCodeArr.length; i++) {
					
					sql = " select courseCode, price, salePrice "
						+ " from tbl_course "
						+ " where courseCode = ? ";
				
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, courseCodeArr[i]);
					
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						
						cvo = new CosVO();
						
						cvo.setCourseCode(rs.getString(1));
						cvo.setPrice(rs.getInt(2));
						cvo.setSalePrice(rs.getInt(3));
						
						cvoList.add(cvo);
		
					}
					
				} // end of for

			} // end of if
			
		
		} finally {
			close();
		}
		
		return cvoList;
	}

	
	// 장바구니에 체크된 강의 선택삭제하기 메소드 생성하기
	@Override
	public int BagSelectDelete(Map<String, Object> paraMap) throws SQLException {
		
		int n = 0;
		
		String[] courseCodeArr = (String[]) paraMap.get("courseCodeArr");
		
		String sql = "";
		
		try {
			
			conn = ds.getConnection();
			
			for(int i=0; i<courseCodeArr.length; i++) {
				
				sql = " delete from tbl_shoppingbag "
				    + " where fk_courseCode = ? and fk_userid = ? ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, courseCodeArr[i]);
				pstmt.setString(2, (String) paraMap.get("userid"));
				
				n = pstmt.executeUpdate();
				
			} // end of for
			
		} finally {
			close();
		}
		
		return n;
	}

	
	// 장바구니에 있는 모든 강의 삭제하기 메소드 생성하기
	@Override
	public int BagAllDelete(String userid) throws SQLException {

		int n = 0;
				
		try {
			
			conn = ds.getConnection();
			
			String sql = " delete from tbl_shoppingbag "
					   + " where fk_userid = ? "; 
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			
			n = pstmt.executeUpdate();
			
		} finally {
			close();
		}
		
		return n;
	}


	
	

}

	
	
	
