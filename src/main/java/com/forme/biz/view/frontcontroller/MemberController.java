package com.forme.biz.view.frontcontroller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.forme.biz.member.MailSendService;
import com.forme.biz.member.MemberService;
import com.forme.biz.member.MemberVO;
import com.forme.biz.menu.MenuService;
import com.forme.biz.menu.MenuVO;
import com.forme.biz.myme.MyMeVO;
@SessionAttributes("user") // board 라는 이름의 Model 객체가 있으면 session 에 저장
@Controller
public class MemberController {
	private MemberService memberService;
	private MenuService menuService;
	@Autowired
	private MailSendService mailService;
	public MemberController() {
		System.out.println("📦 MemberController() 객체 생성");
	}
	@Autowired
	public MemberController(MemberService memberService) {
		System.out.println("📦 MemberController(MemberService memberService) 객체 생성");
		this.memberService = memberService;
	}
	
	@RequestMapping("/signup.do")
	public String signupGo() {
		System.out.println("🌐 signup.jsp 접속");
		return "signup";
	}
	
	@RequestMapping("/loginGo.do")
	public String loginGo(Model model) {
		System.out.println("🌐 loginGo.jsp 접속");
		return "loginGo";
	}
	@RequestMapping("/searchId.do")
	public String searchId() {
		System.out.println("🌐 searchId.jsp 접속");
		return "searchId";
	}
	@RequestMapping("/searchIdOk.do")
	public String searchIdOk(MemberVO vo, Model model) {
		System.out.println("🌐 searchIdOk.jsp 접속");
		System.out.println("vo : " + vo);
		String id = memberService.searchIdOk(vo);
		System.out.println("id : " + id);
		if(id == null) {
			model.addAttribute("fail", "fail");
		} else {
			model.addAttribute("id", id);
		}
		return "searchIdOk";
	}
	@RequestMapping("/searchPwd.do")
	public String searchPwd() {
		System.out.println("🌐 searchPwd.jsp 접속");
		return "searchPwd";
	}
	
	@RequestMapping("/searchPwdOk.do")
	public String searchPwdOk(MemberVO vo, Model model) {
		System.out.println("🌐 searchPwdOk.jsp 접속");
		System.out.println("vo : " + vo);
		MemberVO memberVO = memberService.searchPwdOk(vo);
		System.out.println("pwd : " + memberVO);
		if(memberVO == null) {
			model.addAttribute("fail", "fail");
		} else {
			model.addAttribute("memberVO",memberVO);
		}
		return "searchPwdOk";
	}
	
	@RequestMapping("/login.do") 
	public String login(MemberVO vo, Model model) {
		System.out.println(">>> 로그인 처리");
		System.out.println("vo : " + vo);
		int failCnt = 0;
		MemberVO user = memberService.login(vo);
		System.out.println("user : " + user);
		if (user != null) {
			System.out.println(">> 로그인 성공!!!");
			model.addAttribute("user", user);
			failCnt = 0;
			return "redirect:index.jsp";
		} else {
			failCnt += 1;
			System.out.println(">> 로그인 실패!!! failCnt : " + failCnt );
			model.addAttribute("fail", "fail");
			model.addAttribute("failCnt", failCnt);
			return "loginGo";
		}
	}	
	
