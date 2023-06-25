package com.forme.biz.notice;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public NoticeDAO() {
		System.out.println(">> noticeDAO() 객체 생성");
	}
	//공지사항 리스트
	public List<NoticeVO> getNoticeList() {
		System.out.println("===> MyBatis 사용 getNoticeList() 실행");
		return mybatis.selectList("notice.getNoticeList");
	}
	//공지사항 검색
	public List<NoticeVO> searchNoticeList(String searchKeyword) {
		System.out.println("===> MyBatis 사용 searchNoticeList() 실행");
		return mybatis.selectList("notice.searchNoticeList", searchKeyword);
	}
	//공지사항 상세
	public NoticeVO getNoticeOne(int noticeNum) {
		System.out.println("===> MyBatis 사용 getNoticeOne() 실행"); //return
		NoticeVO vo = mybatis.selectOne("notice.getNoticeOne", noticeNum); 
		return vo;
	}
	//공지 입력
	public int insertNotice(NoticeVO vo) {
		System.out.println("===> MyBatis 사용 insertNotice() 실행"); //return
		int result = mybatis.insert("notice.insertNotice", vo);
		return result;
	}
	//공지 수정
	public int updateNotice(NoticeVO vo) {
		System.out.println("===> MyBatis 사용 updateNotice() 실행"); //return
		int result = mybatis.update("notice.updateNotice", vo);
		return result;
	}
	//공지 삭제
	public int deleteNotice(NoticeVO vo) {
		System.out.println("===> MyBatis 사용 deleteNotice() 실행"); //return
		int result = mybatis.delete("notice.deleteNotice", vo);
		return result;
	}
	
	
}
