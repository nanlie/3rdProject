package com.forme.biz.reviews;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewsDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public ReviewsDAO() {
		System.out.println(">> NoticeDAO() 객체 생성");
	}
	//리뷰 리스트
	public List<ReviewsVO> getReviewsList() {
		System.out.println("===> MyBatis 사용 getReviewsList() 실행");
		return mybatis.selectList("reviews.getReviewsList");
	}
	//내 리뷰 리스트
	public List<ReviewsVO> getMyReviewList(String id) {
		System.out.println("===> MyBatis 사용 getMyReviewList() 실행");
		return mybatis.selectList("reviews.getMyReviewList", id);
	}
	//리뷰 삭제
	public void delRev(int reviewNum) {
		System.out.println("===> MyBatis 사용 delRev() 실행");
		mybatis.delete("reviews.delRev", reviewNum);
	}
	//리뷰 수정
	public void upRev(ReviewsVO vo) {
		System.out.println("===> upRev() 실행");
		mybatis.update("reviews.upRev", vo);
	}
	//리뷰 쓰기
	public void insRev(ReviewsVO vo) {
		System.out.println("===> upRev() 실행");
		mybatis.insert("reviews.insRev", vo);
	}
	//작성 가능한 리뷰 조회
	public List<ReviewsVO> getCanRev(String id) {
		System.out.println("===> getCanRev() 실행");
		List<ReviewsVO> review = mybatis.selectList("reviews.getCanRev", id);
		return review;
	}
	//리뷰 작성 여부 조회
	public ReviewsVO searchRev(int myNum) {
		System.out.println("===> searchRev() 실행");
		ReviewsVO review = mybatis.selectOne("reviews.searchRev", myNum);
		return review;
	}
	
}
