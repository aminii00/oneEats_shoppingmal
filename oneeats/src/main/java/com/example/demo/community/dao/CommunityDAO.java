package com.example.demo.community.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.example.demo.vo.RecipeVO;

@Mapper
@Repository("communityDAO")
public interface CommunityDAO {

	public List<RecipeVO> selectRecipeList(Map pagingMap);
	
	public List<RecipeVO> selectNewRecipeList();
	
	public RecipeVO selectRecipeByRecipeNo(int recipeNo);

	public List<Map> selectIngredientByRecipeNo(int recipeNo); 
	
}
