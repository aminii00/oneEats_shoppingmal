package com.example.demo.community.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.community.dao.CommunityDAO;
import com.example.demo.vo.IngredientVO;
import com.example.demo.vo.MostQnAVO;
import com.example.demo.vo.NoticeVO;
import com.example.demo.vo.OneQnAVO;
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
	@Override
	public boolean addRecipe(RecipeVO recipeVO, List<IngredientVO> ingredientList) {
		boolean result = true;
		try {
			communityDAO.insertNewRecipe(recipeVO);
			communityDAO.insertIngredients(ingredientList);
		} catch (Exception e) {
			result = false;
		}
		return result;
	}
	
	
	@Override
	public boolean addRecipe(Map map, List<IngredientVO> ingredientList) {
		boolean result = true;
		try {
			communityDAO.insertNewRecipeWithMap(map);
			communityDAO.insertIngredients(ingredientList);
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
		return result;
	}
	@Override
	public int selectNewRecipeNo() {
		return communityDAO.selectNewRecipeNo();
	}
	@Override
	public boolean modRecipe(Map map, List<IngredientVO> ingredientList,String recipeNo) {
		boolean result = true;
		try {
			communityDAO.updateRecipe(map);
			communityDAO.deleteIngredientsByRecipeNo(Integer.parseInt(recipeNo));
			communityDAO.insertIngredients(ingredientList);

		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
		return result;
	}
	@Override
	public void deleteRecipe(int recipeNo) {
		communityDAO.deleteRecipe(recipeNo);
	}
	@Override
	public List<RecipeVO> selectNewRecipeList(int recipeNo) {
		return communityDAO.selectNewRecipeListExceptCurrentRecipe(recipeNo);
	}
	@Override
	public List<Map> countRecipeNums() {
		return communityDAO.countRecipeNums();
	};
	
	@Override
	public List<NoticeVO> noticeList(){
		List<NoticeVO> noticeList = communityDAO.noticeList();
		return noticeList;
	}
	@Override
	public NoticeVO noticeDetail(int noticeNo) {
		NoticeVO noticeVO = communityDAO.noticeDetail(noticeNo);
		return noticeVO;
	}
	
	@Override
	public List<OneQnAVO> oneQnAList(){
		List<OneQnAVO> oneQnAList = communityDAO.oneQnAList();
		return oneQnAList;
	}
	
	@Override
	public OneQnAVO oneQnADetail(int qnaNo){
		OneQnAVO oneQnaVO = communityDAO.oneQnADetail(qnaNo);
		return oneQnaVO;
	}
	@Override
	public List<MostQnAVO> selectMostQnAListWithPagingMap(Map pagingMap) {
		
		return communityDAO.selectMostQnAListWithPagingMap(pagingMap);
	}
	@Override
	public int selectMostQnAListTotalNumWithCategory(String category) {
		return communityDAO.selectMostQnAListTotalNumWithCategory(category);
	}
	
	

}
