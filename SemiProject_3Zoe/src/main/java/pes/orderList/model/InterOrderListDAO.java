package pes.orderList.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import ljh.order.model.OrderVO;

public interface InterOrderListDAO {

	
	List<OrderVO> getOrderList() throws SQLException;

	


}