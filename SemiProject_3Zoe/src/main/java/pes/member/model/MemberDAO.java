package pes.member.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.sql.*;
import java.util.*;

import javax.naming.*;
import javax.sql.DataSource;

import member.model.MemberVO;
import util.security.*;



public class MemberDAO implements InterMemberDAO {
	
	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool) 이다. 
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private AES256 aes;
	
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
	public MemberDAO() { 
		try {
		     Context initContext = new InitialContext();
	         Context envContext  = (Context)initContext.lookup("java:/comp/env");
	         ds = (DataSource)envContext.lookup("jdbc/semi_oracle");
	         
	         aes = new AES256(SecretMyKey.KEY);
	         
		} catch(NamingException e) {
			e.printStackTrace();
		} catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}	
	
	
	
	
	// 페이징 처리를 안한 모든 회원 또는 검색한 회원 목록 보여주기
	@Override
	public List<MemberVO> selectMember(Map<String, String> paraMap) throws SQLException {

		List<MemberVO> memberList = new ArrayList<>();
		try {
			conn = ds.getConnection();
			
			String sql =  " select userid, name, email, mobile "
						+ " from tbl_member "
						+ " where userid != 'testadmin' ";
			
			String colname = paraMap.get("searchType");
			String searchWord = paraMap.get("searchWord");
			
			if( "email".equals(colname) ) {
				// 검색대상이 email 인 경우
				searchWord = aes.encrypt(searchWord);
			}
			
			else if( "mobile".equals(colname) ) {
				// 검색대상이 mobile 인 경우
				searchWord = aes.encrypt(searchWord);
			}
			
			if( searchWord != null && !searchWord.trim().isEmpty() ) {
				sql += " and " + colname + " like '%' || ? || '%' " ; 
			}
			
			sql += " order by registerday desc ";			
			
			pstmt = conn.prepareStatement(sql);
			
			if( searchWord != null && !searchWord.trim().isEmpty() ) {
				pstmt.setString(1, searchWord);
			}
			
			rs = pstmt.executeQuery();
		
			
			while(rs.next()) {
				
				MemberVO member = new MemberVO();
				
				member.setUserid(rs.getString(1));
				member.setName(rs.getString(2));
				member.setEmail( aes.decrypt(rs.getString(3)) ); // 복호화 
				member.setMobile( aes.decrypt(rs.getString(4)) ); // 복호화
				
				memberList.add(member);
				
			}// end of while(rs.next())--------------------------
			
			
		} catch (GeneralSecurityException | UnsupportedEncodingException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return memberList;
		
	}//end of public int getTotalPage(Map<String, String> paraMap) throws SQLException-----------

	
	
	// 페이징 처리 한 모든 회원 또는 검색한 회원 목록 보여주기
	@Override
	public List<MemberVO> selectPagingMember(Map<String, String> paraMap) throws SQLException {

		List<MemberVO> memberList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			
			String sql =  " SELECT userid, name, email, mobile "
						+ "  FROM "
						+ "  ( "
						+ "        select rownum AS RNO, userid, name, email, mobile "
						+ "        from "
						+ "      ( "
						+ "        select userid, name, email, mobile "
						+ "        from tbl_member "
						+ "        where userid != 'testadmin' ";
			
			String colname = paraMap.get("searchType");
			String searchWord = paraMap.get("searchWord");
			
			if( "email".equals(colname) ) {
				// 검색대상이 email 인 경우
				searchWord = aes.encrypt(searchWord);
			}
			
			else if( "mobile".equals(colname) ) {
				// 검색대상이 mobile 인 경우
				searchWord = aes.encrypt(searchWord);
			}
			
			if( !"".equals(colname) && searchWord != null && !searchWord.trim().isEmpty() ) {
				sql += " and " + colname + " like '%' || ? || '%' " ; 
			}
			
			sql += " order by registerday desc "
					+ "      ) V "
					+ "  ) T "
					+ "  WHERE RNO between ? and ? ";			
			
			pstmt = conn.prepareStatement(sql);
			
			int currentShowPageNo = Integer.parseInt(paraMap.get("currentShowPageNo")); // 조회하고자하는 페이지번호
			int sizePerPage = Integer.parseInt(paraMap.get("sizePerPage")); // 한페이지당 보여줄 행의개수

			// 페이징처리 
			if( !"".equals(colname) && searchWord != null && !searchWord.trim().isEmpty() ) {
				pstmt.setString(1, searchWord);
				pstmt.setInt(2, (currentShowPageNo * sizePerPage) - (sizePerPage - 1));
				pstmt.setInt(3, (currentShowPageNo * sizePerPage));
			}
			
			else {
				pstmt.setInt(1, (currentShowPageNo * sizePerPage) - (sizePerPage - 1));
				pstmt.setInt(2, (currentShowPageNo * sizePerPage));
			}
			
			rs = pstmt.executeQuery();
		
			
			while(rs.next()) {
				
				MemberVO member = new MemberVO();
				
				member.setUserid(rs.getString(1));
				member.setName(rs.getString(2));
				member.setEmail( aes.decrypt(rs.getString(3)) ); // 복호화
				member.setMobile( aes.decrypt(rs.getString(4)) ); // 복호화
				
				memberList.add(member);
				
			}// end of while(rs.next())--------------------------
			
			
		} catch (GeneralSecurityException | UnsupportedEncodingException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return memberList;
		
	}//end of public List<MemberVO> selectPagingMember(Map<String, String> paraMap) throws SQLException-----

	
	
	// 페이징 처리를 위한 검색이 있는 또는 검색이 없는 전체회원에 대한 총페이지 알아오기
	@Override
	public int getTotalPage(Map<String, String> paraMap) throws SQLException {

		int totalPage = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql =  " select ceil(count(*)/?) "
						+ " from tbl_member "
						+ " where userid != 'testadmin' ";
			
			String colname = paraMap.get("searchType");
			String searchWord = paraMap.get("searchWord");
			
			if( "email".equals(colname) ) {
				// 검색대상이 email 인 경우
				searchWord = aes.encrypt(searchWord);
			}
			
			else if( "mobile".equals(colname) ) {
				// 검색대상이 mobile 인 경우
				searchWord = aes.encrypt(searchWord);
			}
			
			if( !"".equals(colname) && searchWord != null && !searchWord.trim().isEmpty() ) {
				sql += " and " + colname + " like '%' || ? || '%' " ; 
				// ******** 컬럼명과 테이블명은 위치홀더(?)로 사용하면 꽝!!! 이다.
				// 위치홀더(?)로 들어오는 것은 오로지 컬럼명과 테이블명이 아닌 오로지 데이터값만 들어온다. ********
			}	
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, paraMap.get("sizePerPage"));
			
			if( !"".equals(colname) && searchWord != null && !searchWord.trim().isEmpty() ) {
				pstmt.setString(2, searchWord);
			}
			
			rs = pstmt.executeQuery();
		
			rs.next();
			
			totalPage = rs.getInt(1);
			
			
		} catch (GeneralSecurityException | UnsupportedEncodingException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return totalPage;
		
	}//end of public int getTotalPage(Map<String, String> paraMap) throws SQLException--------------

	
	
	// userid 값을 입력 받아서 회원 1명에 대한 상세정보 알아오기
	@Override
	public MemberVO memberOneDetailAction(String userid) throws SQLException {

		MemberVO member = null;
		
		try {
			conn = ds.getConnection();
			
			String sql =  " select userid, name, email, mobile, postcode, address, detailaddress "
						+ "		 , point, to_char(registerday, 'yyyy-mm-dd') AS registerday "
					    + "      , to_char(lastpwdchangedate, 'yyyy-mm-dd') AS lastpwdchangedate "
						+ " from tbl_member "
						+ " where userid = ? ";
			
					
			
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery();
		
			
			if(rs.next()) {
				
				member = new MemberVO();
				
				member.setUserid(rs.getString(1));
				member.setName(rs.getString(2));
				member.setEmail( aes.decrypt(rs.getString(3)) ); // 복호화
				member.setMobile( aes.decrypt(rs.getString(4)) ); // 복호화
				member.setPostcode(rs.getString(5));
				member.setAddress(rs.getString(6));
				member.setDetailaddress(rs.getString(7));
				member.setPoint(rs.getInt(8));
				member.setRegisterday(rs.getString(9));
				member.setLastpwdchangedate(rs.getString(10));
				
			}// end of if(rs.next())--------------------------
			
			
		} catch (GeneralSecurityException | UnsupportedEncodingException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return member;
		
	}//end of public MemberVO memberOneDetailAction(String userid) throws SQLException---------
	


}
