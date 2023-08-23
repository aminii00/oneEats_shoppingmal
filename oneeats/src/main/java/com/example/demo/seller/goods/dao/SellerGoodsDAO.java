package com.example.demo.seller.goods.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import org.springframework.stereotype.Repository;

import com.example.demo.vo.GoodsVO;

import com.example.demo.vo.OptionVO;




@Mapper
@Repository("sellerGoodsDAO")
public interface SellerGoodsDAO {

	//public int insertGoods(Map map) throws DataAccessException;
	//public int insertOption(Map map) throws DataAccessException;
	public void insertNewGoods(GoodsVO goodsVO);
	public int selectNewGoodsNo();
	public boolean insertOptions(OptionVO optionVO);
	public void insertNewGoodsWithMap(Map map);
}
