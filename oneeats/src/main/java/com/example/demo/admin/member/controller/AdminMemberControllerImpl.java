package com.example.demo.admin.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.admin.member.service.AdminMemberService;
import com.example.demo.member.service.MemberService;
import com.example.demo.vo.MemberVO;

@Controller("adminMemberController")
public class AdminMemberControllerImpl implements AdminMemberController{
	
	@Autowired
	private AdminMemberService adminmemberService;
	
	
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
