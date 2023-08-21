package com.example.demo.member.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.member.service.MemberService;
import com.example.demo.vo.MemberVO;

@Controller("memberController")
public class MemberControllerImpl implements MemberController {

	@Autowired
	private MemberService memberService;
	
	@Override
	@RequestMapping(value="/member/register.do" ,method = RequestMethod.POST)
		public ModelAndView Register(@ModelAttribute("memberVO") MemberVO memberVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("여기는 register.do");
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		System.out.println(memberVO);
		int MemberNo = memberService.registerInfoNo();
		memberVO.setMemberNo(MemberNo);
		 memberService.registerInfo(memberVO);
		
		ModelAndView mav = new ModelAndView("redirect:/member/login");
		return mav;
	}
	
	//민아 로그인
	@Override
	@RequestMapping(value = "/member/login.do", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("member") MemberVO member, 
			RedirectAttributes rAttr, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		MemberVO memberVO = memberService.login(member);
		if(memberVO != null) {
			HttpSession session = request.getSession();
			session.setAttribute("member", memberVO);
			session.setAttribute("isLogOn", true);
				mav.setViewName("redirect:/main/mainPage.do");
			
		}else {
			rAttr.addAttribute("result","loginFailed");
			mav.setViewName("redirect:/member/loginForm.do");
		}
		
		return mav;
	}
	
	
	// 민아 아이디 찾기
	@Override
	@RequestMapping(value = "/member/idSearch.do", method = RequestMethod.POST)
	public ModelAndView idSearch( HttpServletRequest request, HttpServletResponse response, @ModelAttribute("memberVO") MemberVO memberVO, 
			RedirectAttributes rAttr) throws Exception{
		System.out.println("idSearch Controller");
		ModelAndView mav = new ModelAndView();
		String id = memberService.idSearch(memberVO);
		System.out.println("id = " + id);
		mav.addObject("id", id);
		mav.setViewName("/member/idForm");
		return mav;
	}
	

		
}
