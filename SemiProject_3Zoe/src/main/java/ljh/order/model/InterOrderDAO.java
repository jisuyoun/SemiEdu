package ljh.order.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;


public interface InterOrderDAO {

	
	// 로그인한 사람의 구매리스트 가져오기
	List<OrderVO> getOrderList(String userid)  throws SQLException;

	
	// 로그인한 사람이 선택한 구매리스트 가져오기
	OrderVO getOrder(Map<String, String> paraMap) throws SQLException;

	// 로그인한 사람이 선택한 구매 상세 목록 가져오기
	List<OrderVO> getOrderDetail(Map<String, String> paraMap)  throws SQLException;

	// 로그인한 사람이 검색한 날짜 중에 구매내역 보여주기
	List<OrderVO> getOrderList(Map<String, String> paraMap) throws SQLException;

	
	


}
