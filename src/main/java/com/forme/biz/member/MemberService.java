package com.forme.biz.member;

public interface MemberService {
	void register(MemberVO vo);
	String idChk(MemberVO vo);
	MemberVO login(MemberVO vo);
	String searchIdOk(MemberVO vo);
	MemberVO searchPwdOk(MemberVO vo);
	String mailChk(String email);
	
	MemberVO myInf(String id);
	void MemberUpdate(MemberVO vo);
	void MemberDelete(MemberVO vo);
	
	//--혜인
		MemberVO orderInfo(String id);
}
