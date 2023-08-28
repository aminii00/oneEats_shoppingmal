package com.example.demo.admin.goods.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.example.demo.admin.goods.dao.AdminGoodsDAO;
import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.OptionVO;


@Service("adminGoodsService")
public class AdminGoodsServiceImpl implements AdminGoodsService {
	@Autowired
	private AdminGoodsDAO adminGoodsDAO;

	@Override
	public boolean addGoods(Map map) {
		boolean result1 = true;
		try {
			adminGoodsDAO.insertNewGoodsWithMap(map);

		} catch (Exception e) {
			e.printStackTrace();
			result1 = false;
		}
		return result1;
	}

	public boolean optionaddGoods(OptionVO optionVO) {
		boolean result = adminGoodsDAO.insertOptions(optionVO);
		return result;
	}

	@Override
	public int selectNewGoodsNo() {
		return adminGoodsDAO.selectNewGoodsNo();
	}

	@Override
	public boolean addGoods(GoodsVO goodsVO, List<OptionVO> OptionList) {
		// TODO Auto-generated method stub
		return false;
	}

	// 상품 페이징 처리

	@Override
	public List<GoodsVO> selectNewGoodsList(Map pagingMap) {
		return adminGoodsDAO.selectNewGoodsList(pagingMap);
	}

	// 상품 목록
	@Override
	public List<GoodsVO> selectGoodsList() throws DataAccessException {
		return adminGoodsDAO.selectGoodsList();
	}
	
	//상품 삭제
		@Override
		public int deleteAdminGoods(int goodsNo) throws DataAccessException {
			return adminGoodsDAO.deleteAdminGoods(goodsNo);
		}

		
	//상품 수정
		@Override
		public List<Map> selectOptionsBygoodsNo(int goodsNo) {
			return adminGoodsDAO.selectOptionsBygoodsNo(goodsNo);
		}

		
		@Override
		public GoodsVO selectGoodsByGoodsNo(int goodsNo) {
			return adminGoodsDAO.selectGoodsByGoodsNo(goodsNo);
		}
		
}
