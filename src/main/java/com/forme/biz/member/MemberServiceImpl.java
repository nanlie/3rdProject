package com.forme.biz.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;

	public MemberServiceImpl() {
		System.out.println(":: MemberServiceImpl() 객체 생성");
	}

	@Override
	public void register(MemberVO vo) {
		memberDAO.register(vo);

	}

	@Override
	public String idChk(MemberVO vo) {
		String idChk = memberDAO.idChk(vo);
		return idChk;
	}

	@Override
	public MemberVO login(MemberVO vo) {
		MemberVO user = memberDAO.login(vo);
		return user;
	}

	@Override
	public String searchIdOk(MemberVO vo) {
		String searchId = memberDAO.searchIdOk(vo);
		return searchId;
	}

	@Override
	public MemberVO searchPwdOk(MemberVO vo) {
		MemberVO searchPwd = memberDAO.searchPwdOk(vo);
		return searchPwd;
	}

	@Override
	public String mailChk(String email) {
		String mailChk = memberDAO.mailChk(email);
		return mailChk;
	}

	@Override
	public void MemberUpdate(MemberVO vo) {
		memberDAO.MemberUpdate(vo);
	}

	@Override
	public void MemberDelete(MemberVO vo) {
		memberDAO.MemberDelete(vo);
	}

	@Override
	public MemberVO myInf(String id) {

		MemberVO vo = memberDAO.myInf(id);

		return vo;
	}

	@Override
	public MemberVO orderInfo(String id) {
		MemberVO vo = memberDAO.orderInfo(id);
		return vo;
	}

}
