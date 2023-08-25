package com.example.demo.admin.community.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.admin.community.service.AdminCommunityService;

@Controller("adminCommunityController")
@RequestMapping("/admin/community")
public class AdminCommunityControllerImpl implements AdminCommunityController {

	@Autowired
	private AdminCommunityService adminCommunityService;
	
	@Override
	@RequestMapping("/review/adminReviewList.do")
	public ModelAndView adminReviewList(HttpServletRequest request) throws IOException{
		request.setCharacterEncoding("utf-8");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
}
