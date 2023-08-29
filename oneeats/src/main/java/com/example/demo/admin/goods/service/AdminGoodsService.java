package com.example.demo.admin.goods.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.OptionVO;

public interface AdminGoodsService {
	// 상품 추가
	public boolean addGoods(GoodsVO goodsVO, List<OptionVO> OptionList);

	public int selectNewGoodsNo();

	public boolean addGoods(Map map);

	public boolean optionaddGoods(OptionVO optionVO);

	// 상품 리스트
	public List<GoodsVO> selectGoodsList();

	// 상품 목록 페이징
	public List<GoodsVO> selectNewGoodsList(Map pagingMap);

	// 상품 삭제
	public int deleteAdminGoods(int goodsNo) throws DataAccessException;

	public GoodsVO selectGoodsByGoodsNo(int goodsNo);

	public List<Map> selectOptionsBygoodsNo(int goodsNo);

	// 관리자 상품 리스트
	public List<GoodsVO> selectSellerGoodsList();

	// 관리자 상품 목록 페이징
	public List<GoodsVO> selectNewSellerGoodsList(Map pagingMap);
}
