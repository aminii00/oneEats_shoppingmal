package com.example.demo.review.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.ReviewVO;

@Mapper
@Repository("reviewDAO")
public interface ReviewDAO {
	
	public GoodsVO SearchGoods(GoodsVO goodsVO);
	
	public int newReviewNo();
	
	public int reviewInsert(ReviewVO reviewVO);

	public int isReviewed(ReviewVO reviewVO);

	public void updateMemberPoint(ReviewVO reviewVO);

	public void insertPointHistoryForReview(ReviewVO reviewVO);

}
