package com.forme.biz.view.frontcontroller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.forme.biz.admin.AdminMenuService;
import com.forme.biz.admin.AdminMenuVO;
import com.forme.biz.menu.MenuService;
import com.forme.biz.menu.MenuVO;

@RestController
public class MenuAjaxController {
	@Autowired
	private MenuService menuService;
	
	public MenuAjaxController() {
		System.out.println("📦 MenuAjaxController() 객체 생성");
	}
	
	@RequestMapping("/getJsonMenuType.do")
	public List<MenuVO> getJsonMenuType(@RequestParam(value="menuType") String menuType) {
		System.out.println("Controller menuType : " + menuType);
		System.out.println("🌐 MenuAjaxController.getJsonMenuType() 실행");
		
		List<MenuVO> menuList = menuService.getJsonMenuType(menuType);
		//System.out.println("📋 menuList : " +  menuList);
		
		return menuList;
	}
	
	
	
}
