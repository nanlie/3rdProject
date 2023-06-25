package com.forme.biz.notice;

public class NoticeVO {

	private int noticeNum;
	private String id;
	private String notiContent;
	private String notiDate;
	private String noticeTitle;
	private String name;
	
	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public int getNoticeNum() {
		return noticeNum;
	}

	public void setNoticeNum(int noticeNum) {
		this.noticeNum = noticeNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNotiContent() {
		return notiContent;
	}

	public void setNotiContent(String notiContent) {
		this.notiContent = notiContent;
	}

	public String getNotiDate() {
		return notiDate;
	}

	public void setNotiDate(String notiDate) {
		this.notiDate = notiDate;
	}

	@Override
	public String toString() {
		return "NoticeVO [noticeNum=" + noticeNum + ", id=" + id + ", notiContent=" + notiContent + ", notiDate="
				+ notiDate + ", noticeTitle=" + noticeTitle + ", name=" + name + "]";
	}

	
}
