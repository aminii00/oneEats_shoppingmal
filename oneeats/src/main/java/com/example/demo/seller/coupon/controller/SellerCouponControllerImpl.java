package com.example.demo.seller.coupon.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.seller.coupon.service.SellerCouponService;

@Controller("sellerCouponController")
public class SellerCouponControllerImpl implements SellerCouponController{
	@Autowired 
	private SellerCouponService sellerCouponService;
	
	@RequestMapping(value = "/seller/coupony/sellerCouponForm.do")
	public ModelAndView sellerCouponForm(HttpServletRequest request) {
		String viewName =  (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		System.out.println(mav);
		return mav;
	}
	
	@RequestMapping(value = "/seller/coupony/sellerCouponList.do")
	public ModelAndView sellerCouponList(HttpServletRequest request) {
		String viewName =  (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		System.out.println(mav);
		return mav;
	}
}
