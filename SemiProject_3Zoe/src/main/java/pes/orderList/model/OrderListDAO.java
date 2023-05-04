package pes.orderList.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import ljh.order.model.OrderVO;


public class OrderListDAO implements InterOrderListDAO {

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
	public OrderListDAO() {
		try {
		     Context initContext = new InitialContext();
	         Context envContext  = (Context)initContext.lookup("java:/comp/env");
	         ds = (DataSource)envContext.lookup("jdbc/semi_oracle");

	         
		} catch(NamingException e) {
			e.printStackTrace();
		}
	}
	
	
	// 회원 구매리스트 가져오기
	@Override
	public List<OrderVO> getOrderList() throws SQLException {
		
		List<OrderVO> orderList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			
			String sql = " select orderCode, fk_userid, orderday, totalPrice, count(*), max(courseName) "
					+ " from ( "
					+ " select  O.orderCode, O.orderday, O.totalPrice, C.courseName "
					+ " from tbl_order O "
					+ " join tbl_detailOrder D on O.orderCode = D.fk_orderCode "
					+ " join tbl_course C on D.fk_courseCode = C.courseCode "
					+ " )  "
					+ " group by orderCode,orderday, totalPrice"
					+ " order by orderday " ;
			
			pstmt = conn.prepareStatement(sql); 
			
			
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {

				OrderVO order = new OrderVO();
				order.setOrderCode(rs.getString(1));
		//		order.setOrderCode(rs.getString(2));
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

	
	

}
