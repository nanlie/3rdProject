package com.forme.biz.view.admin;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.forme.biz.admin.AdminMenuService;
import com.forme.biz.admin.AdminMenuVO;

@SessionAttributes("menu")
@Controller
public class AdminMenuController {


	private AdminMenuService menuService;
	
	@Autowired
	public AdminMenuController(AdminMenuService menuService) {
		System.out.println("📦 MenuController() 객체 생성");
		this.menuService = menuService;
	}
	
	// 메소드에 선언된 @ModelAttribute 는 리턴된 데이터를 View에 전달
	// @ModelAttribute 선언된 메소드는 @RequestMapping 메소드보다 먼저 실행된다
	// 뷰에 전달될 때 설정된 명칭(예: conditionMap)
	
	@RequestMapping("/adminGetMenu.do")
	public String getMenu(AdminMenuVO vo, Model model) {
		System.out.println("📱 메뉴 상세보기");
		System.out.println("vo : " + vo);
		
		AdminMenuVO menu = menuService.getMenu(vo);
		model.addAttribute("menu", menu);
		System.out.println("DB데이터 menu : " + menu);
		return "getMenu";
	}
	
	@RequestMapping("/adminGetMenuList.do")
	public String getMenuList(AdminMenuVO vo, Model model) {
		System.out.println("📄 게시글 전체 목록 보여주기");
		System.out.println("vo : " + vo);
		
		List<AdminMenuVO> list = menuService.getMenuList(vo);
		
		model.addAttribute("menuList", list);
		
		return "getMenuList";
	}
	
	@RequestMapping("/adminInsertMenuView.do")
	public String insertMenuView() {
		return "insertMenuView";
	}
	
	@RequestMapping("/adminInsertMenu.do")
	public String insertMenu(AdminMenuVO vo) throws IllegalStateException, IOException {
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
			//String deskpathFile = "/Users/kimjunghwe/Desktop/MyStudy/temp/" + savedThumbnailName;
			//thumbnailFIle.transferTo(new File(deskpathFile));
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
			//String deskpathFile = "/Users/kimjunghwe/Desktop/MyStudy/temp/" + menuImgSavedFileName;
			//menuImgFile.transferTo(new File(deskpathFile));
		}
		
		menuService.insertMenu(vo);
		
		return "redirect:adminGetMenuList.do";
	}
	
	@RequestMapping("/adminUpdateMenu.do")
	public String updateMenu(AdminMenuVO vo) throws IllegalStateException, IOException {
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
			//String deskpathFile = "/Users/kimjunghwe/Desktop/MyStudy/temp/" + savedThumbnailName;
			//thumbnailFIle.transferTo(new File(deskpathFile));
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
			//String deskpathFile = "/Users/kimjunghwe/Desktop/MyStudy/temp/" + menuImgSavedFileName;
			//menuImgFile.transferTo(new File(deskpathFile));
		}
		menuService.updateMenu(vo);
		return "getMenuList";
	}
	
	@RequestMapping("/adminDeleteMenu.do")
	public String deleteMenu(@RequestParam("menuId") int menuId, SessionStatus sessionStatus) {
		System.out.println("✂️ 게시글 삭제처리");
		System.out.println("menuId : " + menuId);
		
		menuService.deleteMenu(menuId);
		sessionStatus.setComplete(); //session 데이터 삭
		return "redirect:adminGetMenuList.do";
	}
	
	
}
