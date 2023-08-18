package com.example.demo.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.example.demo.mypage.service.MypageService;

@Controller("mypageController")
public class MypageControllerImpl implements MypageController {

	@Autowired
	private MypageService mypageService;
}
