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
import com.forme.biz.admin.AdminMyMeService;
import com.forme.biz.admin.AdminMyMeVO;

@RestController
public class AdminMyMeAjaxController {
	@Autowired
	private AdminMyMeService mymeService;
	
	public AdminMyMeAjaxController() {
		System.out.println("📦 AdminMyMeAjaxController() 객체 생성");
	}
	
	@RequestMapping("/getJsonOrderList.do")
	public List<AdminMyMeVO> getJsonOrderList(@RequestParam(value="searchBeginDate") String searchBeginDate
																							, @RequestParam(value="searchEndDate") String searchEndDate
																							, @RequestParam(value="deliOk") String deliOk
																							, @RequestParam(value="orderKeyword") String orderKeyword) {
		System.out.println("AjaxController searchBeginDate : " + searchBeginDate);
		System.out.println("AjaxController searchEndDate : " + searchEndDate);
		System.out.println("🌐 AdminMyMeAjaxController.getJsonOrderList() 실행");
		
		AdminMyMeVO vo = new AdminMyMeVO();
		vo.setSearchBeginDate(searchBeginDate);
		vo.setSearchEndDate(searchEndDate);
		vo.setDeliOk(deliOk);
		vo.setOrderKeyword(orderKeyword);
		
		System.out.println("vo.getSearchBeginDate() : " + vo.getSearchBeginDate());
		System.out.println("vo.getSearchEndDate() : " + vo.getSearchEndDate());
		System.out.println("vo.getDeliOk() : " + vo.getDeliOk());
		System.out.println("vo.getOrderKeyword() : " + vo.getOrderKeyword());
		
		List<AdminMyMeVO> orderList = mymeService.getJsonMyMeList(vo);
				
		System.out.println("📋 orderrList : " +  orderList);
		
		return orderList;
	}
	
	@RequestMapping(value = "/getJsonOrder.do", method = RequestMethod.POST
										,produces = "application/json;charset=UTF-8")
	public AdminMyMeVO getJsonOrder(@RequestBody AdminMyMeVO vo) {
		System.out.println("🌐 AdminMyMeAjaxController.getJsonOrder() 실행");
		System.out.println("getJsonOrder() vo : " + vo);
		
		AdminMyMeVO myme = mymeService.getMyMe(vo);
		System.out.println("getJsonOrder() myme : " + myme);
		return myme;
	}
	
	
	@RequestMapping("/getJsonIncome.do")
	public AdminMyMeVO getJsonIncome(@RequestParam(value="incomeYear") int incomeYear) {
		System.out.println("🌐 AdminMyMeAjaxController.getJsonIncome() 실행");
		System.out.println("AjaxController incomeYear : " + incomeYear);
		
		AdminMyMeVO vo = new AdminMyMeVO();
		vo.setIncomeYear(incomeYear);
		AdminMyMeVO income = mymeService.getJsonIncome(vo);
		System.out.println("📋 income : " +  income);
		
		return income;
	}
	
	@RequestMapping("/getJsonIncomeList.do")
	public List<AdminMyMeVO> getJsonIncomeList(@RequestParam(value="incomeYear") int incomeYear
			, @RequestParam(value="incomeMonth") int incomeMonth
			) {
		System.out.println("🌐 AdminMyMeAjaxController.getJsonIncomeList() 실행");
		System.out.println("AjaxController incomeYear : " + incomeYear);
		System.out.println("AjaxController incomeMonth : " + incomeMonth);
		
		AdminMyMeVO vo = new AdminMyMeVO();
		vo.setIncomeYear(incomeYear);
		vo.setIncomeMonth(incomeMonth);
		
		int pushYear = vo.getIncomeYear();
		int pushMonth =vo.getIncomeMonth();
		
		String yearMonth = Integer.toString(pushYear) + "-";
		if(pushMonth < 11) {
			yearMonth += "0" + Integer.toString(pushMonth);
		} else if(pushMonth >= 11) {
			yearMonth += Integer.toString(pushMonth);
		}
		
		System.out.println("yearMonth : " + yearMonth);
		
		List<AdminMyMeVO> incomeList = mymeService.getJsonIncomeList(yearMonth);
		
		System.out.println("📋 incomeList : " +  incomeList);
		
		return incomeList;
	}
	
}
