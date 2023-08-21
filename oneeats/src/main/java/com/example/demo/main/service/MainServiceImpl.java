package com.example.demo.main.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.main.dao.MainDAO;
import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.RecipeVO;

@Service("mainService")
public class MainServiceImpl implements MainService{
	
	@Autowired
	private MainDAO mainDAO;

	@Override
	public Map<String, List<GoodsVO>> listGoods() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<GoodsVO> selectAllGoodsList() {
		return mainDAO.selectAllGoodsList();
	}

	@Override
	public List<GoodsVO> orderByNew() {
		return mainDAO.orderByNew();
	}

	@Override
	public List<RecipeVO> selectAllRecipesList() {
		return mainDAO.selectAllRecipesList();
	}

	
	
}
