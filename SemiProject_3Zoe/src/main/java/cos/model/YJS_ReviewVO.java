package cos.model;

public class YJS_ReviewVO {

	private int reviewNum;
	private String fk_courseCode;
	private String fk_userid;
	private String reviewTitle;
	private String review;
	private int reviewPoint;
	private String writeDay;
	public int getReviewNum() {
		return reviewNum;
	}
	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}
	public String getFk_courseCode() {
		return fk_courseCode;
	}
	public void setFk_courseCode(String fk_courseCode) {
		this.fk_courseCode = fk_courseCode;
	}
	public String getFk_userid() {
		return fk_userid;
	}
	public void setFk_userid(String fk_userid) {
		this.fk_userid = fk_userid;
	}
	public String getReviewTitle() {
		return reviewTitle;
	}
	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public int getReviewPoint() {
		return reviewPoint;
	}
	public void setReviewPoint(int reviewPoint) {
		this.reviewPoint = reviewPoint;
	}
	public String getWriteDay() {
		return writeDay;
	}
	public void setWriteDay(String writeDay) {
		this.writeDay = writeDay;
	}
	
	
}
