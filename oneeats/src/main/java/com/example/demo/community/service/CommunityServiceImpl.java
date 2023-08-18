package com.example.demo.community.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.community.dao.CommunityDAO;
import com.example.demo.vo.RecipeVO;

@Service("communityService")
public class CommunityServiceImpl implements CommunityService {
	@Autowired
	private CommunityDAO communityDAO;

	@Override
	public List<RecipeVO> selectRecipeList(Map pagingMap) {
		return communityDAO.selectRecipeList(pagingMap); 
	}
	@Override
	public List<RecipeVO> selectNewRecipeList(){
		return communityDAO.selectNewRecipeList();
	}
	@Override
	public RecipeVO selectRecipeByRecipeNo(int recipeNo) {
		return communityDAO.selectRecipeByRecipeNo(recipeNo);
	}
	@Override
	public List<Map> selectingredientByRecipeNo(int recipeNo) {
		return communityDAO.selectIngredientByRecipeNo(recipeNo);
	}

	

}
