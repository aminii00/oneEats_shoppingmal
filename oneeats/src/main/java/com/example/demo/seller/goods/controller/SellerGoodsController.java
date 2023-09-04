package com.example.demo.seller.goods.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface SellerGoodsController {
	public ModelAndView deleteSellerGoods(@RequestParam("goodsNo") int goodsNo, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView addGoods(MultipartHttpServletRequest request) throws IOException;

	public ModelAndView modSellerGoodsForm(HttpServletRequest request, HttpServletResponse response) throws IOException;

	
	//잠시 주석
//	public ModelAndView modSellerGoods(HttpServletRequest request, HttpServletResponse response) throws IOException;
	

	
	/*
	public ResponseEntity modifyGoodsInfo( @RequestParam("goodsNo") String goodsNo,
            @RequestParam("mod_type") String mod_type,
            @RequestParam("value") String value,
            HttpServletRequest request, HttpServletResponse response)  throws Exception;
	*/
	}
