package com.example.demo.seller.goods.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.example.demo.seller.goods.dao.SellerGoodsDAO;

@Service("sellerGoodsService")
public class SellerGoodsServiceImpl implements SellerGoodsService{
	@Autowired
	private SellerGoodsDAO sellerGoodsDAO;

	@Override
	public int addGoods(Map map) throws DataAccessException {
		return sellerGoodsDAO.insertGoods(map);
	}

}

