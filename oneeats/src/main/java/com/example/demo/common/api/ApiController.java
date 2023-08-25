package com.example.demo.common.api;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.common.api.kakao.service.KakaoService;

@Controller
public class ApiController {
	@Autowired
	private KakaoService kakaoService;
	
    @RequestMapping(value="/apitest/loginForm.do", method= RequestMethod.GET)
    public ModelAndView loginForm(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("/member/loginForm");
    	mav.addObject("kakaoUrl", kakaoService.getKakaoLogin());
        return mav;
    }
    
    @RequestMapping(value = "/apitest/registerSelect.do")
    public ModelAndView registerForm(HttpServletRequest request) {
    	ModelAndView mav = new ModelAndView("/member/registerTypeSelect");  
    	mav.addObject("kakaoUrl",kakaoService.getKakaoLogin());
    	return mav;
    }

}
