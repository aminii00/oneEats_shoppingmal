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
	
	public void reviewInsert(ReviewVO reviewVO);

}
