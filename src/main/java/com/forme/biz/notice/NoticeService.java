package com.forme.biz.notice;

import java.util.List;

public interface NoticeService {
	//CRUD 기능 구현 메소드 정의
	List<NoticeVO> getNoticeList(); //공지 리스트
	List<NoticeVO> searchNoticeList(String searchKeyword); //공지 검색
	NoticeVO getNoticeOne(int noticeNum); //공지 상세
	int insertNotice(NoticeVO vo); //공지 입력
	int updateNotice(NoticeVO vo); //공지 수정
	int deleteNotice(NoticeVO vo); //공지 삭제
}
