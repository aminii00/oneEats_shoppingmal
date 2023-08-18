package com.example.demo.admin.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller("adminMemberController")
public class AdminMemberControllerImpl implements AdminMemberController{
	@RequestMapping(value = "/admin/member/adminMemberDetail.do")
	public ModelAndView adminMemberDetail(HttpServletRequest request) {
		String viewName =  (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		System.out.println(mav);
		return mav;
	}
	
	@RequestMapping(value = "/admin/member/adminMemberList.do")
	public ModelAndView adminMemberList(HttpServletRequest request) {
		String viewName =  (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		System.out.println(mav);
		return mav;
	}
}
