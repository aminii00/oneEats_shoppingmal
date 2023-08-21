package com.example.demo.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface MypageController {
	public ModelAndView orderList(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView myPageMain(String message, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView deleteMember(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	
	public ModelAndView bookList(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	
	

}
