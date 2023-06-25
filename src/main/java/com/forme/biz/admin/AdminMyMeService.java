package com.forme.biz.admin;

import java.util.List;

public interface AdminMyMeService {
	AdminMyMeVO getMyMe(AdminMyMeVO vo);
	void updateDeliOk(AdminMyMeVO vo);
	List<AdminMyMeVO> getMyMeList(AdminMyMeVO vo);
	List<AdminMyMeVO> getJsonMyMeList(AdminMyMeVO vo);
	AdminMyMeVO getJsonIncome(AdminMyMeVO vo);
	List<AdminMyMeVO> getJsonIncomeList(String yearMonth);
}
