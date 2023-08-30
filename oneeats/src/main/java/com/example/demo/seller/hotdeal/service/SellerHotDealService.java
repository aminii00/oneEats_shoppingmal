package com.example.demo.seller.hotdeal.service;


import java.util.Map;

import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.HotDealVO;


public interface SellerHotDealService {

	public GoodsVO selectGoodsVO(int goodsNo);
	public int selectNewHotDealNo();
	public void addHotDeal(Map map);
	
	
}
