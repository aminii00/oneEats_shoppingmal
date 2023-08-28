package com.example.demo.admin.goods.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.OptionVO;


@Mapper
@Repository("adminGoodsDAO")
public interface AdminGoodsDAO {

	public void insertNewGoods(GoodsVO goodsVO);

	public int selectNewGoodsNo();

	public boolean insertOptions(OptionVO optionVO);

	public void insertNewGoodsWithMap(Map map);

	// 주문 목록
	public List<GoodsVO> selectGoodsList() throws DataAccessException;

	// 페이징 처리
	public List<GoodsVO> selectNewGoodsList(Map pagingMap);

	// 주문 삭제
		public int deleteAdminGoods(int goodsNo) throws DataAccessException;
		
	//수정
		public GoodsVO selectGoodsByGoodsNo(int goodsNo);
		public List<Map> selectOptionsBygoodsNo(int goodsNo);
}
