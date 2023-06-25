package com.forme.biz.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("AdminMemberService")
public class AdminMemberServiceImpl implements AdminMemberService{

	@Autowired
	private AdminMemberDAO memberDAO;
	
	public AdminMemberServiceImpl() {
		System.out.println("📦 AdminMemberServiceImpl() 객체 생성");
	}
	
	@Override
	public AdminMemberVO getMember(AdminMemberVO vo) {
		return memberDAO.getMember(vo);
	}

	@Override
	public List<AdminMemberVO> getMemberList(AdminMemberVO vo) {
		return memberDAO.getMemberList(vo);
	}

	@Override
	public List<AdminMemberVO> getJsonMemberList(String searchName) {
		return memberDAO.getJsonMemberList(searchName);
	}

}
