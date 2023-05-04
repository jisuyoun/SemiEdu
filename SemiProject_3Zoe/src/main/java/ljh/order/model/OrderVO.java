package ljh.order.model;

public class OrderVO {
	private int orderCode;
	private String orderday;
	private int orderPoint;
	private int totalPrice;
	private int usePoint;
	private String fk_userid;

	
	private int count;	//한 주문의 구매한 수량
	private String firstCourseName;	// 첫번째 제품 이름
	
	
	private String courseName; // 강의이름
	private int price; // 원래가격
	private int salePrice; // 판매가
	 
	
	public String getCourseName() {
		return courseName;
	}


	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public int getSalePrice() {
		return salePrice;
	}


	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}


	public OrderVO() {
		
	}
	
	
	public OrderVO(int orderCode, String orderday, int orderPoint, int totalPrice, int usePoint, String fk_userid) {
		super();
		this.orderCode = orderCode;
		this.orderday = orderday;
		this.orderPoint = orderPoint;
		this.totalPrice = totalPrice;
		this.usePoint = usePoint;
		this.fk_userid = fk_userid;
	}
	
	
	
	
	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	public String getFirstCourseName() {
		return firstCourseName;
	}


	public void setFirstCourseName(String firstCourseName) {
		this.firstCourseName = firstCourseName;
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
