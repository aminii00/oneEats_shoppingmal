
package com.example.demo.admin.goods.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.example.demo.admin.goods.service.AdminGoodsService;

@Controller("adminGoodsController")
public class AdminGoodsControllerImpl implements AdminGoodsController {

	@Autowired
	private AdminGoodsService adminGoodsService;
}
