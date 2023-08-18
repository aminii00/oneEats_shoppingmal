package com.example.demo.admin.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.example.demo.admin.community.service.AdminCommunityService;

@Controller("adminCommunityController")
public class AdminCommunityControllerImpl implements AdminCommunityController {
	@Autowired
	private AdminCommunityService adminCommunityService;

	
	
	
	public static void main(String[] args) {
		
	}
}
