package com.forme.biz.view.frontcontroller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.forme.biz.menu.MenuService;
import com.forme.biz.menu.MenuVO;

//@SessionAttributes("menu")
@SessionAttributes("day")
@Controller
public class MenuController {


	private MenuService menuService;
	
	@Autowired
	public MenuController(MenuService menuService) {
		System.out.println("📦 MenuController() 객체 생성");
		this.menuService = menuService;
	}
	
	// 메소드에 선언된 @ModelAttribute 는 리턴된 데이터를 View에 전달
	// @ModelAttribute 선언된 메소드는 @RequestMapping 메소드보다 먼저 실행된다
	// 뷰에 전달될 때 설정된 명칭(예: conditionMap)
	
	//정회님 컨트롤러 시작-------------------------------------------------------------------------------------------------------------
	@RequestMapping("/getMenu.do")
	public String getMenu(MenuVO vo, Model model) {
		System.out.println("📱 메뉴 상세보기");
		System.out.println("vo : " + vo);
		
		MenuVO menu = menuService.getMenu(vo);
		model.addAttribute("menu", menu);
		System.out.println("DB데이터 menu : " + menu);
		return "getMenu";
	}
	
	@RequestMapping("/getMenuList.do")
	public String getMenuList(MenuVO vo, Model model) {
		System.out.println("📄 게시글 전체 목록 보여주기");
		System.out.println("vo : " + vo);
		
		List<MenuVO> list = menuService.getMenuList(vo);
		
		model.addAttribute("menuList", list);
		
		return "getMenuList";
	}
	
	@RequestMapping("insertMenuView.do")
	public String insertMenuView() {
		return "insertMenuView";
	}
	
	@RequestMapping("/insertMenu.do")
	public String insertMenu(MenuVO vo) throws IllegalStateException, IOException {
		System.out.println("📝 메뉴 입력처리");
		System.out.println("vo : " + vo);
		
		MultipartFile thumbnailFIle = vo.getThumbnailFile();
		MultipartFile menuImgFile = vo.getMenuImgFile();
		
		System.out.println("📤 thumbnailFIle : " + thumbnailFIle);
		System.out.println("📤 menuImgFile : " + menuImgFile);
		
		/* 파일업로드 관련 
	 	MultipartFile 인터페이스 주요메소드
	 	String getOriginalFilename() : 업로드 할 원본파일명 찾기
	 	void transferTo(File dest) : 업로드 할 파일을 업로드(복사) 처리
	 	boolean isEmpty() : 업로드할 파일 존재 여부(없으면 true) 
	 */
		if(thumbnailFIle == null) {
			System.out.println("📫 thumbnailFIle 파라미터가 전달되지 않았을 경우");
		} else if (thumbnailFIle.isEmpty()) {
			System.out.println("📭 전달받은 파일 데이터가 없을 경우");
		} else { // 파일 데이터가 있음
			System.out.println("📬 thumbnailFIle.isEmpty() : " + thumbnailFIle.isEmpty());
			String thumbnailFIleName = thumbnailFIle.getOriginalFilename(); // 원본 파일명
			vo.setThumbnail(thumbnailFIleName);
			System.out.println("💿 원본파일명 : " + thumbnailFIleName);
			String savedThumbnailName = UUID.randomUUID().toString();
			System.out.println("📀 저장파일명 : " + savedThumbnailName);
			
			//물리적 파일 복사
			// uploadFile.transferTo(new File("/Users/kimjunghwe/Desktop/MyStudy/temp/" + savedFileName));
			String deskpathFile = "/Users/kimjunghwe/Desktop/MyStudy/temp/" + savedThumbnailName;
			thumbnailFIle.transferTo(new File(deskpathFile));
		}
		if(menuImgFile == null) {
			System.out.println("📫 menuImgFile 파라미터가 전달되지 않았을 경우");
		} else if (menuImgFile.isEmpty()) {
			System.out.println("📭 전달받은 파일 데이터가 없을 경우");
		} else { // 파일 데이터가 있음
			System.out.println("📬 menuImgFile.isEmpty() : " + menuImgFile.isEmpty());
			String menuImgFileName = menuImgFile.getOriginalFilename(); // 원본 파일명
			vo.setMenuImg(menuImgFileName);
			System.out.println("💿 원본파일명 : " + menuImgFileName);
			String menuImgSavedFileName = UUID.randomUUID().toString();
			System.out.println("📀 저장파일명 : " + menuImgSavedFileName);
			
			//물리적 파일 복사
			// uploadFile.transferTo(new File("/Users/kimjunghwe/Desktop/MyStudy/temp/" + savedFileName));
			String deskpathFile = "/Users/kimjunghwe/Desktop/MyStudy/temp/" + menuImgSavedFileName;
			menuImgFile.transferTo(new File(deskpathFile));
		}
		
		menuService.insertMenu(vo);
		
		return "redirect:getMenuList.do";
	}
	
