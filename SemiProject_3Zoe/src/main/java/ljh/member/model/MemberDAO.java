package ljh.member.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.sql.*;
import java.util.*;


import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import cos.model.CosVO;
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
	public MemberDAO() {
		try {
		     Context initContext = new InitialContext();
	         Context envContext  = (Context)initContext.lookup("java:/comp/env");
	         ds = (DataSource)envContext.lookup("jdbc/semi_oracle");
	         
	         aes = new AES256(SecretMyKey.KEY);
	         // SecretMyKey.KEY 은 우리가 만든 암호화/복호화 키이다.
	         
		} catch(NamingException e) {
			e.printStackTrace();
		} catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	
	/////////////////////////////이지현////////////////////////////////
	
    


	
	//입력받은 비밀번호와 로그인된 유저의 아이디와 같은지 체크
	@Override
	public boolean checkPasswd(Map<String, String> paraMap) throws SQLException {
		
		
		boolean isSame = false;
		
		try {
			conn = ds.getConnection();
			
			String sql = " select userid "
					+ " from tbl_member  "
					+ " where userid = ? and pwd= ? ";
			
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, paraMap.get("userid"));
			pstmt.setString(2, Sha256.encrypt( paraMap.get("passwd") ) );
			
			rs = pstmt.executeQuery();
			
			isSame = rs.next();


		} finally {
			close();
		}
		
		return isSame;
	}

	
	// userid의 status 값 변경해주기. 탈퇴하기
	@Override
	public int deleteMember(String userid) throws SQLException {
		int n = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = " update tbl_member set status = 0 "
					+ " where userid = ? ";
			
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, userid);
		
			
			n = pstmt.executeUpdate();
		


		} finally {
			close();
		}
		return n;
	}

	
	// 로그인된 아이디와 새로운 비밀번호를 넘겨서 업데이트 해준다.
	@Override
	public int changePasswd(Map<String, String> map) throws SQLException {
		
		int n = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = " update tbl_member set pwd = ? "
					+ " where userid = ? ";
			
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, Sha256.encrypt( map.get("passwd") ));
			pstmt.setString(2, map.get("userid"));
		
			
			n = pstmt.executeUpdate();
		 
		} finally {
			close();
		}
		return n;	
	}	
	
	// 이메일 중복검사(tbl_member 테이블에서 email 이 존재하면 true를 리턴해주고, email 이 존재하지 않으면 false를 리턴한다)
	@Override
	public boolean emailDuplicateCheck(String email) throws SQLException {
		
		boolean isExists = false;
		
		try {
			conn = ds.getConnection();
			
			String sql = " select email "
					   + " from tbl_member "
					   + " where email = ? ";
			
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, aes.encrypt(email));
			
			rs = pstmt.executeQuery();
			
			isExists = rs.next(); // 행이 있으면(중복된 email) true,
			                      // 행이 없으면(사용가능한 email) false
			
		} catch(GeneralSecurityException | UnsupportedEncodingException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return isExists;
		
	}// end of public boolean emailDuplicateCheck(String email)---------------

	
	
	// 로그인된 아이디와 변경할 정보들을 넘긴다.
	@Override
	public int infoChange(String userid, Map<String, String> paraMap) throws SQLException {
		
		int result = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = " update tbl_member set email = ?, checkEmail = ?, mobile=?, checkMobile=?, "
					+ "	postcode = ?, address = ?, detailaddress= ?  "
					+ " where userid = ? ";
			

			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, aes.encrypt( paraMap.get("email")));
			pstmt.setString(2, paraMap.get("checkEmail"));
			pstmt.setString(3, aes.encrypt( paraMap.get("mobile")));
			pstmt.setString(4, paraMap.get("checkMobile"));
			pstmt.setString(5, paraMap.get("postcode"));
			pstmt.setString(6, paraMap.get("address"));
			pstmt.setString(7, paraMap.get("detailAdress"));
			pstmt.setString(8,userid);
			
		
			
			result = pstmt.executeUpdate();
		 
		} catch(GeneralSecurityException | UnsupportedEncodingException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return result;
		}

	
	// 로그인한 사람의 위시리스트 가져오기
	@Override
	public List<CosVO> getWishList(String userid) throws SQLException {
		
		List<CosVO> cosList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			
			String sql = " select courseCode, courseName, img1, courseTerm, salePrice "
					+ " from tbl_course C "
					+ " join tbl_like L on C.courseCode = L.fk_courseCode "
					+ " where L.fk_userid = ? ";
			
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {

				CosVO course = new CosVO();
				course.setCourseCode(rs.getString(1));
				course.setCourseName(rs.getString(2));
				course.setImg1(rs.getString(3));
				course.setCourseTerm(rs.getInt(4));
				course.setSalePrice(rs.getInt(5));
				
				cosList.add(course);
				
			}
			
		} finally {
			close();
		}
		
		return cosList;
	}

	
	// 클릭한 강의를 위시리스트에서 삭제한다
	@Override
	public int deleteWishList(Map<String, String> paraMap) throws SQLException {
		int n = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = " delete from tbl_like "
					+ " where fk_userid = ? and fk_courseCode = ? ";
			
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, paraMap.get("userid"));
			pstmt.setString(2, paraMap.get("courseCode"));
		
			
			n = pstmt.executeUpdate();
		 
		} finally {
			close();
		}
		return n;	
	}

	
	// 로그인한 사람이 듣고있는 강의 가져오기
	@Override
	public List<CosVO> getIngCourse(String userid) throws SQLException {
		
		List<CosVO> cosList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			
			String sql = " select C.courseCode, C.courseName, C.img1 "
					+ " from tbl_course C "
					+ " join tbl_detailOrder D on C.courseCode = D.fk_courseCode  "
					+ " join tbl_order O on O.orderCode = D.fk_orderCode "
					+ " where O.fk_userid = ? ";
			
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {

				CosVO course = new CosVO();
				course.setCourseCode(rs.getString(1));
				course.setCourseName(rs.getString(2));
				course.setImg1(rs.getString(3));
				course.setCourseTerm(rs.getInt(4));
				course.setSalePrice(rs.getInt(5));
				
				cosList.add(course);
				
			}
			
		} finally {
			close();
		}
		
		return cosList;
	}

	
	// 로그인된 회원의 위시리스트 갯수 가져오기
	@Override
	public int wishListCount(String userid) throws SQLException {
		int count = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = " select count(*)"
					+ " from tbl_like"
					+ " where fk_userid = ? ";
			
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
		} finally {
			close();
		}
		
		return count;
	}

}
