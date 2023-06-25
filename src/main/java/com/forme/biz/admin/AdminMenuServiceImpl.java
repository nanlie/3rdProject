package com.forme.biz.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//@Service : @Component 상속확장 어노테이션
//				비즈니스 로직 처리 서비스 영역에 사용

@Service("AdminMenuService")
public class AdminMenuServiceImpl implements AdminMenuService{
	
	@Autowired
	private AdminMenuDAO menuDAO;

	
	public AdminMenuServiceImpl() {
		System.out.println("📦 MenuServiceImpl() 객체 생성");
	}
	
	@Override
	public void insertMenu(AdminMenuVO vo) {
		menuDAO.insertMenu(vo);
	}

	@Override
	public void updateMenu(AdminMenuVO vo) {
		menuDAO.updateMenu(vo);
	}

	@Override
	public void deleteMenu(int menuId) {
		menuDAO.deleteMenu(menuId);
	}

	@Override
	public AdminMenuVO getMenu(AdminMenuVO vo) {
		return menuDAO.getMenu(vo);
	}

	@Override
	public List<AdminMenuVO> getMenuList(AdminMenuVO vo) {
		return menuDAO.getMenuList(vo);
	}

	@Override
	public List<AdminMenuVO> getJsonMenuList(String searchKeyword) {
		return menuDAO.getJsonMenuList(searchKeyword);
	}

}
