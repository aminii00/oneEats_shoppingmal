package com.example.demo.seller.goods.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.example.demo.seller.goods.dao.SellerGoodsDAO;
import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.OptionVO;


@Service("sellerGoodsService")
public class SellerGoodsServiceImpl implements SellerGoodsService{
	@Autowired
	private SellerGoodsDAO sellerGoodsDAO;

//	@Override
//	public int addGoods(Map map) throws DataAccessException {
//		return sellerGoodsDAO.insertGoods(map);
//	}
//
//	@Override
//	public int addOption(Map map) throws DataAccessException {
//		return sellerGoodsDAO.insertOption(map);
	//}
	
	@Override
	public boolean addGoods(GoodsVO goodsVO, List<OptionVO> optionList) {
		boolean result = true;
		try {
			sellerGoodsDAO.insertNewGoods(goodsVO);
			sellerGoodsDAO.insertOptions(optionList);
		} catch (Exception e) {
			result = false;
		}
		return result;
	}
	
	
	@Override
	public boolean addGoods(Map map, List<OptionVO> optionList) {
		boolean result = true;
		try {
			sellerGoodsDAO.insertNewGoodsWithMap(map);
			sellerGoodsDAO.insertOptions(optionList);
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
		return result;
	}
	@Override
	public int selectNewGoodsNo() {
		return sellerGoodsDAO.selectNewGoodsNo();
	}

}

