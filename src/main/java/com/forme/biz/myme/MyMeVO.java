package com.forme.biz.myme;

public class MyMeVO {
	private int myNum;
	private String id;
	private int menuId;
	private String deliAddress;
	private String deliDate;
	private int subPrice;
	private String subDate;
	private int subType;
	private String startDate;
	private String endDate;

	private String deliok;
	private int turn;

	private String menuName;

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public void setTurn(int turn) {
		this.turn = turn;
	}

	public int getTurn() {
		return turn;
	}

	public String getDeliok() {
		return deliok;
	}

	public void setDeliok(String deliok) {
		this.deliok = deliok;
	}

	public int getMyNum() {
		return myNum;
	}

	public void setMyNum(int myNum) {
		this.myNum = myNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getMenuId() {
		return menuId;
	}

	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}

	public String getDeliAddress() {
		return deliAddress;
	}

	public void setDeliAddress(String deliAddress) {
		this.deliAddress = deliAddress;
	}

	public String getDeliDate() {
		return deliDate;
	}

	public void setDeliDate(String deliDate) {
		this.deliDate = deliDate;
	}

	public int getSubPrice() {
		return subPrice;
	}

	public void setSubPrice(int subPrice) {
		this.subPrice = subPrice;
	}

	public String getSubDate() {
		return subDate;
	}

	public void setSubDate(String subDate) {
		this.subDate = subDate;
	}

	public int getSubType() {
		return subType;
	}

	public void setSubType(int subType) {
		this.subType = subType;
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

	@Override
	public String toString() {
		return "MyMeVO [myNum=" + myNum + ", id=" + id + ", menuId=" + menuId + ", deliAddress=" + deliAddress
				+ ", deliDate=" + deliDate + ", subPrice=" + subPrice + ", subDate=" + subDate + ", subType=" + subType
				+ ", startDate=" + startDate + ", endDate=" + endDate + "]";
	}

}
