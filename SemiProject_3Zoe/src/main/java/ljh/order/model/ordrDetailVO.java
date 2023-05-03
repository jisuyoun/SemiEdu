package ljh.order.model;

public class ordrDetailVO {
	
	private int orderNum ;
	private int fk_orderCode;
	private String fk_courseCode;
	private int coursePrice;
	private String startDate;
	private String endDate;
	
	
	public ordrDetailVO() {};
	
	
	public ordrDetailVO(int orderNum, int fk_orderCode, String fk_courseCode, int coursePrice, String startDate,
			String endDate) {
		super();
		this.orderNum = orderNum;
		this.fk_orderCode = fk_orderCode;
		this.fk_courseCode = fk_courseCode;
		this.coursePrice = coursePrice;
		this.startDate = startDate;
		this.endDate = endDate;
	}
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public int getFk_orderCode() {
		return fk_orderCode;
	}
	public void setFk_orderCode(int fk_orderCode) {
		this.fk_orderCode = fk_orderCode;
	}
	public String getFk_courseCode() {
		return fk_courseCode;
	}
	public void setFk_courseCode(String fk_courseCode) {
		this.fk_courseCode = fk_courseCode;
	}
	public int getCoursePrice() {
		return coursePrice;
	}
	public void setCoursePrice(int coursePrice) {
		this.coursePrice = coursePrice;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
	
}
