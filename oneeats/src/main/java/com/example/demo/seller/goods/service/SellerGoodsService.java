package com.example.demo.seller.goods.service;

import java.util.List;
import java.util.Map;

import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.OptionVO;



public interface SellerGoodsService {

//		public int addGoods(Map map) throws DataAccessException;
//
//		public int addOption(Map map) throws DataAccessException;
	
	public boolean addGoods(GoodsVO goodsVO, List<OptionVO> OptionList);

	public int selectNewGoodsNo();

	public boolean addGoods(Map map, List<OptionVO> OptionList);
	
	
	

}
