package cos.model;

public class CategoryVO {
	// tbl_category
	
	private String categoryCode; 
	private String categoryName;
	// 1: 정보처리  2: 데이터관련  3: 전자계산기  4: 패키지
	
	
	public String getCategoryCode() {
		return categoryCode;
	}
	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
}
