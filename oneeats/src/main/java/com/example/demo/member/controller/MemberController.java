package com.example.demo.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.vo.MemberVO;

public interface MemberController {
	
	public ModelAndView Register(@ModelAttribute("memberVO") MemberVO memberVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView login(@ModelAttribute("member") MemberVO member, 
			RedirectAttributes rAttr, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
			
	public ModelAndView idSearch( HttpServletRequest request, HttpServletResponse response, @ModelAttribute("memberVO") MemberVO memberVO, 
			RedirectAttributes rAttr) throws Exception;
}
