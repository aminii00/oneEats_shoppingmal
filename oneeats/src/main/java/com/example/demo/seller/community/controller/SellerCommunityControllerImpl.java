package com.example.demo.seller.community.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.seller.community.service.SellerCommunityService;

@Controller("sellerCommunityController")
public class SellerCommunityControllerImpl implements SellerCommunityController{
	@Autowired 
	private SellerCommunityService sellerCommunityService;
	
	@RequestMapping(value = "/seller/community/review/sellerReviewList.do")
	public ModelAndView sellerReviewList(HttpServletRequest request) {
		String viewName =  (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		System.out.println(mav);
		return mav;
	}
	
}
