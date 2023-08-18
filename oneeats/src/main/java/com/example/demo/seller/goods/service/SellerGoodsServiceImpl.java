package com.example.demo.seller.goods.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.seller.goods.dao.SellerGoodsDAO;

@Service("sellerGoodsService")
public class SellerGoodsServiceImpl implements SellerGoodsService{
	@Autowired
	private SellerGoodsDAO sellerGoodsDAO;

}
