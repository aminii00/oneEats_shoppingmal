package com.example.demo.community.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface CommunityController {

	
	public ModelAndView noticeList(HttpServletRequest request, HttpServletResponse response);
	public ModelAndView noticeDetail(HttpServletRequest request, HttpServletResponse response) throws IOException;
	}
