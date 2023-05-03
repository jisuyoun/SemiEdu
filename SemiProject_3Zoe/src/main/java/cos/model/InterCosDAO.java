package cos.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import member.model.MemberVO;

public interface InterCosDAO {
	/*
	 * // 강의 리스트 페이지에서 필요한 정보 불러오는 메소드 생성하기 List<CosVO> searchCosList() throws
	 * SQLException;
	 */
	// 강의 리스트 불러오기 메소드 생성하기
	List<CosVO> selectBySpecName(Map<String, String> paraMap) throws SQLException;

	// 강의삭제하기에서 체크된 강의들 삭제하는 메소드 생성하기
	int delectCos(Map<String, Object> paraMap) throws SQLException;

	// 찜한 강의 알아오기 메소드 생성하기
	List<CosVO> SelectLike(Map<String, String> paraMap) throws SQLException;
	
	// 찜한 강의 찜 테이블에 올려주는 메소드 생성하기
	int addLike(Map<String, String> paraMap) throws SQLException;

	// 찜 풀은 강의 찜 테이블에서 삭제해주는 메소드 생성하기
	int dislike(String discheckedHeart, String userid) throws SQLException;
	
	// 제품상세목록 보여주는 메소드 생성하기
	CosVO selectOneProductByCourseCode(String courseCode)  throws SQLException;

	// 비슷한 강의 찾아주기 메소드 생성하기 
	List<CosVO> RecommendCos(Map<String, String> paraMap) throws SQLException;
	 
	// tbl_category 테이블에서 categoryCode, categoryName 조회해오기 
	List<Map<String, String>> getCategoryList() throws SQLException;

	// 장바구니 추가 메소드 생성하기
	int ShoppingBagAdd(Map<String, String> paraMap) throws SQLException;

	// 장바구니 페이지에 정보 보내기 메소드 생성하기
	List<CosVO> ShoppingBagList(Map<String, String> paraMap) throws SQLException;

	// 장바구니에 체크된 강의들 가격 알아오는 메소드 생성하기
	List<CosVO> SelectPrice(Map<String, Object> paraMap) throws SQLException;

	// 장바구니에 체크된 강의 선택삭제하기 메소드 생성하기
	int BagSelectDelete(Map<String, Object> paraMap) throws SQLException;

	// 장바구니에 있는 모든 강의 삭제하기 메소드 생성하기
	int BagAllDelete(String userid) throws SQLException;

	// 추가이미지 불러오기 메소드 생성하기
	List<ImgVO> imgPlus(Map<String, String> paraMap) throws SQLException;

	// 강의 검색하기 메소드 생성하기
	List<CosVO> searchCos(Map<String, String> paraMap) throws SQLException;

	

	



}
