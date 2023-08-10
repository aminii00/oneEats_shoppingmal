package com.example.demo.main;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	

	@RequestMapping(value = "/home.do")
	public ModelAndView home(HttpServletRequest request) {
		String viewName =  (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		System.out.println(mav);
		return mav;
	}
	
	@RequestMapping(value={"/*/*/*.do","/*/*.do","/*.do"})
	public ModelAndView anything(HttpServletRequest request) {
		String viewName =  (String) request.getAttribute("viewName");
		System.out.println("/"+viewName);
		ModelAndView mav = new ModelAndView(viewName);
		System.out.println(mav);
		return mav;
	}
	
	@RequestMapping(value = "/adminCouponList.do")
	public ModelAndView adminCouponList(HttpServletRequest request) {
		String viewName =  (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		System.out.println(mav);
		return mav;
	}
}
