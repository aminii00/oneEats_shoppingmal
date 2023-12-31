package com.example.demo.seller.hotdeal.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.HotDealVO;

@Mapper
@Repository("sellerHotDealDAO")
public interface SellerHotDealDAO {

	public GoodsVO selectGoodsVO(int goodsNo);

	public int selectNewHotDealNo();

	public void insertHotDeal(HotDealVO hotDealVO) throws DataAccessException;

	public HotDealVO selectHotDealByHotDealNo(int hotdealNo);

	public List<GoodsVO> selectGoodsList(Map map) throws DataAccessException;;

	public GoodsVO SearchGoods(int goodsNo);

	// 카테고리
	public List<Map> countHotDealNums();

	// 페이징 처리
	public List<HotDealVO> selectNewHotDealList();

	// 핫딜 목록
	public List<HotDealVO> selectHotDealListForList(Map pagingMap) throws DataAccessException;
	
	//핫딜 삭제
	public int deleteHotdealGoods(int hotdealNo) throws DataAccessException;

	//수정
	public GoodsVO selectGoodsByGoodsNo(int goodsNo);
	public HotDealVO selectHotDealByGoodsNo(int hotdealNo);

	public void updateSellerHotDeal(HotDealVO sellerHotDeal);

	public List<HotDealVO> selectSellerHotDealList(Map pagingMap);

	public int selectTotalHotDealNum();
}
