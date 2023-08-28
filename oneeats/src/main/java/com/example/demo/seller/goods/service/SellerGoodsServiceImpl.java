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
import com.example.demo.vo.RecipeVO;

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


	
//상품 목록
	@Override
	public List<GoodsVO> selectGoodsList() throws DataAccessException {
		return sellerGoodsDAO.selectGoodsList();
	}

	
//상품 페이징 처리
	
	@Override
	public List<GoodsVO> selectNewGoodsList(Map pagingMap) {
		return sellerGoodsDAO.selectNewGoodsList(pagingMap); 
	}
	
//상품 삭제
	@Override
	public int deleteSellerGoods(int goodsNo) throws DataAccessException {
		return sellerGoodsDAO.deleteSellerGoods(goodsNo);
	}

	@Override
	public void DeleteGoods(GoodsVO goodsvo) {
		sellerGoodsDAO.DeleteGoods(goodsvo);
		
	}

	@Override
	public GoodsVO goodsItem(int goodsNo) {
	GoodsVO goodsItem =	sellerGoodsDAO.goodsItem(goodsNo);
	return goodsItem;
	}

	
	@Override
	public void ModGoods(GoodsVO goodsvo) {
		sellerGoodsDAO.updateNewGoodsWithMap(goodsvo);
		
	}
	//북샵 따라해보기
	//@Override
	//public void modifyGoodsInfo(Map goodsMap) throws Exception{
		//sellerGoodsDAO.updateGoodsInfo(goodsMap);
		
	//}	
	
}
