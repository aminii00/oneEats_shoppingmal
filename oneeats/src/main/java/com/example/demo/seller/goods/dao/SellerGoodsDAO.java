package com.example.demo.seller.goods.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("sellerGoodsDAO")
public interface SellerGoodsDAO {

	public int insertGoods(Map map) throws DataAccessException;

}
