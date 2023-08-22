package com.example.demo.goods.service;

import java.util.List;

import com.example.demo.vo.CartVO;
import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.OptionVO;

public interface GoodsService {

	public List<GoodsVO> selectAllGoodsList();

	public GoodsVO selectNumGoodsList();

	public List<GoodsVO> goodsDetail(int goodsNo);

	public GoodsVO selectGoodsByGoodsNo(int goodsNo);

	public int selectTotalReviewsNum(int goodsNo);

	public float selectReviewAverage(int goodsNo);

	public List<CartVO> selectOptionsByGoodsNo(int goodsNo);
	

}
