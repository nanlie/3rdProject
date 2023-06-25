package com.forme.biz.menu;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.forme.biz.menu.MenuVO;

@Repository("menuService")
public class MenuDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public MenuDAO() {
		System.out.println("📦 menuDAO1() 객체 생성");
	}
	
	// Menu Insert
	//정회님 컨트롤러 시작-------------------------------------------------------------------------------------------------------------
	public void insertMenu(MenuVO vo) {
		System.out.println("🌐 Mybatis insertMenu() 실행");
		mybatis.insert("menuDAO1.insertMenu", vo);
	}
	
	public void updateMenu(MenuVO vo) {
		System.out.println("🌐 Mybatis updateMenu() 실행");
		mybatis.update("menuDAO1.updateMenu", vo);
	}
	
	public void deleteMenu(int menuId) {
		System.out.println("🌐 Mybatis deleteMenu() 실행");
		mybatis.delete("menuDAO1.deleteMenu", menuId);
	}
	
	public MenuVO getMenu(MenuVO vo) {
		System.out.println("🌐️ Mybatis getMenu() 실행");
		return mybatis.selectOne("menuDAO1.getMenu", vo.getMenuId());
	}
	
	
	
	public List<MenuVO> getMenuList(MenuVO vo) {
		return mybatis.selectList("menuDAO1.getMenuList", vo);
	}
	//정회님 컨트롤러 끝-------------------------------------------------------------------------------------------------------------
	
	//혜인님 컨트롤러 시작-------------------------------------------------------------------------------------------------------------
	//썸네일, 코멘트, 메뉴명 조회
	public List<MenuVO> getThumSix() {
		System.out.println("==> MyBatis 사용 getThumSix()실행");
		List<MenuVO> list = null;
		int  subType = 6000;
		list = mybatis.selectList("menuDAO1.getThum", subType);
		return list;
	}
	public List<MenuVO> getThumEight() {
		System.out.println("==> MyBatis 사용 getThumEight()실행");
		List<MenuVO> list = null;
		int subType = 8000;
		list = mybatis.selectList("menuDAO1.getThum", subType);
		return list;
	}
	public List<MenuVO> getThumTen() {
		System.out.println("==> MyBatis 사용 getThumTen()실행");
		List<MenuVO> list = null;
		int subType = 10000;
		list = mybatis.selectList("menuDAO1.getThum", subType);
		return list;
	}
	public MenuVO viewDetail(MenuVO vo) {
		System.out.println("==>MyBatis 사용 getMenu()실행");
		return mybatis.selectOne("menuDAO1.viewDetail", vo.getMenuId());
	}
	public List<MenuVO> choice(int subType) {
		System.out.println("==>MyBatis 사용 choice(int)실행");
		List<MenuVO> list = null;
		list = mybatis.selectList("menuDAO1.getThum", subType);
		return list;
	}
	
	// ajax 
	public List<MenuVO> getJsonMenuType(String menuType) {
		System.out.println(" Mybatis getMenuList(vo) 실행");
		System.out.println("menuDAO1 getJsonMenuType : " + menuType);
		List<MenuVO> list = null;
		list = mybatis.selectList("menuDAO1.getJsonMenuType", menuType);
		return list;
	}
	//혜인님 컨트롤러 끝-------------------------------------------------------------------------------------------------------------


}
