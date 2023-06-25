package com.forme.biz.view.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.forme.biz.admin.AdminMemberService;
import com.forme.biz.admin.AdminMemberVO;

@SessionAttributes("adminMember")
@Controller
public class AdminMemberController {

	private AdminMemberService memberService;
	
	@Autowired
	public AdminMemberController(AdminMemberService memberService) {
		System.out.println("📦 MemberController() 객체 생성");
		this.memberService = memberService;
	}
	
	// 메소드에 선언된 @ModelAttribute 는 리턴된 데이터를 View에 전달
	// @ModelAttribute 선언된 메소드는 @RequestMapping 메소드보다 먼저 실행된다
	// 뷰에 전달될 때 설정된 명칭(예: conditionMap)
	
	@RequestMapping("/adminGetMember.do")
	public String getMenu(AdminMemberVO vo, Model model) {
		System.out.println("📱 메뉴 상세보기");
		System.out.println("vo : " + vo);
		
		AdminMemberVO member = memberService.getMember(vo);
		model.addAttribute("member", member);
		System.out.println("DB데이터 member : " + member);
		return "getMember";
	}
	
	@RequestMapping("/adminGetMemberList.do")
	public String getMenuList(AdminMemberVO vo, Model model) {
		System.out.println("📄 게시글 전체 목록 보여주기");
		System.out.println("vo : " + vo);
		
		List<AdminMemberVO> list = memberService.getMemberList(vo);
		
		model.addAttribute("memberList", list);
		
		return "getMemberList";
	}
	
	
}
