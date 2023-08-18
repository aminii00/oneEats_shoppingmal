package com.example.demo.admin.coupon.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.admin.coupon.dao.AdminCouponDAO;

@Service("adminCouponService")
public class AdminCouponServiceImpl implements AdminCouponService {
	@Autowired
	AdminCouponDAO adminCouponDAO;
}
