package com.example.demo.seller.goods.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface SellerGoodsController {
	public ResponseEntity addGoods(MultipartHttpServletRequest multipartRequest,HttpServletResponse response) throws Exception;
}
