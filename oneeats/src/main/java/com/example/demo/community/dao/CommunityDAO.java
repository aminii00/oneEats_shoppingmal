package com.example.demo.community.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.example.demo.vo.IngredientVO;
import com.example.demo.vo.NoticeVO;
import com.example.demo.vo.RecipeVO;

@Mapper
@Repository("communityDAO")
public interface CommunityDAO {

	public List<RecipeVO> selectRecipeList(Map pagingMap);
	
	public List<RecipeVO> selectNewRecipeList();
	
	public RecipeVO selectRecipeByRecipeNo(int recipeNo);

	public List<Map> selectIngredientByRecipeNo(int recipeNo);

	public int selectNewRecipeNo();

	public void insertNewRecipe(RecipeVO recipeVO);

	public void insertIngredients(List<IngredientVO> ingredientList);

	public void insertNewRecipeWithMap(Map map);

	public void insertIngredientsWithMap(Map condMap);

	public void updateRecipe(Map map);

	public void deleteIngredientsByRecipeNo(int recipeNo);

	public void deleteRecipe(int recipeNo);

	public List<RecipeVO> selectNewRecipeListExceptCurrentRecipe(int recipeNo);

	public List<Map> countRecipeNums(); 
	
	public List<NoticeVO> noticeList();
	
	public NoticeVO noticeDetail(int noticeNo);
	
}