	@RequestMapping("/updateMenu.do")
	public String updateMenu(MenuVO vo) throws IllegalStateException, IOException {
		System.out.println("🖍️️ 게시글 수정처리️️ ");
		System.out.println("vo : " + vo);
		
		MultipartFile thumbnailFIle = vo.getThumbnailFile();
		MultipartFile menuImgFile = vo.getMenuImgFile();
		
		System.out.println("📤 thumbnailFIle : " + thumbnailFIle);
		System.out.println("📤 menuImgFile : " + menuImgFile);
		
		/* 파일업로드 관련 
	 	MultipartFile 인터페이스 주요메소드
	 	String getOriginalFilename() : 업로드 할 원본파일명 찾기
	 	void transferTo(File dest) : 업로드 할 파일을 업로드(복사) 처리
	 	boolean isEmpty() : 업로드할 파일 존재 여부(없으면 true) 
	 */
		if(thumbnailFIle == null) {
			System.out.println("📫 thumbnailFIle 파라미터가 전달되지 않았을 경우");
			System.out.println("vo.getThumbnail() : " + vo.getThumbnail());
		} else if (thumbnailFIle.isEmpty()) {
			System.out.println("📭 전달받은 파일 데이터가 없을 경우");
		} else { // 파일 데이터가 있음
			System.out.println("📬 thumbnailFIle.isEmpty() : " + thumbnailFIle.isEmpty());
			String thumbnailFIleName = thumbnailFIle.getOriginalFilename(); // 원본 파일명
			vo.setThumbnail(thumbnailFIleName);
			System.out.println("💿 원본파일명 : " + thumbnailFIleName);
			String savedThumbnailName = UUID.randomUUID().toString();
			System.out.println("📀 저장파일명 : " + savedThumbnailName);
			
			//물리적 파일 복사
			// uploadFile.transferTo(new File("/Users/kimjunghwe/Desktop/MyStudy/temp/" + savedFileName));
			String deskpathFile = "/Users/kimjunghwe/Desktop/MyStudy/temp/" + savedThumbnailName;
			thumbnailFIle.transferTo(new File(deskpathFile));
		}
		if(menuImgFile == null) {
			System.out.println("📫 menuImgFile 파라미터가 전달되지 않았을 경우");
			System.out.println("vo.getMenuImg() : " + vo.getMenuImg());
		} else if (menuImgFile.isEmpty()) {
			System.out.println("📭 전달받은 파일 데이터가 없을 경우");
		} else { // 파일 데이터가 있음
			System.out.println("📬 menuImgFile.isEmpty() : " + menuImgFile.isEmpty());
			String menuImgFileName = menuImgFile.getOriginalFilename(); // 원본 파일명
			vo.setMenuImg(menuImgFileName);
			System.out.println("💿 원본파일명 : " + menuImgFileName);
			String menuImgSavedFileName = UUID.randomUUID().toString();
			System.out.println("📀 저장파일명 : " + menuImgSavedFileName);
			
			//물리적 파일 복사
			// uploadFile.transferTo(new File("/Users/kimjunghwe/Desktop/MyStudy/temp/" + savedFileName));
			String deskpathFile = "/Users/kimjunghwe/Desktop/MyStudy/temp/" + menuImgSavedFileName;
			menuImgFile.transferTo(new File(deskpathFile));
		}
		menuService.updateMenu(vo);
		return "getMenuList";
	}
	
	@RequestMapping("/deleteMenu.do")
	public String deleteMenu(@RequestParam("menuId") int menuId, SessionStatus sessionStatus) {
		System.out.println("✂️ 게시글 삭제처리");
		System.out.println("menuId : " + menuId);
		
		menuService.deleteMenu(menuId);
		sessionStatus.setComplete(); //session 데이터 삭
		return "redirect:getMenuList.do";
	}
	//정회님 컨트롤러 끝-------------------------------------------------------------------------------------------------------------
	
	//혜인님 컨트롤러 시작-------------------------------------------------------------------------------------------------------------
	@RequestMapping("/menuView.do")
	public String menuView() {
		System.out.println("🌐menuView.jsp 접속");
		return "menuView";
	}
	@RequestMapping(value = "/subscribe.do", method=RequestMethod.GET)
	public String threeSub(MenuVO vo, Model model, @RequestParam("day")int day ,int oDay) {
		System.out.println("🌐subscribe.jsp 접속");
		System.out.println("ᵔᴥᵔ게시글 전체 목록 보여주기");
		System.out.println("day : " + day);
		System.out.println(oDay);
		List<MenuVO> listSix = menuService.getThumSix();
		System.out.println(listSix);
		List<MenuVO> listEight = menuService.getThumEight();
		System.out.println(listEight);
		List<MenuVO> listTen = menuService.getThumTen();
		System.out.println(listTen);
		model.addAttribute("menuThumSix", listSix);
		model.addAttribute("menuThumEight", listEight);
		model.addAttribute("menuThumTen", listTen);
		model.addAttribute("day", day);
		model.addAttribute("oDay", oDay);
		return "subscribe";
	}
	
	@RequestMapping( "/viewDetail.do")
	public String viewDetail(MenuVO vo, Model model) {
		System.out.println("🌐viewDetail.jsp 접속");
		System.out.println("ᵔᴥᵔ메뉴 상세보기");
		System.out.println("vo : " + vo);
		MenuVO viewDetail = menuService.viewDetail(vo);
		System.out.println(viewDetail);
		model.addAttribute("viewDetail", viewDetail);
		return "viewDetail";
	}
	
	@RequestMapping(value = "/choiceMenu.do", method=RequestMethod.GET)
	public String choiceMenu(MenuVO vo, Model model, int day,  @RequestParam("subType")int subType) {
		System.out.println("🌐choiceMenu.jsp 접속");
		System.out.println("ᵔᴥᵔ메뉴고르기");
		System.out.println("vo : " + vo);
		List<MenuVO> choice = menuService.choice(subType);
		int menuId = vo.getMenuId();
		System.out.println(choice);
		model.addAttribute("subType", subType);
		model.addAttribute("choice", choice);
		model.addAttribute("menuId", menuId);
		return "choiceMenu";
	}
	
	//혜인님 컨트롤러 끝-------------------------------------------------------------------------------------------------------------
	
}
