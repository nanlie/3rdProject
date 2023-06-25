package com.forme.biz.view.admin;

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

@RestController
public class AdminMenuAjaxController {
	@Autowired
	private AdminMenuService menuService;
	
	public AdminMenuAjaxController() {
		System.out.println("📦 MenuAjaxController() 객체 생성");
	}
	
	@RequestMapping("/getJsonMenuList.do")
	public List<AdminMenuVO> getJsonMenuList(@RequestParam(value="searchKeyword") String searchKeyword) {
		System.out.println("Controller searchKeyword : " + searchKeyword);
		System.out.println("🌐 MenuAjaxController.getJsonMenuList() 실행");
		
		List<AdminMenuVO> menuList = menuService.getJsonMenuList(searchKeyword);
		System.out.println("📋 menuList : " +  menuList);
		
		return menuList;
	}
	
	@RequestMapping(value = "/getJsonMenu.do", method = RequestMethod.POST
										,produces = "application/json;charset=UTF-8")
	public AdminMenuVO getJsonMenu(@RequestBody AdminMenuVO vo) {
		System.out.println("🌐 MenuAjaxController.getJsonMenu() 실행");
		System.out.println("getJsonMenu() vo : " + vo);
		
		AdminMenuVO menu = menuService.getMenu(vo);
		System.out.println("getJsonMenu() menu : " + menu);
		return menu;
	}
	
	
}
