package com.example.demo.seller.goods.service;

import java.util.Map;

import org.springframework.dao.DataAccessException;

public interface SellerGoodsService {

		public int addGoods(Map map) throws DataAccessException;

}
