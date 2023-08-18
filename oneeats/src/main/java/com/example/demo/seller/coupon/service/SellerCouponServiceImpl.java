package com.example.demo.seller.coupon.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.seller.coupon.dao.SellerCouponDAO;

@Service("sellerCouponService")
public class SellerCouponServiceImpl implements SellerCouponService{
	@Autowired 
	private SellerCouponDAO sellerCouponDAO; 

}
