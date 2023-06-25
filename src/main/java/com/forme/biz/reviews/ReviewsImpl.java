package com.forme.biz.reviews;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forme.biz.notice.NoticeVO;

@Service("reviewsService")
public class ReviewsImpl implements ReviewsService{
	
	@Autowired
	private ReviewsDAO reviewsDAO;
	
	public ReviewsImpl() {
		System.out.println(">> NoticeDAOImpl() 객체 생성");
	}

	// 리뷰 조회(모든 게시글)
	@Override
	public List<ReviewsVO> getReviewsList() {
		System.out.println("===> MyBatis 사용 getNoticeList() 실행");
		return reviewsDAO.getReviewsList();
	}
	
	// 내 리뷰 조회
	@Override
	public List<ReviewsVO> getMyReviewList(String id) {
		System.out.println("===> MyBatis 사용 getMyReviewList() 실행");
		return reviewsDAO.getMyReviewList(id);
	}
	
	// 리뷰 삭제
	@Override
	public void delRev(int reviewNum) {
		System.out.println("===> MyBatis 사용 getMyReviewList() 실행");
		reviewsDAO.delRev(reviewNum);
	}
	
	// 리뷰 수정
	@Override
	public void upRev(ReviewsVO vo) {
		System.out.println("===> MyBatis 사용 upRev() 실행");
		reviewsDAO.upRev(vo);
	}
	
	// 리뷰 쓰기
	@Override
	public void insRev(ReviewsVO vo) {
		System.out.println("===> MyBatis 사용 insRev() 실행");
		reviewsDAO.insRev(vo);
	}
	
	// 작성 가능한 리뷰 조회
	@Override
	public List<ReviewsVO> getCanRev(String id) {
		System.out.println("===> MyBatis 사용 getCanRev() 실행");
		return reviewsDAO.getCanRev(id);
	}
	
	// 작성 가능한 리뷰 작성 여부 조회
	@Override
	public ReviewsVO searchRev(int myNum) {
		System.out.println("===> MyBatis 사용 searchRev() 실행");
		return reviewsDAO.searchRev(myNum);
	}
	
}

