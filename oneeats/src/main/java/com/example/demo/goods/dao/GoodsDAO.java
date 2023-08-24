package com.example.demo.goods.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.example.demo.vo.BookmarkVO;
import com.example.demo.vo.CartVO;
import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.HotDealVO;
import com.example.demo.vo.OptionVO;

@Mapper
@Repository("goodsDAO")
public interface GoodsDAO {


	public List<GoodsVO> selectAllGoodsList();

	public GoodsVO selectNumGoodsList();
	
	public List<GoodsVO>  goodsDetail(int goodsNo);

	public GoodsVO selectGoodsByGoodsNo(int goodsNo);

	public int selectTotalReviewsNum(int goodsNo);

	public float selectReviewAverage(int goodsNo);

	public List<CartVO> selectOptionsByGoodsNo(int goodsNo);
	
	public List<HotDealVO> selectNewHotDealList();

	public int selectTotalGoodsNumForAll();

	public void insertNewBookmark(BookmarkVO bookmarkVO);

	public int isExistBookmark(BookmarkVO bookmarkVO);
}
	


	

