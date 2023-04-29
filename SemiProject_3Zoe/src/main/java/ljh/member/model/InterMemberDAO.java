package ljh.member.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface InterMemberDAO {

	
	//////////////////////////////////// 이지현 ////////////////////////////////////

	//입력받은 비밀번호와 로그인된 유저의 아이디와 같은지 체크
	boolean checkPasswd(Map<String, String> paraMap) throws SQLException;

}
