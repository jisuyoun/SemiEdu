package ljh.order.model;

public class orderVO {
	private int orderCode;
	private String orderday;
	private int orderPoint;
	private int totalPrice;
	private int usePoint;
	private String fk_userid;
	
	public orderVO() {
		
	}
	
	
	public orderVO(int orderCode, String orderday, int orderPoint, int totalPrice, int usePoint, String fk_userid) {
		super();
		this.orderCode = orderCode;
		this.orderday = orderday;
		this.orderPoint = orderPoint;
		this.totalPrice = totalPrice;
		this.usePoint = usePoint;
		this.fk_userid = fk_userid;
	}
	
	
	public int getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(int orderCode) {
		this.orderCode = orderCode;
	}
	public String getOrderday() {
		return orderday;
	}
	public void setOrderday(String orderday) {
		this.orderday = orderday;
	}
	public int getOrderPoint() {
		return orderPoint;
	}
	public void setOrderPoint(int orderPoint) {
		this.orderPoint = orderPoint;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getUsePoint() {
		return usePoint;
	}
	public void setUsePoint(int usePoint) {
		this.usePoint = usePoint;
	}
	public String getFk_userid() {
		return fk_userid;
	}
	public void setFk_userid(String fk_userid) {
		this.fk_userid = fk_userid;
	}
	
	


}
