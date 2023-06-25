package com.forme.biz.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("noticeService")
public class NoticeImpl implements NoticeService{
	
	@Autowired
	private NoticeDAO noticeDAO;
	
	public NoticeImpl() {
		System.out.println(">> NoticeDAOImpl() 객체 생성");
	}
	//공지사항 목록 조회(모든 게시글)
	@Override
	public List<NoticeVO> getNoticeList() {
		System.out.println("===> MyBatis 사용 getNoticeList() 실행");
		return noticeDAO.getNoticeList();
	}
	//공지사항 검색
	@Override
	public List<NoticeVO> searchNoticeList(String searchKeyword) {
		System.out.println("===> MyBatis 사용 searchNoticeList() 실행");
		return noticeDAO.searchNoticeList(searchKeyword);
	}
	
	//공지 상세
	@Override
	public NoticeVO getNoticeOne(int noticeNum) {
		System.out.println("===> MyBatis 사용 getNoticeOne() 실행");
		return noticeDAO.getNoticeOne(noticeNum);
	}
	//공지 입력
	public int insertNotice(NoticeVO vo) {
		System.out.println("===> MyBatis 사용 insertNotice() 실행");
		int result = noticeDAO.insertNotice(vo);
		return result;
	}
	
	//공지 수정
	public int updateNotice(NoticeVO vo) {
		System.out.println("===> MyBatis 사용 updateNotice() 실행");
		int result = noticeDAO.updateNotice(vo);
		return result;
	}
	
	//공지 삭제
	public int deleteNotice(NoticeVO vo) {
		System.out.println("===> MyBatis 사용 deleteNotice() 실행");
		int result = noticeDAO.deleteNotice(vo);
		return result;
	}
	
	
}

