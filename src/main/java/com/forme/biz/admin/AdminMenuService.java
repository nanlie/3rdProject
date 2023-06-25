package com.forme.biz.admin;

import java.util.List;

public interface AdminMenuService {
	//CRUD 기능구현 메소드 정의
	void insertMenu(AdminMenuVO vo);
	void updateMenu(AdminMenuVO vo);
	void deleteMenu(int menuId);
	AdminMenuVO getMenu(AdminMenuVO vo);
	List<AdminMenuVO> getMenuList(AdminMenuVO vo);
	List<AdminMenuVO> getJsonMenuList(String searchKeyword);
}
