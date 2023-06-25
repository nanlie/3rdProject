package com.forme.biz.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("AdminMyMeService")
public class AdminMyMeServiceImpl implements AdminMyMeService{

	@Autowired
	private AdminMyMeDAO mymeDAO;
	
	public AdminMyMeServiceImpl() {
		System.out.println("📦 AdminMyMeServiceImpl() 객체생성");
	}
	
	@Override
	public AdminMyMeVO getMyMe(AdminMyMeVO vo) {
		return mymeDAO.getMyMe(vo);
	}

	@Override
	public List<AdminMyMeVO> getMyMeList(AdminMyMeVO vo) {
		return mymeDAO.getMyMeList(vo);
	}

	@Override
	public List<AdminMyMeVO> getJsonMyMeList(AdminMyMeVO vo) {
		return mymeDAO.getJsonMyMeList(vo);
	}

	@Override
	public void updateDeliOk(AdminMyMeVO vo) {
		mymeDAO.updateDeliOk(vo);
	}

	@Override
	public AdminMyMeVO getJsonIncome(AdminMyMeVO vo) {
		return mymeDAO.getJsonIncome(vo);
	}

	@Override
	public List<AdminMyMeVO> getJsonIncomeList(String yearMonth) {
		return mymeDAO.getJsonIncomeList(yearMonth);
	}




}
