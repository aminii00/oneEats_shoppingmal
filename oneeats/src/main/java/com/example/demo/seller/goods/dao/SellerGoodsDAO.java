package com.example.demo.seller.goods.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.example.demo.vo.GoodsVO;

import com.example.demo.vo.OptionVO;
import com.example.demo.vo.OrderVO;




@Mapper
@Repository("sellerGoodsDAO")
public interface SellerGoodsDAO {

	//public int insertGoods(Map map) throws DataAccessException;
	//public int insertOption(Map map) throws DataAccessException;
	public void insertNewGoods(GoodsVO goodsVO);
	public int selectNewGoodsNo();
	public boolean insertOptions(OptionVO optionVO);
	public boolean updateOptions(OptionVO optionVO);
	public void insertNewGoodsWithMap(Map map);
	
	public GoodsVO selectGoodsVO(int goodsNo);
	public List<OptionVO> selectOptionVO(int goodsNo);
	
	public boolean updateNewGoodsWithMap(int goodsNo);
	//주문 목록
	public List<GoodsVO> selectGoodsList() throws DataAccessException;
	
	//주문 삭제
	public int deleteSellerGoods(int goodsNo) throws DataAccessException;
}
