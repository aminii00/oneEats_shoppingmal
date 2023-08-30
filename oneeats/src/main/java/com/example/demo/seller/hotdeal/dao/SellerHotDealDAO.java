package com.example.demo.seller.hotdeal.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.HotDealVO;

@Mapper
@Repository("sellerHotDealDAO")
public interface SellerHotDealDAO {

	
	public GoodsVO selectGoodsVO(int goodsNo);
	public int selectNewHotDealNo();
	public void insertHotDeal(Map map)throws DataAccessException;
	
	
	
	
	
	
}
