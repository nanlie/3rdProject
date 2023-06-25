package com.forme.biz.menu;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forme.biz.menu.MenuService;
import com.forme.biz.menu.MenuVO;

//@Service : @Component 상속확장 어노테이션
//				비즈니스 로직 처리 서비스 영역에 사용

@Service("MenuService")
public class MenuServiceImpl implements MenuService{
	
	@Autowired
	private MenuDAO menuDAO;

	
	public MenuServiceImpl() {
		System.out.println("📦 MenuServiceImpl() 객체 생성");
	}
	
	@Override
	public void insertMenu(MenuVO vo) {
		menuDAO.insertMenu(vo);
	}

	@Override
	public void updateMenu(MenuVO vo) {
		menuDAO.updateMenu(vo);
	}

	@Override
	public void deleteMenu(int menuId) {
		menuDAO.deleteMenu(menuId);
	}

	@Override
	public MenuVO getMenu(MenuVO vo) {
		return menuDAO.getMenu(vo);
	}

	@Override
	public List<MenuVO> getMenuList(MenuVO vo) {
		return menuDAO.getMenuList(vo);
	}

	@Override
	public List<MenuVO> getJsonMenuList(String searchKeyword) {
		return menuDAO.getJsonMenuType(searchKeyword);
	}
	
	
	//--------------------------------------------------------------
	
	
	
	//6000원메뉴조회
		@Override
		public List<MenuVO> getThumSix() {
			return menuDAO.getThumSix();
		}
	//8000원메뉴조회
		@Override
		public List<MenuVO> getThumEight() {
			return menuDAO.getThumEight();
		}
	//10000원메뉴조회	
		@Override
		public List<MenuVO> getThumTen() {
			return menuDAO.getThumTen();
		}
	//메뉴 1개 조회
//		@Override
//		public MenuVO getMenu(MenuVO vo) {
//			return menuDAO.getMenu(vo);
//		}
		@Override
		public MenuVO viewDetail(MenuVO vo) {
			return menuDAO.viewDetail(vo);
		}
		@Override
		public List<MenuVO> choice(int subType) {
			return menuDAO.choice(subType);
		}
		
		@Override
		public List<MenuVO> getJsonMenuType(String menuType) {
			return menuDAO.getJsonMenuType(menuType);
		}

}
