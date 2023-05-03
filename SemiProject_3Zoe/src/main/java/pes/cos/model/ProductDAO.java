package pes.cos.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import cos.model.CosVO;

public class ProductDAO implements InterProductDAO {
	
	
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
	public ProductDAO() {
		try {
			Context initContext = new InitialContext();
		    Context envContext  = (Context)initContext.lookup("java:/comp/env");
		    ds = (DataSource)envContext.lookup("jdbc/semi_oracle");		   
		}catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	

	// tbl_category 테이블에서 카테고리코드(categoryCode), 카테고리명(categoryName)을 조회해오기 
	@Override
	public List<HashMap<String, String>> getCategoryList() throws SQLException {
		List<HashMap<String, String>> categoryList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			
			String sql = " select categoryCode, categoryName "
					   + " from tbl_category "
					   + " order by categoryCode asc ";
			 
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();

			while(rs.next()) {

				HashMap<String, String> map = new HashMap<>();
				map.put("categoryCode", rs.getString(1));
				map.put("categoryName", rs.getString(2));
			//	System.out.println("확인용 map : "+map);
				
				categoryList.add(map);

			}//end of while------------------------------
			
		} finally {
			close();
		}
		
		return categoryList;
	}//end of public List<HashMap<String, String>> getCategoryList() throws SQLException-----------------------------

	
	
	// categoryCode가 tbl_category 테이블에 존재하는지 존재하지 않는지 알아오기
		@Override
		public boolean isExist_categoryCode(String categoryCode) throws SQLException {

			boolean isExist = false;
			
			try {
				conn = ds.getConnection();
				
				String sql = " select * "
						   + " from tbl_category "
						   + " where categoryCode = ? ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, categoryCode);
				
				rs = pstmt.executeQuery();
				
				isExist = rs.next(); // 행이 있으면(중복된 categoryCode) true,
						   			 // 행이 없으면(사용가능한 categoryCode) false
				
			} finally {
				close();
			}
			
			return isExist;
			
		}//end of public boolean isExit_cnum(String categoryCode)--------------------------------
	
	
		
		// 강의코드 채번 해오기
		@Override
		public String getCourseCodeOfProduct() throws SQLException {

			String courseCode = "";
			
			try {
				conn = ds.getConnection();
				
				String sql = " select seq_tbl_product_courseCode.nextval AS COURSECODE "
						   + " from dual ";
				
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				rs.next();
				
				courseCode = rs.getString(1);
				
			} finally {
				close();
			}
			
			return courseCode;
			
		}//end of public String getPnumOfProduct()---------------------------------
		
		
	
		// tbl_course 테이블에 insert 하기 
		@Override
		public int productInsert(CosVO cvo) throws SQLException {
			int result = 0;

		      try {
		         conn = ds.getConnection();

		         String sql = " insert into tbl_course (courseCode, fk_categoryCode, courseName, price, salePrice, teacher, courseTerm, img1, img2, courseList,point) "
		         		    + " values(seq_course_courseCode.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
		         
		         pstmt = conn.prepareStatement(sql);

		         pstmt.setString(1, cvo.getFk_categoryCode());
		         pstmt.setString(2, cvo.getCourseName());    
		         pstmt.setInt(3, cvo.getPrice()); 
		         pstmt.setInt(4, cvo.getSalePrice());    
		         pstmt.setString(5, cvo.getTeacher()); 
		         pstmt.setInt(6, cvo.getCourseTerm());
		         pstmt.setString(7, cvo.getImg1());
		         pstmt.setString(8, cvo.getImg2()); 
		         pstmt.setString(9, cvo.getCourseList());
		         pstmt.setInt(10, cvo.getPoint());
		            
		         result = pstmt.executeUpdate();

		      } finally {
		         close();
		      }
	      
	      return result;
		}//end of public int productInsert(CosVO pvo) throws SQLException-----------------------------------

	
	
		// tbl_product_imagefile 테이블에 제품의 추가이미지 파일명 insert 해주기  
		@Override
		public int product_imagefile_Insert(String courseCode, String attachFileName) throws SQLException {
			int result = 0;
		      
		      try {
		         conn = ds.getConnection();
		         
		         String sql = " insert into tbl_extraImg(imgNum, fk_courseCode, img3) "
		                    + " values(seq_extraImg_imgNum.nextval, ?, ?) ";
		         
		         pstmt = conn.prepareStatement(sql);
		         
		         pstmt.setString(1, courseCode);
		         pstmt.setString(2, attachFileName);
		         
		        result =  pstmt.executeUpdate();
		         
		      } finally {
		         close();
		      }
	      
	      return result;
		}//end of public int product_imagefile_Insert(int pnum, String attachFileName) throws SQLException---------

	
	
		// 강의코드를 가지고서 해당 제품의 정보를 조회해오기
		@Override
		public CosVO selectOneProductByCourseCode(String courseCode) throws SQLException {
			CosVO cvo = null;
		      
		      try {
		          conn = ds.getConnection(); 
		          
		          String sql = " select courseCode, fk_categoryCode, courseName, price, salePrice, teacher, courseTerm, courseList, img1, img2 " 
		                     + " from tbl_course " 
		                     + " where courseCode = ? ";
		          
		          pstmt = conn.prepareStatement(sql);
		          pstmt.setString(1, courseCode);
		          
		          rs = pstmt.executeQuery();
		          
		          if(rs.next()) {
		             
		        	 String fk_categoryCode = rs.getString(1);       // 카테고리코드
		        	 String courseName = rs.getString(2);   		 // 강의명
		        	 int price = rs.getInt(3);   				 	 // 판매금액
		        	 int salePrice = rs.getInt(4);   				 // 할인금액
		        	 String teacher = rs.getString(5);  			 // 강사명
		        	 int courseTerm = rs.getInt(6);   				 // 강의기간
		        	 String courseList = rs.getString(7);   		 // 강의목차
		        	 String img1 = rs.getString(8);  				 // 강의이미지1
		             String img2 = rs.getString(9);  				 // 강의이미지2 
		             
		             cvo = new CosVO(); 
		             
		             cvo.setCourseCode(courseCode);		
					 cvo.setCourseName(courseName);     
					 cvo.setPrice(price); 		
					 cvo.setSalePrice(salePrice); 		 	
					 cvo.setTeacher(teacher);  		
					 cvo.setCourseTerm(courseTerm); 		
					 cvo.setCourseList(courseList);  
					 cvo.setImg1(img1);		   
					 cvo.setImg2(img1);		    
					 
					 
		             
		          }// end of if-----------------------------
		          
		      } finally {
		         close();
		      }
		      
	      return cvo;      
	}//end of public CosVO selectOneProductByPnum(String pnum) throws SQLException-----------------------

	
	
	// 제품번호를 가지고서 해당 제품의 추가된 이미지 정보를 조회해오기
	@Override
	public List<String> getImagesByCourseCode(String courseCode) throws SQLException {
		List<String> imgList = new ArrayList<>();
	      
	      try {
	         conn = ds.getConnection();
	         
	         String sql = " select img3 "+
	                      " from tbl_extraImg "+
	                      " where fk_courseCode = ? ";
	         
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, courseCode);
	         
	         rs = pstmt.executeQuery();
	         
	         while(rs.next()) {
	            String img3 = rs.getString(1); // 이미지파일명 
	            imgList.add(img3); 
	         }
	         
	      } finally {
	         close();
	      }
	      
	      return imgList;
	}//end of public List<String> getImagesByCourseCode(String courseCode) throws SQLException------------

	
	
	

}
