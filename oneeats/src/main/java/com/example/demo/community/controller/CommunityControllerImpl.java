package com.example.demo.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.example.demo.community.service.CommunityService;

@Controller("communityController")
public class CommunityControllerImpl implements CommunityController {
	@Autowired
	private CommunityService communityService;
}
