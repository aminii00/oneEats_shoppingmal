package com.example.demo.seller.order.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.seller.order.service.SellerOrderService;

@Controller("sellerOrderController")
public class SellerOrderControllerImpl implements SellerOrderController{
	@Autowired
	private SellerOrderService sellerOrderService;
	
	@RequestMapping(value = "/seller/order/sellerOrderList.do")
	public ModelAndView sellerOrderList(HttpServletRequest request) {
		String viewName =  (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		System.out.println(mav);
		return mav;
	}

}
