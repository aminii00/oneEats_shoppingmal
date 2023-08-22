package com.example.demo.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.vo.OrderVO;

public interface MypageController {
	public ModelAndView orderList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView orderDetail(@RequestParam("orderNo") int orderNo, HttpServletRequest request, HttpServletResponse response)  throws Exception;
	
	public ModelAndView orderConfirm(@RequestParam("memberNo") int memberNo, HttpServletRequest request, HttpServletResponse response)  throws Exception;
	
	public ModelAndView newOrder(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView myPageMain(String message, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView deleteMember(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	
	public ModelAndView bookList(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	
	public ModelAndView deleteBook(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView couponSearch(HttpServletRequest request, HttpServletResponse response)  throws Exception;

}
