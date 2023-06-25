package com.forme.biz.view.frontcontroller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashSet;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.forme.biz.member.MemberService;
import com.forme.biz.member.MemberVO;
import com.forme.biz.myme.MyMeService;
import com.forme.biz.myme.MyMeVO;

@Controller
public class MyMeController {

	private MyMeService mymeService;

	public MyMeController() {
		// TODO Auto-generated constructor stub
	}

	@Autowired
	public MyMeController(MyMeService mymeService) {
		this.mymeService = mymeService;
	}

	
	@RequestMapping("/MyList.do")
	public String MyMeList(String id, Model model, HttpSession session) {

		MemberVO mvo = (MemberVO) session.getAttribute("user");

		id = mvo.getId();

		List<MyMeVO> mymeList = mymeService.MyMeList(id);

		HashSet<Integer> turnList = new HashSet<Integer>();

		for (MyMeVO turn : mymeList) {

			turnList.add(turn.getTurn());

		}

		System.out.println(turnList);

		model.addAttribute("turnList", turnList);
		model.addAttribute("mymeList", mymeList);

		return "MyList";
	}

	@RequestMapping("/MyMe.do")
	public String Myme(String id, Model model, HttpSession session) {

		MemberVO mvo = (MemberVO) session.getAttribute("user");

		id = mvo.getId();

		List<MyMeVO> mymeList = mymeService.MyMe(id);

		model.addAttribute("mymeList", mymeList);

		return "MyMe";
	}
	
	@RequestMapping("/MyMeSuport.do")
	public String MyMeSuport() {

		

		return "MyMePopup";
	}
	

	@RequestMapping("/changeDeliDate.do")
	public String changeDeliDate(int myNum, String deliDate, String origin, HttpSession session) throws ParseException {

		MemberVO mvo = (MemberVO) session.getAttribute("user");

		MyMeVO mmvo = new MyMeVO();

		mmvo.setId(mvo.getId());
		mmvo.setMyNum(myNum);
		mmvo.setDeliDate(deliDate);

		System.out.println(myNum);
		System.out.println(deliDate);
		System.out.println(origin);

		SimpleDateFormat sdt = new SimpleDateFormat("yyyy-MM-dd");
		Date target = sdt.parse(deliDate);
		Date origin14 = sdt.parse(origin);
		Date originDay = sdt.parse(origin);
		Date origin3 = sdt.parse(origin);

		origin14.setDate(origin14.getDate() + 14);
		origin3.setDate(origin3.getDate() - 3);

		Date now = new Date();
		System.out.println(target);
		System.out.println(origin14);
		System.out.println(origin3);
		System.out.println(now);

		if (origin3.before(now) && now.before(originDay)) {
			System.out.println("배송 3일이전");
			return "sdsdsdsdsdsdsd.do";
		} else if (target.before(origin14)) {

			mymeService.changeDeliDate(mmvo);
		} else {

			System.out.println("2주 밖");

			return "sdsdsdsdsdsdsd.do";
		}
		return "MyMe";

	}
	@RequestMapping(value = "/okOrder.do", method = RequestMethod.POST)
	public String okOrder(HttpSession session, Model model, @RequestParam("payment")String payment,
													@RequestParam("deliAddress")String deliAddress, 
													@RequestParam("hp")String hp,
													@RequestParam("menuId")String menuId,
													@RequestParam("deliDate")String deliDate,
													@RequestParam("subPrice")int subPrice,
													@RequestParam("subType")int subType,
													@RequestParam("id") String id,
													@RequestParam("name") String name,
													@RequestParam("day") int day) {
		System.out.println("🌐 okOrder.jsp 접속");
		System.out.println("menuId : " + menuId);
		System.out.println("deliDate : " + deliDate);
		String[] menuIds = menuId.split(",");
		String[] deliveryDates = deliDate.split(",");
		mymeService.turnUpdate(id);
		for(int i = 0 ; i < day ; i++) {
			System.out.println(id+","+ menuIds[i]+","+ deliAddress+","+deliveryDates[i]+","+subPrice+","+ subType);
			mymeService.okOrder(id, menuIds[i], deliAddress, deliveryDates[i], subPrice, subType);
		}
		return "okOrder";
	}
}
