package com.forme.biz.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("adminMenuService")
public class AdminMenuDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public AdminMenuDAO() {
		System.out.println("📦  AdminMenuDAO() 객체 생성");
	}
	
	// Menu Insert
	public void insertMenu(AdminMenuVO vo) {
		System.out.println("🌐 Mybatis insertMenu() 실행");
		mybatis.insert("adminDAO.insertMenu", vo);
	}
	
	public void updateMenu(AdminMenuVO vo) {
		System.out.println("🌐 Mybatis updateMenu() 실행");
		mybatis.update("adminDAO.updateMenu", vo);
	}
	
	public void deleteMenu(int menuId) {
		System.out.println("🌐 Mybatis deleteMenu() 실행");
		mybatis.delete("adminDAO.deleteMenu", menuId);
	}
	
	public AdminMenuVO getMenu(AdminMenuVO vo) {
		System.out.println("🌐️ Mybatis getMenu() 실행");
		return mybatis.selectOne("adminDAO.getMenu", vo.getMenuId());
	}
	
	public List<AdminMenuVO> getJsonMenuList(String searchKeyword) {
		System.out.println(" Mybatis getJsonMenuList(vo) 실행");
		System.out.println("adminDAO searchKeyword : " + searchKeyword);
		List<AdminMenuVO> list = null;
		// 검색조건 값이 없을 때 기본값 설정
		if (searchKeyword == null) {
			searchKeyword = "";
			System.out.println("searchKeyword : " + searchKeyword);
		}
		
		if(searchKeyword != null) {
			System.out.println("searchKeyword : " + searchKeyword);
			list = mybatis.selectList("adminDAO.getSearchMenuList", searchKeyword);
		}
		return list;
	}
	
	public List<AdminMenuVO> getMenuList(AdminMenuVO vo) {
		return mybatis.selectList("adminDAO.getMenuList", vo);
	}
}
