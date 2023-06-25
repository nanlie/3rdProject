package com.forme.biz.view.frontcontroller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.forme.biz.notice.NoticeService;
import com.forme.biz.notice.NoticeVO;
import com.forme.biz.reviews.ReviewsService;
import com.forme.biz.reviews.ReviewsVO;

@Controller
public class FrontController {
	
	@Autowired
	NoticeService noticeService;
	
	@Autowired
	ReviewsService reviewsService;

	public FrontController() {
		System.out.println("📦 FrontController() 객체 생성");
	}
	
	@RequestMapping("/index.do")
	public String index() {
		System.out.println("🌐 index.jsp 접속");
		return "index";
	}
	@RequestMapping("/main.do") //index -> main.do로 전송
	public String main(Model model) {
		System.out.println("🌐 main.jsp 접속");
		List<ReviewsVO> list = null;
		list = reviewsService.getReviewsList();
		model.addAttribute("reviewsList", list);
		return "main";
	}
	
	//공지 상세
	@RequestMapping("/noticePopup.do")
	public String noticeCon1(NoticeVO vo, Model model) {
		System.out.println("🌐 noticePopup.jsp 접속 " + vo + "-");
		vo = noticeService.getNoticeOne(vo.getNoticeNum());
		model.addAttribute("noticeOne", vo);
		return "noticePopup";
	}
	
	
	
}
