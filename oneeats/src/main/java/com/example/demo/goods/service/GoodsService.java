package com.example.demo.goods.service;

import java.util.List;

import com.example.demo.vo.GoodsVO;

public interface GoodsService {

	public List<GoodsVO> selectAllGoodsList();

	public GoodsVO selectNumGoodsList();

	public List<GoodsVO> goodsDetail(int goodsNo);

	public GoodsVO selectGoodsByGoodsNo(int goodsNo);

	public int selectTotalReviewsNum(int goodsNo);

	public float selectReviewAverage(int goodsNo);
	

}
