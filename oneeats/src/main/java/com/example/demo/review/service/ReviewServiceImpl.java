package com.example.demo.review.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public void reviewInsert(ReviewVO reviewVO) {
		reviewDAO.reviewInsert(reviewVO);
	}
}
