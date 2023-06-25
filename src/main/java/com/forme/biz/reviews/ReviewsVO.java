package com.forme.biz.reviews;

public class ReviewsVO {

	private int reviewNum;
	private int myNum;
	private int points;
	private String comments;
	private String writeDate;
	private String name;
	private String menuname;
	private String id;
	private String thumbnail;
	private String delidate;
	private int menuId; 
	
	
	
	public int getMenuId() {
		return menuId;
	}
	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}
	public String getDelidate() {
		return delidate;
	}
	public void setDelidate(String delidate) {
		this.delidate = delidate;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getReviewNum() {
		return reviewNum;
	}
	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}
	public int getMyNum() {
		return myNum;
	}
	public void setMyNum(int myNum) {
		this.myNum = myNum;
	}
	public int getPoints() {
		return points;
	}
	public void setPoints(int points) {
		this.points = points;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMenuname() {
		return menuname;
	}
	public void setMenuname(String menuname) {
		this.menuname = menuname;
	}
	@Override
	public String toString() {
		return "ReviewsVO [reviewNum=" + reviewNum + ", myNum=" + myNum + ", points=" + points + ", comments="
				+ comments + ", writeDate=" + writeDate + ", name=" + name + ", menuname=" + menuname + ", id=" + id
				+ ", thumbnail=" + thumbnail + ", delidate=" + delidate + ", menuId=" + menuId + "]";
	}
}
