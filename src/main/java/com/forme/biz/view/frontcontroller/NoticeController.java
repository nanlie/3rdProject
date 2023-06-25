package com.forme.biz.view.frontcontroller;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.forme.biz.notice.NoticeService;
import com.forme.biz.notice.NoticeVO;
import com.forme.biz.notice.PagingVO;
import com.forme.biz.reviews.ReviewsService;
import com.forme.biz.reviews.ReviewsVO;

@SessionAttributes("notice") // board 라는 이름의 Model 객체가 있으면 session 에 저장
@Controller
public class NoticeController {

	@Autowired
	NoticeService noticeService;
	
	@Autowired
	ReviewsService reviewsService;
	
	//공지 리스트
	@RequestMapping("/notice.do")
	public String notice( Model model, NoticeVO nVO, PagingVO pVO) {
		System.out.println("🌐 notice.jsp 접속");
		List<NoticeVO> list = null;
		System.out.println("pVO : " + pVO);
		
		if(nVO.getNoticeTitle() != null) {
			String searchKeyword = nVO.getNoticeTitle();
			list = noticeService.searchNoticeList(searchKeyword);
		}else {
			list = noticeService.getNoticeList();
		}
		
		//페이징 시작
		pVO.setTotalRecord(list.size()); 
		pVO.setTotalPage();
		int cPage = pVO.getcPage();
		if (cPage != 0) {
			pVO.setNowPage(cPage);
		}
		if(cPage == 0) {
			cPage = 1;
		}
		pVO.calPaging();
		//페이징 끝
		
		if (pVO.getEnd() > list.size()) pVO.setEnd(list.size());
		list = list.subList(pVO.getBegin()-1, pVO.getEnd()); //5개씩만 보여주기

		model.addAttribute("noticeList", list); 
		model.addAttribute("pVO", pVO);

		return "notice";
	}
	
	//공지 상세
	@RequestMapping("/noticeCon.do")
	public String noticeCon(NoticeVO vo, Model model) {
		System.out.println("🌐 noticeCon.jsp 접속 " + vo + "-");
		vo = noticeService.getNoticeOne(vo.getNoticeNum());
		model.addAttribute("noticeOne", vo);
		return "noticeCon";
	}
	//공지 쓰기
	@RequestMapping("/noticeWrite.do")
	public String noticeWrite(NoticeVO vo, Model model) {
		System.out.println("🌐 noticeWrite.jsp 접속 " + vo);
		model.addAttribute("noticeVO", vo);
		return "noticeWrite";
	}
	
	//공지쓰기
	@RequestMapping("/noticeWtireOK.do")
	public String noticeWtireOK(NoticeVO vo) {
		System.out.println("🌐 noticeWtireOK.jsp 접속");
		noticeService.insertNotice(vo);
		vo.setNoticeTitle(null);
		return "redirect:/notice.do";
	}
	
	//공지수정
	@RequestMapping("/updateOK.do")
	public String updateOK(NoticeVO vo) {
		System.out.println("🌐 updateOK.jsp 접속");
		System.out.println("updateOK-vo : " + vo);
		noticeService.updateNotice(vo);
		return "forward:/noticeCon.do";
	}
	
	//공지삭제
	@RequestMapping("/deleteOK.do")
	public String deleteOK(NoticeVO vo) {
		System.out.println("🌐 deleteOK.jsp 접속");
		noticeService.deleteNotice(vo);
		return "redirect:/notice.do";
	}
	
	//리뷰페이지 이동
	@RequestMapping("/review.do")
	public String review( Model model, PagingVO pVO) {
		System.out.println("🌐 review.jsp 접속");
		List<ReviewsVO> list = null;
		
		list = reviewsService.getReviewsList();
		
		//페이징 시작
				pVO.setTotalRecord(list.size()); 
				pVO.setTotalPage();
				int cPage = pVO.getcPage();
				if (cPage != 0) {
					pVO.setNowPage(cPage);
				}
				if(cPage == 0) {
					cPage = 1;
				}
				pVO.calPaging();
		//페이징 끝
				
		if (pVO.getEnd() > list.size()) pVO.setEnd(list.size());
		list = list.subList(pVO.getBegin()-1, pVO.getEnd()); //5개씩만 보여주기
		
		System.out.println("list : " + list);
		model.addAttribute("reviewsList", list);
		model.addAttribute("pVO", pVO);
		return "review";
	}
	
	//내 리뷰만 보기
	@RequestMapping("/reviewMe.do")
	public String reviewMe(Model model, ReviewsVO vo, PagingVO pVO) {
		System.out.println("🌐 reviewMe.jsp 접속");
		List<ReviewsVO> list = null;
		
		list = reviewsService.getMyReviewList(vo.getId());
		
		//페이징 시작
			String cnt = Integer.toString(list.size());
			if (cnt != null) {
				pVO.setTotalRecord(Integer.parseInt(cnt)); 
			}
			pVO.setTotalPage();
			int cPage = pVO.getcPage();
			if (cPage != 0) {
				pVO.setNowPage(cPage);
			}
			if(cPage == 0) {
				cPage = 1;
			}
			pVO.calPaging();
		//페이징 끝
		
		if (pVO.getEnd() > list.size()) pVO.setEnd(list.size());
		list = list.subList(pVO.getBegin()-1, pVO.getEnd()); //5개씩만 보여주기
		
		model.addAttribute("reviewsList", list);
		model.addAttribute("pVO", pVO); 
		return "review";
	}
	
	//리뷰 삭제
	@RequestMapping("/delRev.do")
	public String delRev(ReviewsVO vo) {
		System.out.println("🌐 delRev.jsp 접속");
		System.out.println(vo);
		reviewsService.delRev(vo.getReviewNum());
		return "redirect:/review.do";
	}
	
	//리뷰 쓰기 페이지로 이동
	@RequestMapping("/wriRev.do")
	public String wriRev(Model model, ReviewsVO vo) {
		System.out.println("🌐 wriRev.jsp 접속");
		System.out.println("vo : " + vo);
		List<ReviewsVO> list = new ArrayList<ReviewsVO>();
		List<ReviewsVO> allList = reviewsService.getCanRev(vo.getId());
		
		for(ReviewsVO allLists : allList) {
			if (reviewsService.searchRev(allLists.getMyNum()) == null) {
				list.add(allLists);
			}
		}
		System.out.println(list);
		model.addAttribute("reviewsList", list);
		return "reviewSelect";
	}
	
	//리뷰 작성 페이지
	@RequestMapping("/revPageGo.do")
	public String revPageGo(Model model, ReviewsVO vo) {
		System.out.println("🌐 wriRevOK.jsp 접속");
		System.out.println("revPageGo-vo : " + vo);
		model.addAttribute("reviewsList", vo);
		return "reviewWrite";
	}
	
	//리뷰 쓰기 완료
	@RequestMapping("/wriRevOK.do")
	public String wriRevOK(ReviewsVO vo) {
		System.out.println("🌐 wriRevOK.jsp 접속");
		System.out.println("vo : " + vo);
		if (vo.getReviewNum() == 0) {
			reviewsService.insRev(vo);
			System.out.println("리뷰입력");
		}else {
			reviewsService.upRev(vo);
			System.out.println("리뷰수정");
		}
		return "redirect:/review.do";
	}
	
}
