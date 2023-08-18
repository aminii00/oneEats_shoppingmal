package com.example.demo.admin.coupon.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.example.demo.admin.coupon.service.AdminCouponService;

@Controller("adminCouponController")
public class AdminCouponControlllerImpl implements AdminCouponController {
	@Autowired
	AdminCouponService adminCouponService;
}
