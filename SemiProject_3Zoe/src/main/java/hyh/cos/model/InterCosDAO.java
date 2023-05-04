package hyh.cos.model;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cos.model.CosVO;
import member.model.MemberVO;

public interface InterCosDAO {
	
	

	// 시퀀스 번호 알아오기
	int getSeq_tbl_order() throws SQLException;

	// Transaction 처리를 해주는 메소드
	int orderAdd(HashMap<String, Object> paraMap) throws SQLException;

	// 주문한 제품에 대해 email 보내기시 email 내용에 넣어 주문한 제품번호들에 대한 제품번호를 얻어오는 것.
	List<CosVO> getJumunProductList(String pnumes) throws SQLException;

	

	


}
