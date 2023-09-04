package com.example.demo.review.service;

import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.OrderVO;
import com.example.demo.vo.ReviewVO;

public interface ReviewService {

	public OrderVO SearchGoods(OrderVO order);
	
	public int newReviewNo();
	
	public void reviewInsert(ReviewVO reviewVO);
}
