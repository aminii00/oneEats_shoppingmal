package com.example.demo.admin.hotdeal.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.HotDealVO;

public interface AdminHotDealService {

	public GoodsVO selectGoodsVO(int goodsNo);

	public int selectNewHotDealNo();

	public void addHotDeal(HotDealVO hotDealVO);

	public HotDealVO selectHotDealByHotDealNo(int hotdealNo);

	public List<GoodsVO> selectGoodsList(Map map);

	public GoodsVO SearchGoods(int goodsNo);

	// 목록
	public List<HotDealVO> selectNewHotDealList();

	// 카테고리
	public List<Map> countHotDealNums();

	// 상품 리스트
	public List<HotDealVO> selectHotDealListForList(Map pagingMap);

	//상품 삭제
	public int deleteHotdealGoods(int hotdealNo) throws DataAccessException;

	//수정폼
	public GoodsVO selectGoodsByGoodsNo(int hotdealNo);
	public HotDealVO selectHotDealByGoodsNo(int hotdealNo);
	
	//수정
	public void updateAdminHotDeal(HotDealVO sellerHotDeal);
	
	
	
}
