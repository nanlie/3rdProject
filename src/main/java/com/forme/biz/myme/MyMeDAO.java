package com.forme.biz.myme;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyMeDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public MyMeDAO() {
		System.out.println("MyMeDAO 생성");
	}

	public List<MyMeVO> MyMeList(String id) {

		return mybatis.selectList("mymeDAO.MyMeList", id);
	}

	public List<MyMeVO> MyMe(String id) {
		
		return mybatis.selectList("mymeDAO.MyMeGo", id);
	}

	public void changeDeliDate(MyMeVO mmvo) {

		mybatis.update("mymeDAO.deliDateUpdate", mmvo);
	}

	public void okOrder(String id, String menuId, String deliAddress, String deliDate, int subPrice, int subType) {
		System.out.println("dao:"+id+","+menuId+","+ deliAddress+","+ deliDate+","+ subPrice+","+ subType);
		Map map = new HashMap();
		int turn = mybatis.selectOne("getTurn",id);
		System.out.println("turn");
		map.put("turn",turn);
		map.put("id",id);
		map.put("menuId",menuId);
		map.put("deliAddress",deliAddress);
		map.put("deliDate",deliDate);
		map.put("subPrice",subPrice);
		map.put("subType",subType);
		
		mybatis.insert("mymeDAO.okOrder", map);
	}

	public void turnUpdate(String id) {
		mybatis.update("mymeDAO.turnUpdate",id);
	}

}
