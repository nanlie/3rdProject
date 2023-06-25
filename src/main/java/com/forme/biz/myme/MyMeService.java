package com.forme.biz.myme;

import java.util.List;

public interface MyMeService {

	List<MyMeVO> MyMeList(String id); 
	List<MyMeVO> MyMe(String id); 
	
	void changeDeliDate(MyMeVO mmvo);
	void okOrder(String id, String string, String address, String string2, int subPrice, int subType);
	void turnUpdate(String id);
}
