package com.example.demo.seller.hotdeal.service;


import java.util.List;
import java.util.Map;

import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.HotDealVO;


public interface SellerHotDealService {

	public GoodsVO selectGoodsVO(int goodsNo);
	public int selectNewHotDealNo();
	public void addHotDeal(HotDealVO hotDealVO);
	public HotDealVO selectHotDealByHotDealNo(int hotdealNo);
	public List<GoodsVO> selectGoodsList(Map map);
	public GoodsVO SearchGoods(int goodsNo);
	//목록
	public List<HotDealVO> selectNewHotDealList();	
	//카테고리 
		public List<Map> countHotDealNums();

//상품 리스트	
		public List<HotDealVO> selectHotDealList(Map pagingMap);
		
}

