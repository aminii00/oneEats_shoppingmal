package com.example.demo.seller.goods.service;

import java.util.Map;

import org.springframework.dao.DataAccessException;

public interface SellerGoodsService {

		public int addGoods(Map map) throws DataAccessException;

		public int addOption(Map map) throws DataAccessException;

}
