package ljh.member.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import cos.model.CosVO;

public interface InterMemberDAO {

	
	//////////////////////////////////// 이지현 ////////////////////////////////////

	//입력받은 비밀번호와 로그인된 유저의 아이디와 같은지 체크
	boolean checkPasswd(Map<String, String> paraMap) throws SQLException;

	
	// userid의 status 값 변경해주기
	int deleteMember(String userid) throws SQLException;


	// 로그인된 아이디와 새로운 비밀번호를 넘겨서 업데이트 해준다.
	int changePasswd(Map<String, String> map) throws SQLException;

	
	// 이메일 중복검사(tbl_member 테이블에서 email 이 존재하면 true를 리턴해주고, email 이 존재하지 않으면 false를 리턴한다)
	boolean emailDuplicateCheck(String email)  throws SQLException;

	// 로그인된 아이디와 변경할 정보들을 넘긴다.
	int infoChange(String userid, Map<String, String> paraMap) throws SQLException;

	// 로그인한 사람의 위시리스트 가져오기
	List<CosVO> getWishList(String userid) throws SQLException;

	// 클릭한 강의를 위시리스트에서 삭제한다
	int deleteWishList(Map<String, String> paraMap) throws SQLException;

	// 로그인한 사람이 듣고있는 강의 가져오기
	List<CosVO> getIngCourse(String userid) throws SQLException;

	
	// 로그인된 회원의 위시리스트 갯수 가져오기
	int wishListCount(String userid) throws SQLException;



}
