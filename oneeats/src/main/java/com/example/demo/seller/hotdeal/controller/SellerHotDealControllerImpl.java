package com.example.demo.seller.hotdeal.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.seller.hotdeal.service.SellerHotDealService;

@Controller("sellerHotDealController")
public class SellerHotDealControllerImpl implements SellerHotDealController {
	@Autowired
	private SellerHotDealService sellerHotDealService;
	
	@RequestMapping(value = "/seller/hotdeal/sellerHotDealForm.do")
	public ModelAndView sellerHotDealForm(HttpServletRequest request) {
		String viewName =  (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		System.out.println(mav);
		return mav;
	}
	
	@RequestMapping(value = "/seller/hotdeal/sellerHotDealList.do")
	public ModelAndView sellerHotDealList(HttpServletRequest request) {
		String viewName =  (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		System.out.println(mav);
		return mav;
	}
	
	@RequestMapping(value = "/seller/hotdeal/sellerHotDealModForm.do")
	public ModelAndView sellerHotDealModForm(HttpServletRequest request) {
		String viewName =  (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		System.out.println(mav);
		return mav;
	}
}
