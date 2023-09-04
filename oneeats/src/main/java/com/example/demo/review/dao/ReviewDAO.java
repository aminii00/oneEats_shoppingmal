package com.example.demo.review.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.OrderVO;
import com.example.demo.vo.ReviewVO;

@Mapper
@Repository("reviewDAO")
public interface ReviewDAO {
	
	public OrderVO SearchGoods(OrderVO orderVO);
	
	public int newReviewNo();
	
	public void reviewInsert(ReviewVO reviewVO);

}
