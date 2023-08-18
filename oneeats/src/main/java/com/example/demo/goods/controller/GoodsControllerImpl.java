package com.example.demo.goods.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.example.demo.goods.service.GoodsService;

@Controller("goodsController")
public class GoodsControllerImpl implements GoodsController {
	@Autowired
	private GoodsService goodsService;
}
