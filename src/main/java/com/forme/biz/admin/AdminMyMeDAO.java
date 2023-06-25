package com.forme.biz.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("adminMyMeService")
public class AdminMyMeDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public AdminMyMeDAO() {
		System.out.println("📦 AdminMyMeDAO 객체생성");
	}
	
	public AdminMyMeVO getMyMe(AdminMyMeVO vo) {
		System.out.println("🌐 Mybatis getMyMe() 실행");
		return null;
	}
	
	public List<AdminMyMeVO> getJsonMyMeList(AdminMyMeVO vo ) {
		System.out.println("🌐 Mybatis getJsonMyMeList(vo) 실행");
		
		return mybatis.selectList("adminDAO.getJsonOrderList", vo);
	}
	
	public List<AdminMyMeVO> getMyMeList(AdminMyMeVO vo) {
		return null;
	}
	
	public void updateDeliOk(AdminMyMeVO vo) {
		System.out.println("🌐 Mybatis updateDeliOk(vo) 실행");
		mybatis.update("adminDAO.updateDeliOk", vo);
	}
	
	public AdminMyMeVO getJsonIncome(AdminMyMeVO vo ) {
		System.out.println("🌐 Mybatis getJsonIncomeList(vo) 실행");
		
		return mybatis.selectOne("adminDAO.getIncomeYear", vo);
	}
	
	public List<AdminMyMeVO> getJsonIncomeList(String yearMonth) {
		System.out.println("🌐 Mybatis getJsonIncomeList(yearMonth) 실행");
		
		return mybatis.selectList("adminDAO.getIncomeMonth", yearMonth);
	}
	
}
