package com.example.demo.goods.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.example.demo.goods.dao.GoodsDAO;
import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.OptionVO;

@Service("goodsService")
public class GoodsServiceImpl implements GoodsService{
	
	@Autowired
	private GoodsDAO goodsDAO;


	@Override
	public List<GoodsVO> selectAllGoodsList() {
		return goodsDAO.selectAllGoodsList();
		 
	}


	@Override
	public GoodsVO selectNumGoodsList() {
		return goodsDAO.selectNumGoodsList();
	}


	@Override
	public List<GoodsVO> goodsDetail(int goodsNo) {
		return goodsDAO.goodsDetail(goodsNo);
	}


	@Override
	public GoodsVO selectGoodsByGoodsNo(int goodsNo) {
		return goodsDAO.selectGoodsByGoodsNo(goodsNo);
	}


	@Override
	public int selectTotalReviewsNum(int goodsNo) {
		
		return goodsDAO.selectTotalReviewsNum(goodsNo);
	}


	@Override
	public float selectReviewAverage(int goodsNo) {
		return goodsDAO.selectReviewAverage(goodsNo);
	}


	@Override
	public List<OptionVO> selectOptionsByGoodsNo(int goodsNo) {
		return goodsDAO.selectOptionsByGoodsNo(goodsNo);
	}


	




}