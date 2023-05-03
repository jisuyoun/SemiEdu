package cos.model;

public class CosVO {
	// tbl_course
	
	private String courseCode;        // 강의코드
	private String fk_categoryCode;   // 카테고리코드
	private String courseName;        // 강의명
	private int price;                // 정가
	private int salePrice;            // 할인가격
	private String teacher;           // 강사명
	private int courseTerm;           // 강의기간
	private String courseList;		  // 강의목차
	private String img1;			  // 강의썸네일
	private String img2;			  // 강의소개이미지
	
	private ImgVO ivo;			  // 이미지vo
	
	
	
	public ImgVO getIvo() {
		return ivo;
	}

	public void setIvo(ImgVO ivo) {
		this.ivo = ivo;
	}

	public String getCourseCode() {
		return courseCode;
	}
	
	public void setCourseCode(String courseCode) {
		this.courseCode = courseCode;
	}
	
	public String getFk_categoryCode() {
		return fk_categoryCode;
	}
	
	public void setFk_categoryCode(String fk_categoryCode) {
		this.fk_categoryCode = fk_categoryCode;
	}
	
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
	
	public String getTeacher() {
		return teacher;
	}
	
	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}
	
	public int getCourseTerm() {
		return courseTerm;
	}
	
	public void setCourseTerm(int courseTerm) {
		this.courseTerm = courseTerm;
	}
	
	public String getCourseList() {
		return courseList;
	}
	
	public void setCourseList(String courseList) {
		this.courseList = courseList;
	}
	
	public String getImg1() {
		return img1;
	}
	
	public void setImg1(String img1) {
		this.img1 = img1;
	}
	
	public String getImg2() {
		return img2;
	}
	
	public void setImg2(String img2) {
		this.img2 = img2;
	}
	
	
	
}
