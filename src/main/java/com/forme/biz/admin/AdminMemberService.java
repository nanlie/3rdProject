package com.forme.biz.admin;

import java.util.List;

public interface AdminMemberService {
	//CRUD 기능 구현 메소드 정의
	AdminMemberVO getMember(AdminMemberVO vo);
	List<AdminMemberVO> getMemberList(AdminMemberVO vo);
	List<AdminMemberVO> getJsonMemberList(String searchName);
	
	
}
