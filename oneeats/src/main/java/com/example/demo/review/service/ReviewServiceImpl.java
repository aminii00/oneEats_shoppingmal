package com.example.demo.review.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.review.dao.ReviewDAO;
import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.ReviewVO;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{
	@Autowired
	private ReviewDAO reviewDAO;
	
	@Override
	public GoodsVO SearchGoods(GoodsVO goodsVO) {
		GoodsVO goods = reviewDAO.SearchGoods(goodsVO);
		return goods;
	}
	
	@Override
	public int newReviewNo() {
		int reviewNo = reviewDAO.newReviewNo();
		return reviewNo;
	}
	
	@Override
	public int reviewInsert(ReviewVO reviewVO) {
		return reviewDAO.reviewInsert(reviewVO);
	}
	
	@Override
	public boolean isReviewed(ReviewVO reviewVO) {
		int result = reviewDAO.isReviewed(reviewVO);
		if (result>0) {
			return true;
		}
		return false;
	}
	
	@Override
	@Transactional
	public void updateMemberPoint(ReviewVO reviewVO) {
		reviewDAO.updateMemberPoint(reviewVO);
		reviewDAO.insertPointHistoryForReview(reviewVO);
	}
	
	
	
}
