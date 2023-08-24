package com.example.demo.common.api;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ApiController {
	@Autowired
	private ApiService apiService;
	
	
	@RequestMapping("/kakao")
	public ModelAndView kakaologin() {
		return null;
		
	}
	
}
