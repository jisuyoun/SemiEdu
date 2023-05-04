package hyh.member.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import member.model.MemberVO;
import util.security.AES256;
import util.security.SecretMyKey;
import util.security.Sha256;

public class MemberDAO implements InterMemberDAO {

	
	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool) 이다.    
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private AES256 aes;
	
	
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

	// DB에 포인트 증가하기
	@Override
	public int pointUpdate(Map<String, String> paraMap) throws SQLException {
		int result = 0;
	      
	      try {
	         conn = ds.getConnection();
	         
	         String sql = " update tbl_member set point = point + ? "
	                  + " where userid = ? ";
	         
	         pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setInt(1, (int)(Integer.parseInt(paraMap.get("salePrice")) * 0.01 ) ); // 300000000 * 0.01 ==> 3000.0  (int)3000 ==> 3000
	         pstmt.setString(2, paraMap.get("userid"));
	         
	         result = pstmt.executeUpdate();
	         
	         System.out.println("result" + result);
	      } finally {
	         close();
	      }
	      
	      return result;
	      
	 }// end of public int coinUpdate(Map<String, String> paraMap)-------
	

	
	
	

	

}
