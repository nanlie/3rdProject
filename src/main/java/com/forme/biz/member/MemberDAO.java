package com.forme.biz.member;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public MemberDAO() {
		System.out.println(":: MemberDAO() 객체 생성");
	}
	//회원가입
	public void register(MemberVO vo) {
		System.out.println(">> register() 실행");
		mybatis.insert("memberDAO.register", vo);
	}
	//아이디 중복확인
	public String idChk(MemberVO vo) {
		System.out.println(">>MemberDAO idChk() 실행");
		System.out.println(">>MemberDAO vo 값 확인 : " + vo);
		MemberVO idChk = new MemberVO();
		String getId = mybatis.selectOne("memberDAO.idChk", vo.getId());
		idChk.setId(getId);
		System.out.println(">>MemberDAO idChk() 값 확인 : " + idChk.getId());
		return idChk.getId();
	}
	//로그인
	public MemberVO login(MemberVO vo) {
		System.out.println(">>MemberDAO login() 실행");
		System.out.println(">>MemberDAO vo 값 확인 : " + vo);
		MemberVO login = mybatis.selectOne("memberDAO.login", vo);
		System.out.println(">>MemberDAO login() 값 확인 : " + login);
		return login;
	}
	public String searchIdOk(MemberVO vo) {
		System.out.println(">>MemberDAO searchIdOk() 실행");
		System.out.println(">>MemberDAO vo 값 확인 : " + vo);
		MemberVO searchId = new MemberVO();
		String id = mybatis.selectOne("memberDAO.searchIdOk", vo);
		searchId.setId(id);
		System.out.println(">>MemberDAO searchIdOk() 값 확인 : " + id);
		return searchId.getId();
		
	}
	public MemberVO searchPwdOk(MemberVO vo) {
		System.out.println(">>MemberDAO searchPwdOk() 실행");
		System.out.println(">>MemberDAO vo 값 확인 : " + vo);
		MemberVO searchPwd = mybatis.selectOne("memberDAO.searchPwdOk", vo);
		return searchPwd;
	}
	public String mailChk(String email) {
		System.out.println(">>MemberDAO mailChk() 실행");
		System.out.println(">>MemberDAO String 값 확인 : " + email);
		String mailChk = mybatis.selectOne("memberDAO.mailChk", email);
		System.out.println(">>MemberDAO mailChk : " + mailChk);
		return mailChk;
	}
	
	public MemberVO myInf(String id) {
		MemberVO vo = mybatis.selectOne("memberDAO.myInf", id);
		return vo;
	}
	
	public void MemberUpdate(MemberVO vo) {
		mybatis.update("memberDAO.memberUpdate", vo);
	}

	public void MemberDelete(MemberVO vo) {
		mybatis.delete("memberDAO.memberDelete", vo);
	}
	public MemberVO orderInfo(String id) {
		return mybatis.selectOne("memberDAO.orderInfo", id);
	}
}
