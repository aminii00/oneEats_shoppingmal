package com.example.demo.seller.hotdeal.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller("sellerhotdealController")
public class SellerHotDealControllerImpl implements SellerHotDealController {

	
	@RequestMapping(value = "/seller/hotdeal/sellerHotDealModForm.do")
	public ModelAndView sellerHotDealModForm(HttpServletRequest request) {
		String viewName =  (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		System.out.println(mav);
		return mav;
	}
}
