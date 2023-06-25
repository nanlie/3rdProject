package com.forme.biz.view.admin;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.forme.biz.admin.AdminMemberService;
import com.forme.biz.admin.AdminMemberVO;
import com.forme.biz.admin.AdminMenuService;
import com.forme.biz.admin.AdminMenuVO;

@RestController
public class AdminMemberAjaxController {
	@Autowired
	private AdminMemberService memberService;
	
	public AdminMemberAjaxController() {
		System.out.println("📦 MemberAjaxController() 객체 생성");
	}
	
	@RequestMapping("/getJsonMemberList.do")
	public List<AdminMemberVO> getJsonMenuList(@RequestParam(value="searchName") String searchName) {
		System.out.println("Controller searchName : " + searchName);
		System.out.println("🌐 MemberAjaxController.getJsonMemberList() 실행");
		
		List<AdminMemberVO> memberList = memberService.getJsonMemberList(searchName);
		System.out.println("📋 memberList : " +  memberList);
		
		return memberList;
	}
	
	@RequestMapping(value = "/getJsonMember.do", method = RequestMethod.POST
										,produces = "application/json;charset=UTF-8")
	public AdminMemberVO getJsonMenu(@RequestBody AdminMemberVO vo) {
		System.out.println("🌐 MemberAjaxController.getJsonMember() 실행");
		System.out.println("getJsonMenu() vo : " + vo);
		
		AdminMemberVO member = memberService.getMember(vo);
		System.out.println("getJsonMenu() menu : " + member);
		return member;
	}
	
	
}
