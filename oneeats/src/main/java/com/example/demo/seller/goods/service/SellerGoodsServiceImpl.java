package com.example.demo.seller.goods.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.example.demo.seller.goods.dao.SellerGoodsDAO;
import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.OptionVO;
import com.example.demo.vo.OrderVO;

@Service("sellerGoodsService")
public class SellerGoodsServiceImpl implements SellerGoodsService {
	@Autowired
	private SellerGoodsDAO sellerGoodsDAO;

//	@Override
//	public int addGoods(Map map) throws DataAccessException {
//		return sellerGoodsDAO.insertGoods(map);
//	}
//
//	@Override
//	public int addOption(Map map) throws DataAccessException {
//		return sellerGoodsDAO.insertOption(map);
	// }

	/*
	 * @Override public boolean addGoods(GoodsVO goodsVO, List<OptionVO> optionList)
	 * { boolean result = true; try { sellerGoodsDAO.insertNewGoods(goodsVO);
	 * sellerGoodsDAO.insertOptions(optionList); } catch (Exception e) { result =
	 * false; } return result; }
	 */

	@Override
	public boolean addGoods(Map map) {
		boolean result1 = true;
		try {
			sellerGoodsDAO.insertNewGoodsWithMap(map);

		} catch (Exception e) {
			e.printStackTrace();
			result1 = false;
		}
		return result1;
	}

	public boolean optionaddGoods(OptionVO optionVO) {
		boolean result = sellerGoodsDAO.insertOptions(optionVO);
		return result;
	}
	
	public boolean optionModGoods(OptionVO optionVO) {
		boolean result = sellerGoodsDAO.updateOptions(optionVO);
		return result;
	}
	@Override
	public GoodsVO selectGoodsVO(int goodsNo) {
		GoodsVO goodsVO = sellerGoodsDAO.selectGoodsVO(goodsNo);
		return goodsVO;
	}
	
	@Override
	public List<OptionVO> selectOptionVO(int goodsNo) {
		List<OptionVO> optionVO = sellerGoodsDAO.selectOptionVO(goodsNo);
		return optionVO;
	}

	@Override
	public int selectNewGoodsNo() {
		return sellerGoodsDAO.selectNewGoodsNo();
	}

	@Override
	public boolean addGoods(GoodsVO goodsVO, List<OptionVO> OptionList) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean ModGoods(int goodsNo) {
		boolean result1;
		try {
			result1 = sellerGoodsDAO.updateNewGoodsWithMap(goodsNo);

		} catch (Exception e) {
			e.printStackTrace();
			result1 = false;
		}
		return result1;
	}
	
//상품 목록
	@Override
	public List<GoodsVO> selectGoodsList() throws DataAccessException {
		return sellerGoodsDAO.selectGoodsList();
	}

	@Override
	public int deleteSellerGoods(int goodsNo) throws DataAccessException {
		// TODO Auto-generated method stub
		return 0;
	}

}
