package com.forme.biz.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("adminMemberService")
public class AdminMemberDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	public AdminMemberDAO() {
		System.out.println("📦 MemberDAO() Mybatis() 객체 생성");
	}
	
	public AdminMemberVO getMember(AdminMemberVO vo) {
		System.out.println("🌐 Mybatis getMember() 실행");
		return mybatis.selectOne("adminDAO.getMember",vo.getId());
	}
	
	public List<AdminMemberVO> getMemberList(AdminMemberVO vo) {
		System.out.println("🌐 Mybatis getMemberList() 실행");
		return mybatis.selectList("adminDAO.getMemberList", vo);
	}

	public List<AdminMemberVO> getJsonMemberList(String searchName) {
		// TODO Auto-generated method stub
		return mybatis.selectList("adminDAO.getSearchMemberList", searchName);
	}
	
}
