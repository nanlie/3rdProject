package com.forme.biz.menu;

import java.util.List;

public interface MenuService {
	//CRUD 기능구현 메소드 정의
	void insertMenu(MenuVO vo);
	void updateMenu(MenuVO vo);
	void deleteMenu(int menuId);
	MenuVO getMenu(MenuVO vo);
	List<MenuVO> getMenuList(MenuVO vo);
	List<MenuVO> getJsonMenuList(String searchKeyword);
	
	
	
	List<MenuVO> getThumSix();
	List<MenuVO> getThumEight();
	List<MenuVO> getThumTen();
	MenuVO viewDetail(MenuVO vo);
	List<MenuVO> choice(int subType);
	List<MenuVO> getJsonMenuType(String menuType);
}
