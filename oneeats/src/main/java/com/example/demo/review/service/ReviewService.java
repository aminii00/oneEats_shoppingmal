package com.example.demo.review.service;

import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.ReviewVO;

public interface ReviewService {

	public GoodsVO SearchGoods(GoodsVO goodsVO);
	
	public int newReviewNo();
	
	public int reviewInsert(ReviewVO reviewVO);

	public boolean isReviewed(ReviewVO reviewVO);

	public void updateMemberPoint(ReviewVO reviewVO);
}
