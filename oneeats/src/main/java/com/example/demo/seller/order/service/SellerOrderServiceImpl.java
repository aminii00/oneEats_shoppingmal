package com.example.demo.seller.order.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.seller.order.dao.SellerOrderDAO;

@Service("sellerOrderService")
public class SellerOrderServiceImpl implements SellerOrderService{
	@Autowired
	private SellerOrderDAO sellerOrderDAO;

}
