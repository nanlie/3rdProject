package com.forme.biz.admin;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;


@JsonIgnoreProperties(value = {"searchKeyword", "uploadFile"})
public class AdminMenuVO {

	private int menuId;

	private String menuName;
	private int menuType;
	private int subType; 

	private int carbohydrate;
	private int protein;
	private int fat;
	private int natrium;
	private int calories;
	private String allergy;
	private int avgPoint;

	private String thumbnail;
	private String menuImg;
	private String recipe;
	private int weight;
	private String mComment;
	
	
	// 검색조건 처리용
	private String searchKeyword;
	
	private MultipartFile thumbnailFile;
	private MultipartFile menuImgFile;

	public int getMenuId() {
		return menuId;
	}

	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public int getMenuType() {
		return menuType;
	}

	public void setMenuType(int menuType) {
		this.menuType = menuType;
	}

	public int getSubType() {
		return subType;
	}

	public void setSubType(int subType) {
		this.subType = subType;
	}

	public int getCarbohydrate() {
		return carbohydrate;
	}

	public void setCarbohydrate(int carbohydrate) {
		this.carbohydrate = carbohydrate;
	}

	public int getProtein() {
		return protein;
	}

	public void setProtein(int protein) {
		this.protein = protein;
	}

	public int getFat() {
		return fat;
	}

	public void setFat(int fat) {
		this.fat = fat;
	}

	public int getNatrium() {
		return natrium;
	}

	public void setNatrium(int natrium) {
		this.natrium = natrium;
	}

	public int getCalories() {
		return calories;
	}

	public void setCalories(int calories) {
		this.calories = calories;
	}

	public String getAllergy() {
		return allergy;
	}

	public void setAllergy(String allergy) {
		this.allergy = allergy;
	}

	public int getAvgPoint() {
		return avgPoint;
	}

	public void setAvgPoint(int avgPoint) {
		this.avgPoint = avgPoint;
	}

	//사진 관련
	
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	
	public String getMenuImg() {
		return menuImg;
	}
	
	public void setMenuImg(String menuImg) {
		this.menuImg = menuImg;
	}
	//------------------------------------
	public String getRecipe() {
		return recipe;
	}

	public String getThumbnail() {
		return thumbnail;
	}


	public void setRecipe(String recipe) {
		this.recipe = recipe;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}
	
	public String getmComment() {
		return mComment;
	}

	public void setmComment(String mComment) {
		this.mComment = mComment;
	}



	@Override
	public String toString() {
		return "MenuVO [menuId=" + menuId + ", menuName=" + menuName + ", menuType=" + menuType + ", subType=" + subType
				+ ", carbohydrate=" + carbohydrate + ", protein=" + protein + ", fat=" + fat + ", natrium=" + natrium
				+ ", calories=" + calories + ", allergy=" + allergy + ", avgPoint=" + avgPoint + ", thumbnail="
				+ thumbnail + ", menuImg=" + menuImg + ", recipe=" + recipe + ", weight=" + weight + ", mComment="
				+ mComment + ", searchCondition=" + ", searchKeyword=" + searchKeyword
				+ ", uploadFile="+ "]";
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public MultipartFile getThumbnailFile() {
		return thumbnailFile;
	}

	public void setThumbnailFile(MultipartFile thumbnailFile) {
		this.thumbnailFile = thumbnailFile;
	}

	public MultipartFile getMenuImgFile() {
		return menuImgFile;
	}

	public void setMenuImgFile(MultipartFile menuImgFile) {
		this.menuImgFile = menuImgFile;
	}


}
