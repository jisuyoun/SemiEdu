package hyh.cos.model;

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

import cos.model.CosVO;
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

	// 주문번호(시퀀스 seq_tbl_order 값)을 채번해오는 것
   @Override
   public int getSeq_tbl_order() throws SQLException {
      
      int seq = 0;
      
         try {
            conn = ds.getConnection();
            
            String sql = " select seq_order_orderCode.nextval AS seq "
                     + " from dual ";
            
            pstmt = conn.prepareStatement(sql);
            
            rs = pstmt.executeQuery();
            
            rs.next();
            
            seq = rs.getInt("seq");
                                 
         } finally {
            close();
         }         
      
      return seq;
	      
   	}// end of public int getSeq_tbl_order()

   
   // Transaction 처리를 해주는 메소드
	@Override
	public int orderAdd(HashMap<String, Object> paraMap) throws SQLException {
		
		
	      int isSuccess = 1;
	      int n1 = 1, n2 = 1, n3 = 1, n5 = 1;
	      
	      try {
	         conn = ds.getConnection();
	         
	         conn.setAutoCommit(false);
	         
	         System.out.println("진입");
	         // 2. 주문 테이블에 채번해온 주문전표, 로그인한 사용자, 현재시각을 insert 하기(수동커밋처리)
	         String sql = " insert into tbl_order(odrCode, fk_userid, totalPrice, orderPoint, usePoint, orderday) " // orderPoint,
	                    + " values(?, ?, ?, (select nvl(max(orderPoint),0), (select nvl(max(usePoint),0) default) "; // ?,
	         
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, (String)paraMap.get("odrcode"));
	         pstmt.setString(2, (String)paraMap.get("userid"));
	         pstmt.setInt(3, (int)paraMap.get("totalPrice"));
	         //pstmt.setInt(4, Integer.parseInt((String)paraMap.get("orderPoint")) );
	         
	         n1 = pstmt.executeUpdate();
	         System.out.println("~~~ 확인용 n1 : " + n1);
	         
	         // 3. 주문상세 테이블에 채번해온 주문전표, 제품번호, 주문량, 주문금액을 insert 하기(수동커밋처리)
	         if(n1 == 1) {
	            String[] odrcode_arr = (String[]) paraMap.get("odrcode");   // 제품번호
	            String[] sum_totalPrice_arr = (String[]) paraMap.get("totalPrice");   // 주문금액
	            
	            int cnt = 0;
	            for(int i=0; i<odrcode_arr.length; i++) {
	               sql = " insert into tbl_detailOrder(orderNum, fk_orderCode, fk_courseCode, coursePrice, startDate, endDate) "  
	                           + " values(seq_tbl_orderdetail.nextval, ?, to_number(?), to_number(?), to_number(?), default, (select nvl(max(usePoint),60)) ";
	               
	               pstmt = conn.prepareStatement(sql);
	               pstmt.setString(1, (String)paraMap.get("odrcode"));
	               pstmt.setString(2, odrcode_arr[i]);
	               pstmt.setString(3, sum_totalPrice_arr[i]);
	               
	               pstmt.executeUpdate();
	               cnt++;
	               
	            }// end of for
	            
	            if(cnt == odrcode_arr.length) {
	               n2 = 1;
	            }
	            System.out.println("~~~ 확인용 n2 : " + n2);
	            
	            
	            
	         }// end of if
	           
	         
	         
				/*
				 * // 6. 회원 테이블에서 로그인한 사용자의 point 를 sumtotalPoint 만큼 더하기(update)(수동커밋처리) if(n2 >
				 * 0) {
				 * 
				 * sql = " update tbl_member set point = point + ? " + "where userid = ? ";
				 * 
				 * pstmt = conn.prepareStatement(sql);
				 * 
				 * pstmt.setInt(1, Integer.parseInt((String)paraMap.get("sum_totalPoint")) );
				 * pstmt.setString(2, (String)paraMap.get("userid") );
				 * 
				 * n5 = pstmt.executeUpdate();
				 * 
				 * System.out.println("~~~ 확인용 n5 : " + n5); // ~~~ 확인용 n5 : 1
				 * 
				 * }// end of if
				 */	         
	         
	         
	         // 7. **** 모든처리가 성공되었을시 commit 하기(commit) **** 
	         if( n1*n2 > 0) {
	            
	            conn.commit();
	            
	            conn.setAutoCommit(true); // 자동커밋으로 전환
	            
	            System.out.println("~~~ 확인용 n1*n2*n3*n4*n5 : " + (n1*n2*n5) );
	            
	            isSuccess = 1;
	            
	         }// end of if
	         
	         
	      } catch (SQLException e) {
	         
	         // 8. **** SQL 장애 발생시 rollback 하기(rollback) ****
	         conn.rollback();
	         
	         conn.setAutoCommit(true); // 자동커밋으로 전환
	         
	         isSuccess = 0;
	         
	      } finally {
	         close();
	      }
	      
	      return isSuccess;
	   }// end of public int orderAdd(HashMap<String, Object> paraMap)

	@Override
	public List<CosVO> getJumunProductList(String pnumes) throws SQLException {
		
		
		List<CosVO> cosList = new ArrayList<>();
	    
	    try {
	       conn = ds.getConnection();
	       
	       String sql =  " select courseCode, courseName, teacher, img1, img2, price, salePrice "
	                 + "   FROM tbl_course "
	                 + " where courseCode in ("+pnumes+") ";
	       
	       pstmt = conn.prepareStatement(sql);
	       
	       rs = pstmt.executeQuery();
	       
	       while( rs.next() ) {
	          
	    	   CosVO cvo = new CosVO();
	          
	          cvo.setCourseCode(rs.getString("courseCode"));                  // 제품번호
	          cvo.setCourseName(rs.getString("courseName"));             // 제품명
	             cvo.setTeacher(rs.getString("teacher"));       // 제조회사명
	              cvo.setImg1(rs.getString("img1"));         // 제품이미지1   이미지파일명
	             cvo.setImg2(rs.getString("img2"));         // 제품이미지2   이미지파일명
	             cvo.setPrice(rs.getInt("price"));                // 제품 정가
	             cvo.setSalePrice(rs.getInt("salePrice"));        // 제품 판매가(할인해서 팔 것이므로)       
	             
	             cosList.add(cvo);
	       }; // end of while( rs.next() )
	       
	    } finally {
	       close();
	    }
	    
	    return cosList;
	}
	
	
	


	

}

	
	
	
