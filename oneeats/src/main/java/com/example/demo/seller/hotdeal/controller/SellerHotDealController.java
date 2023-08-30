package com.example.demo.seller.hotdeal.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;


import org.springframework.web.servlet.ModelAndView;

public interface SellerHotDealController {
	
	
	public ModelAndView addHotdeals(HttpServletRequest request) throws IOException;



}
