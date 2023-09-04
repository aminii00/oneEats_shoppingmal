package com.example.demo.admin.hotdeal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.example.demo.admin.hotdeal.service.AdminHotDealService;

@Controller
public class AdminHotDealControllerImpl implements AdminHotDealController {
	@Autowired
	private AdminHotDealService adminHotDealService;
}