	@RequestMapping("/logout.do") 
	public String logout(SessionStatus sessionStatus) {
		sessionStatus.setComplete();
		return "redirect:index.jsp";
	}
	//이메일 인증
	@GetMapping("/mailCheck.do")
	@ResponseBody
	public String mailCheck(String email) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + email);
		return mailService.joinEmail(email);
	}
	@GetMapping("/mailPwdCheck.do")
	@ResponseBody
	public String mailPwdCheck(String email, String pwd) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + email);
		return mailService.mailPwdCheck(email, pwd);
	}
	@GetMapping("/mailUseCheck.do")
	@ResponseBody
	public String mailUseCheck(String email) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + email);
		String mailChk = memberService.mailChk(email);
		System.out.println("mailChk : " + mailChk);
		if(mailChk != null) {
			System.out.println("이미 사용중인 이메일 입니다.");
			return "0";
		}else {
			System.out.println("사용 가능한 이메일 입니다.");
			return mailService.joinEmail(email);
		}
	}
	@RequestMapping("/register.do")
	public String register(MemberVO vo) {
		System.out.println("vo : " + vo);
		System.out.println(">> register() 실행");
		memberService.register(vo);
		return "redirect:index.jsp";
	}
	
	@RequestMapping(value = "/idChk.do", method = RequestMethod.POST,
			produces = "application/json;charset=UTF-8")
	@ResponseBody // response 응답객체의 몸체(body)에 데이터 전달
	public boolean idChk(@RequestBody MemberVO vo){
		boolean chk = false;
		System.out.println("MemberController idChk() 실행");
		String idChk = memberService.idChk(vo);
		if(idChk == null) {
			chk = true;
		} else {
			System.out.println("MemberController idChk() 값 확인 - : " + idChk );
		}
		
		return chk;
	}
	
	
	
	//---------------------------------------------------------푸른님
	
	
	@RequestMapping("/Mypage.do")
	public String Mypage(HttpSession session, Model model) {
		System.out.println("🌐 Mypage.jsp 접속");

		MemberVO mvo = (MemberVO) session.getAttribute("user");
		
		if(mvo == null) {
			
			return "failLogin";
		}
		
		return "Mypage";
	}

	@RequestMapping("/UpdateOK.do")
	public String UpdateOK() {
		System.out.println("🌐 UpdateOK.jsp 접속");
		return "UpdateOK";
	}

	// 회원정보 수정
	@RequestMapping("/Update.do")
	public String Update(MemberVO vo, HttpSession session, HttpServletResponse response) throws IOException {

		MemberVO mvo = (MemberVO) session.getAttribute("user");

		vo.setId(mvo.getId());

		System.out.println(vo.getBirth());
		System.out.println(vo.getEmail());
		System.out.println(vo.getId());
		System.out.println(vo.getHp());

		System.out.println("Update시작");

		memberService.MemberUpdate(vo);

		System.out.println("Update끝");
		response.sendRedirect("Mypage.do");
		return null;
	}

	@RequestMapping("/DeleteOK.do")
	public String DeleteOK() {
		System.out.println("🌐 DeleteOK.jsp 접속");
		return "DeleteOK";
	}

	@RequestMapping("/Delete.do")
	public String MemberDelete(MemberVO vo, HttpSession session) {

		
		
		MemberVO mvo = (MemberVO) session.getAttribute("Member");

		if (mvo.getPassword().equals(vo.getPassword())) {
		
			System.out.println("비밀번호 성공");
			
			memberService.MemberDelete(mvo);
			
			return "login";

		} else {
			System.out.println("비밀번호 실패");
			return "DeleteFail";
		}

	}
	//---혜인
	@RequestMapping(value = "/delivery.do", method = RequestMethod.POST)
	public String deliveryInfo(HttpSession session, MemberVO vo , Model model, 	@RequestParam("id")String id,
																					@RequestParam("chk")String menuId, 
																					@RequestParam("selectDay")String deliveryDate,
																					@RequestParam("menuName")String menuName,
																					@RequestParam("thumbnail")String thumbnail,
																					@RequestParam("subType")int subType,
																					@RequestParam("day") int day) {
		System.out.println("🌐delivery.jsp 접속");
		System.out.println("userId : " + id);
		
		String[] menuIds = menuId.split(",");
		String[] deliveryDates = deliveryDate.split(",");
		String[] menuNames = menuName.split(",");
		String[] thumbnails = thumbnail.split(",");
		
		MemberVO orderInfo = memberService.orderInfo(id); 
		System.out.println("orderInfo ; " + orderInfo);
		
		model.addAttribute("menuIds",menuIds);
		model.addAttribute("deliveryDates",deliveryDates);
		model.addAttribute("menuNames",menuNames);
		model.addAttribute("thumbnails",thumbnails);
		model.addAttribute("day",day);
		model.addAttribute("subType",subType);
		model.addAttribute("orderInfo",orderInfo);
		model.addAttribute("menuId",menuId);
		model.addAttribute("deliveryDate",deliveryDate);
		model.addAttribute("id",id);
		
		
		return"delivery";
	}
	
	
	
}
