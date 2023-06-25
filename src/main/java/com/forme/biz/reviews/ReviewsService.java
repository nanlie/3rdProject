package com.forme.biz.reviews;

import java.util.List;

public interface ReviewsService {
	//CRUD 기능 구현 메소드 정의
	List<ReviewsVO> getReviewsList(); //리뷰 리스트
	List<ReviewsVO> getMyReviewList(String id); //내 리뷰 리스트
	void delRev(int reviewNum); // 리뷰 삭제
	void upRev(ReviewsVO vo); // 리뷰 수정
	void insRev(ReviewsVO vo); //리뷰 쓰기
	List<ReviewsVO> getCanRev(String id); // 작성 가능한 리뷰 조회
	ReviewsVO searchRev(int myNum); // 작성 가능한 리뷰 작성 여부 조회
}
