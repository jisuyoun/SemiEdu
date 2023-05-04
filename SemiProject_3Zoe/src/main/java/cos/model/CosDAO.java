package cos.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;



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
		
		CosVO cvo = null;
		
		try {
			conn = ds.getConnection();
			
			// System.out.println("~~~~ 확인용 conn : " + conn);
			
			// System.out.println("확인용 " + paraMap.get("ClickData"));
			
			String sql = " select courseCode, fk_categoryCode, coursename, price, saleprice, courseterm, teacher, img1, img2, point "
					   + " from tbl_course "
					   + " where fk_categorycode = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, paraMap.get("ClickData"));

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				cvo = new CosVO();
				
				cvo.setCourseCode(rs.getString(1));		// 강의코드
				cvo.setFk_categoryCode(rs.getString(2)); // 카테고리코드
				cvo.setCourseName(rs.getString(3));      // 강의명
				cvo.setPrice(rs.getInt(4)); 		 	 // 가격
				cvo.setSalePrice(rs.getInt(5));  		 // 할인가
				cvo.setCourseTerm(rs.getInt(6)); 		 // 강의기간
				cvo.setTeacher(rs.getString(7)); 		 // 강사명
				cvo.setImg1(rs.getString(8));		    // 강의썸네일
				cvo.setImg2(rs.getString(9));		    // 강의소개메인이미지 
				cvo.setPoint(rs.getInt(10));         // 포인트
				
				cosList.add(cvo);
	            
			} // end of while --------------------------------------------------------------------------------
			
			// System.out.println("확인용" + cosList.size());
			
		} finally {
			close();
		}
		
		return cosList;
	}

	
	
	// 선택된 정렬로 만드는 메소드 생성하기
	@Override
	public List<CosVO> SortDisplay(Map<String, String> paraMap) throws SQLException {
		
		List<CosVO> cosList = new ArrayList<>();
		
		CosVO cvo = null;
		
		String sort = paraMap.get("sort");
		
		// System.out.println("dao에 위치한 : "+sort);
		
		try {
			conn = ds.getConnection();
			
			String sql = " select courseCode, fk_categoryCode, coursename, price, saleprice, courseterm, teacher, img1, img2, point "
					   + " from tbl_course "
					   + " where fk_categorycode = ? ";
			
			if("1".equals(sort)) {
				sql += " order by price asc ";
			}
			else if("2".equals(sort)) {
				sql += " order by price desc ";
			}
			else if("3".equals(sort)) {
				sql += " order by courseterm desc ";
			}
			else if("4".equals(sort)) {
				sql += " order by point desc ";
			}
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, paraMap.get("courseCode"));
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				cvo = new CosVO();
				
				cvo.setCourseCode(rs.getString(1));		// 강의코드
				cvo.setFk_categoryCode(rs.getString(2)); // 카테고리코드
				cvo.setCourseName(rs.getString(3));      // 강의명
				cvo.setPrice(rs.getInt(4)); 		 	 // 가격
				cvo.setSalePrice(rs.getInt(5));  		 // 할인가
				cvo.setCourseTerm(rs.getInt(6)); 		 // 강의기간
				cvo.setTeacher(rs.getString(7)); 		 // 강사명
				cvo.setImg1(rs.getString(8));		    // 강의썸네일
				cvo.setImg2(rs.getString(9));		    // 강의소개메인이미지 
				cvo.setPoint(rs.getInt(10));         // 포인트
				
				cosList.add(cvo);
	            
			} // end of while --------------------------------------------------------------------------------
			
			// System.out.println("확인용" + cosList.size());
			
		} finally {
			close();
		}
		
		return cosList;
		
	} // end of public CosVO SortDisplay(String sort) throws SQLException {} -------------------------------
		
	
	
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
	public int addLike(Map<String, String> paraMap) throws SQLException {
		
		int result = 0;
		
		int n = 0;
		
		String sql = "";
		
		try {
			
			conn = ds.getConnection();
			
			/* conn.setAutoCommit(false); */
			
			sql = " insert into tbl_like(fk_courseCode, fk_userid) "
				+ " values(?, ?) ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("courseCode"));
			pstmt.setString(2, paraMap.get("userid"));
			
			n = pstmt.executeUpdate();
			
			if( n == 1 ) {
				result = 1;
			}
			
		} catch (SQLException e) {
			
			sql = " delete from tbl_like "
				+ " where fk_courseCode = ? and fk_userid = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("courseCode"));
			pstmt.setString(2, paraMap.get("userid"));
			
			n = pstmt.executeUpdate();
			
			if( n == 1 ) {
				result = 0;
			}
			
		}finally {
			close();
		}
			
		return result;
	} // end of public int addLike(String checkedHeart, String userid) throws SQLException {} ----------------------

	
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
			
			String sql = " select courseName, fk_categoryCode, price, salePrice, courseTerm, courseList, img1, img2, teacher, point "
					   + " from tbl_course "
					   + " where courseCode = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, courseCode);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String courseName = rs.getString(1);
				String fk_categoryCode = rs.getString(2);
				int price = rs.getInt(3);
				int salePrice = rs.getInt(4);
				int courseTerm = rs.getInt(5);
				String courseList = rs.getString(6);
				String img1 = rs.getString(7);
				String img2 = rs.getString(8);
				String teacher = rs.getString(9);
				int point = rs.getInt(10);
				
				cvo = new CosVO();
				
				cvo.setCourseCode(courseCode);
				cvo.setFk_categoryCode(fk_categoryCode);
				cvo.setCourseName(courseName);
				cvo.setPrice(price);
				cvo.setSalePrice(salePrice);
				cvo.setCourseTerm(courseTerm);
				cvo.setCourseList(courseList);
				cvo.setTeacher(teacher);
				cvo.setImg1(img1);
				cvo.setImg2(img2);
				cvo.setPoint(point);
				
				
			}
		
		} finally {
			close();
		}
		
		return cvo;
	}

	// 비슷한 강의 추천하기 메소드 생성하기
	@Override
	public List<CosVO> RecommendCos(Map<String, String> paraMap) throws SQLException {
		
		List<CosVO> cvoList = new ArrayList<>();
		
		try {
			
			conn = ds.getConnection();
			
			String sql = " select courseCode, fk_categoryCode, courseName, img1 "
					   + " from tbl_course "
					   + " where fk_categoryCode = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("fk_categoryCode"));
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				CosVO cvo = new CosVO();
				
				cvo.setCourseCode(rs.getString(1));
				cvo.setFk_categoryCode(rs.getString(2));
				cvo.setCourseName(rs.getString(3));
				cvo.setImg1(rs.getString(4));
				
				cvoList.add(cvo);
			}
			
		} finally {
			close();
		}
		
		return cvoList;
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
					   + " where fk_courseCode = ? and fk_userid = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("courseCode"));
			pstmt.setString(2, paraMap.get("userid"));
			
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

	// 추가이미지 불러오기 메소드 생성하기
	@Override
	public List<ImgVO> imgPlus(Map<String, String> paraMap) throws SQLException {
		
		List<ImgVO> imgList =  new ArrayList<>();
		
		try {
			
			conn = ds.getConnection();
			
			String sql = " select img3 "
					   + " from tbl_extraImg "
					   + " where fk_courseCode = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("courseCode"));
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ImgVO ivo = new ImgVO();
				
				ivo.setImg3(rs.getString(1));		// 강의코드
				
				imgList.add(ivo);
				
			}
			
		} finally {
			close();
		}
		
		return imgList;
	}

	
	// 검색하기 기능
	@Override
	public List<CosVO> searchCos(Map<String, String> paraMap) throws SQLException {
		
		List<CosVO> cosList = new ArrayList<>();
		
		String search = paraMap.get("search");
		String keyWord = paraMap.get("keyWord");
		
		try {
			
			conn = ds.getConnection();
			
			String sql = " select courseCode, fk_categoryCode, coursename, price, saleprice, courseterm, teacher, img1 "
					   + " from tbl_course ";
			
			if(search != null && !search.trim().isEmpty()) {
				sql += " where " + keyWord + " like '%'|| ? || '%' ";
				// colname 이 ?가 되지 않는 이유는 컬럼명과 테이블명은 위치홀더로 사용이 불가하기 때문이다.
				// 위치홀더로 들어오는 것은 오로지 컬럼명과 테이블명이 아닌 데이터값이다.
				
			}
			
			pstmt = conn.prepareStatement(sql);
			
			if(search != null && !search.trim().isEmpty()) {
				pstmt.setString(1, search);
			}
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				CosVO cvo = new CosVO();
				
				cvo.setCourseCode(rs.getString(1));
				cvo.setFk_categoryCode(rs.getString(2));
				cvo.setCourseName(rs.getString(3));
				cvo.setPrice(rs.getInt(4));
				cvo.setSalePrice(rs.getInt(5));
				cvo.setCourseTerm(rs.getInt(6));
				cvo.setTeacher(rs.getString(7));
				cvo.setImg1(rs.getString(8));
							
				cosList.add(cvo);
				
			} // end of while(rs.next()) {}  -----------------------------------------------------------------------
		
		} finally {
			close();
		}
		
		return cosList;
	}

	
	// 리뷰 불러오기 메소드 생성하기
	@Override
	public List<YJS_ReviewVO> ReviewShow(Map<String, String> paraMap) throws SQLException {
		
		List<YJS_ReviewVO> revoList = new ArrayList<>();
		
		YJS_ReviewVO rvo = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = " select fk_userid, reviewTitle, review, reviewPoint, writeDay "
					   + " from tbl_reviewBoard "
					   + " where fk_courseCode = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, paraMap.get("courseCode"));

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				rvo = new YJS_ReviewVO();
				
				rvo.setFk_userid(rs.getString(1));
				rvo.setReviewTitle(rs.getString(2));
				rvo.setReview(rs.getString(3));
				rvo.setReviewPoint(rs.getInt(4));
				rvo.setWriteDay(rs.getString(5));
				
				revoList.add(rvo);
	            
			} // end of while --------------------------------------------------------------------------------
			
			// System.out.println("확인용" + cosList.size());
			
		} finally {
			close();
		}
		
		return revoList;
	}
	
	

	
	


	
	

}

	
	
	
