package com.forme.biz.view.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.forme.biz.admin.AdminMyMeService;
import com.forme.biz.admin.AdminMyMeVO;
@SessionAttributes("myme")
@Controller
public class AdminMyMeController {

	private AdminMyMeService mymeService;
	
	@Autowired
	public AdminMyMeController(AdminMyMeService mymeService) {
		System.out.println("📦  AdminMyMeController() 객체생성");
		this.mymeService = mymeService;
	}
	
	@RequestMapping("/adminGetOrderList.do")
	public String getOrderList() {
		return "getOrderList";
	}
	
	@RequestMapping("/adminGetIncome.do")
	public String getIncomeList() {
		
		
		return "getIncomeList";
	}
	
	@RequestMapping("/adminGetOrder.do")
	public String getMyMe(AdminMyMeVO vo, Model model) {
		System.out.println("📱 주문 내역 상세 보기");
		System.out.println("vo : " +  vo);
		AdminMyMeVO order = mymeService.getMyMe(vo);
		model.addAttribute("order", order);
		System.out.println("DB데이터 order : " + order);
		return "getOrderList";
	}
	
	public String getMyMeList(AdminMyMeVO vo, Model model) {
		System.out.println("📋 전체 목록 보여주기");
		System.out.println("vo : " + vo);
		
		List<AdminMyMeVO> list = mymeService.getMyMeList(vo);
		
		model.addAttribute("orderList", list);
		
		return "getOrderList";
	}
	

	@RequestMapping("/UpdateDeliOk.do")
	public String updateDeliOk(@RequestParam(value="myNum") int myNum
														,@RequestParam(value="deliOk")  String deliOk) {
		System.out.println("🖍 배송상태 변경️");
		System.out.println("updateDeliOk myNum : " + myNum);
		System.out.println("updateDeliOk deliOk : " + deliOk);
		
		AdminMyMeVO vo = new AdminMyMeVO();
		
		vo.setMyNum(myNum);
		vo.setDeliOk(deliOk);
		
		System.out.println("vo.getMyNum() : " + vo.getMyNum());
		System.out.println("vo.getDeliOk() : " + vo.getDeliOk());
		
		mymeService.updateDeliOk(vo);
		
		return "getOrderList";
	}
	

	
}
