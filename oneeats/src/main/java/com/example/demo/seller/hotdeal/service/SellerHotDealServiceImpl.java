package com.example.demo.seller.hotdeal.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.seller.hotdeal.dao.SellerHotDealDAO;

@Service("sellerHotDealService")
public class SellerHotDealServiceImpl implements SellerHotDealService{
	@Autowired
	private SellerHotDealDAO sellerHotDealDAO;

}
