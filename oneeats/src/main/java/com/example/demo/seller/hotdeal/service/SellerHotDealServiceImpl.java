package com.example.demo.seller.hotdeal.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.seller.hotdeal.dao.SellerHotDealDAO;
import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.HotDealVO;
import com.example.demo.vo.OptionVO;

@Service("sellerHotDealService")
public class SellerHotDealServiceImpl implements SellerHotDealService{
	@Autowired
	private SellerHotDealDAO sellerHotDealDAO;

	
	@Override
	public GoodsVO selectGoodsVO(int goodsNo) {
		GoodsVO goodsVO = sellerHotDealDAO.selectGoodsVO(goodsNo);
		return goodsVO;
	}
	
	
	@Override
	public int selectNewHotDealNo() {
		return sellerHotDealDAO.selectNewHotDealNo();
	}


	@Override
	public void addHotDeal(Map map) {
		
		sellerHotDealDAO.insertHotDeal(map);
	}


}
	


	
	
	
	
	
	
	
	
	
	

