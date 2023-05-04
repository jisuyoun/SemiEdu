package ljh.order.model;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import cos.model.CosVO;
import ljh.order.model.InterOrderDAO;
import util.security.AES256;
import util.security.SecretMyKey;

public class OrderDAO  implements InterOrderDAO {

	
	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool) 이다.    
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	
	
	// 사용한 자원을 반납하는 close() 메소드 생성하기
	private void close() {
	   try {
 		    if(rs != null)     {rs.close();    rs=null;}
 		    if(pstmt != null)  {pstmt.close(); pstmt=null;}
 		    if(conn != null)   {conn.close(); conn=null;}
	   } catch(SQLException e)  {
		   e.printStackTrace();
	   }
	}
	
	// 생성자
	public OrderDAO() {
		try {
		     Context initContext = new InitialContext();
	         Context envContext  = (Context)initContext.lookup("java:/comp/env");
	         ds = (DataSource)envContext.lookup("jdbc/semi_oracle");

	         
		} catch(NamingException e) {
			e.printStackTrace();
		}
	}

	
	// 로그인한 사람의 구매리스트 가져오기
	@Override
	public List<OrderVO> getOrderList(String userid) throws SQLException {
		
		List<OrderVO> orderList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			
			String sql = " select orderCode,orderday, totalPrice, count(*), max(courseName) "
					+ " from ( "
					+ " select  O.orderCode, O.orderday, O.totalPrice, C.courseName "
					+ " from tbl_order O "
					+ " join tbl_detailOrder D on O.orderCode = D.fk_orderCode "
					+ " join tbl_course C on D.fk_courseCode = C.courseCode "
					+ " where O.fk_userid= ? "
					+ " )  "
					+ " group by orderCode,orderday, totalPrice"
					+ "  order by orderday " ;
			
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {

				OrderVO order = new OrderVO();
				order.setOrderCode(rs.getString(1));
				order.setOrderday(rs.getString(2));
				order.setTotalPrice(rs.getInt(3));
				order.setCount(rs.getInt(4));
				order.setFirstCourseName(rs.getString(5));
				
				orderList.add(order);
				
			}
			
		} finally {
			close();
		}
		
		return orderList;
	}

	
	// 로그인한 사람이 선택한 구매리스트 가져오기
	@Override
	public OrderVO getOrder(Map<String, String> paraMap) throws SQLException {
		
		OrderVO order = new OrderVO();
		
		try {
			conn = ds.getConnection();
			
			String sql = " select orderCode,orderday, totalPrice, count(*), max(courseName) "
					+ " from ( "
					+ " select  O.orderCode, O.orderday, O.totalPrice, C.courseName "
					+ " from tbl_order O "
					+ " join tbl_detailOrder D on O.orderCode = D.fk_orderCode "
					+ " join tbl_course C on D.fk_courseCode = C.courseCode "
					+ " where O.fk_userid= ?  and O.orderCode = ? "
					+ " )  "
					+ " group by orderCode,orderday, totalPrice " ;
			
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, paraMap.get("userid"));
			pstmt.setString(2, paraMap.get("orderCode"));
			
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {

				order.setOrderCode(rs.getString(1));
				order.setOrderday(rs.getString(2));
				order.setTotalPrice(rs.getInt(3));
				order.setCount(rs.getInt(4));
				order.setFirstCourseName(rs.getString(5));
			}
			
		} finally {
			close();
		}
		
		return order;
	}

	
	// 로그인한 사람이 선택한 구매 상세 목록 가져오기
	@Override
	public List<OrderVO> getOrderDetail(Map<String, String> paraMap) throws SQLException {
		
		List<OrderVO> orderList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			
			String sql = " select  O.orderCode, O.orderday, O.totalPrice, C.courseName, C.price, C.salePrice "
					+ " from tbl_order O "
					+ " join tbl_detailOrder D on O.orderCode = D.fk_orderCode "
					+ " join tbl_course C on D.fk_courseCode = C.courseCode "
					+ " where O.fk_userid= ? and O.orderCode = ? " ;
			
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, paraMap.get("userid"));
			pstmt.setString(2, paraMap.get("orderCode"));
			
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				OrderVO order = new OrderVO();
				
				order.setOrderCode(rs.getString(1));
				order.setOrderday(rs.getString(2));
				order.setTotalPrice(rs.getInt(3));
				order.setCourseName(rs.getString(4));
				order.setPrice(rs.getInt(5));
				order.setSalePrice(rs.getInt(6));
				
				orderList.add(order);
			}
			
		} finally {
			close();
		}
		
		return orderList;
	}

	
	// 로그인한 사람이 검색한 날짜 중에 구매내역 보여주기
	@Override
	public List<OrderVO> getOrderList(Map<String, String> paraMap) throws SQLException {
		
		List<OrderVO> orderList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			
			String sql = " select orderCode,orderday, totalPrice, count(*), max(courseName) "
					+ " from ( "
					+ " select  O.orderCode, O.orderday, O.totalPrice, C.courseName "
					+ " from tbl_order O "
					+ " join tbl_detailOrder D on O.orderCode = D.fk_orderCode "
					+ " join tbl_course C on D.fk_courseCode = C.courseCode "
					+ " where O.fk_userid= ?  and O.orderCode = ? "
					+ " )  "
					+ " group by orderCode,orderday, totalPrice ";
			
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, paraMap.get("userid"));
			pstmt.setString(2, paraMap.get("orderCode"));
			
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				OrderVO order = new OrderVO();
				
				order.setOrderCode(rs.getString(1));
				order.setOrderday(rs.getString(2));
				order.setTotalPrice(rs.getInt(3));
				order.setCourseName(rs.getString(4));
				order.setPrice(rs.getInt(5));
				order.setSalePrice(rs.getInt(6));
				
				orderList.add(order);
			}
			
		} finally {
			close();
		}
		
		return orderList;
	}

}
