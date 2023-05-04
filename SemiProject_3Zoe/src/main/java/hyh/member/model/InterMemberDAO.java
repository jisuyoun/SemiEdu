package hyh.member.model;

import java.sql.SQLException;
import java.util.Map;

import member.model.MemberVO;

public interface InterMemberDAO {

	// DB에 포인트 증가하기
	int pointUpdate(Map<String, String> paraMap)  throws SQLException;;

	

	


}
