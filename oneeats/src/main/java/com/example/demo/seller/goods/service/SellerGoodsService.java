package com.example.demo.seller.goods.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.OptionVO;


public interface SellerGoodsService {

//상품 추가	
	public boolean addGoods(GoodsVO goodsVO, List<OptionVO> OptionList);

	public int selectNewGoodsNo();
	
	public GoodsVO selectGoodsVO(int goodsNo);
	
	public List<OptionVO> selectOptionVO(int goodsNo);

	public boolean optionaddGoods(OptionVO optionVO);

	public boolean optionModGoods(OptionVO optionVO);
	
	public boolean addGoods(Map map);

//상품 리스트	
	public List<GoodsVO> selectGoodsList(Map pagingMap);

	
	
//카테고리 
	public List<Map> countGoodsNums();
	
	
	
	

//상품 목록 페이징	
	public List<GoodsVO> selectNewGoodsList();
	
// 상품 삭제
	public int deleteSellerGoods(int goodsNo) throws DataAccessException;

//상품 수정
	public void ModGoods(GoodsVO goodsvo) throws DataAccessException;

	public void DeleteGoods(GoodsVO goodsvo);

	public GoodsVO goodsItem(int goodsvo);


//북샵 따라해보기	
	//public void modifyGoodsInfo(Map goodsMap) throws Exception;
	
}
