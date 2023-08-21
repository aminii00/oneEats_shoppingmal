package com.example.demo.community.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.community.service.CommunityService;
import com.example.demo.vo.IngredientVO;
import com.example.demo.vo.RecipeVO;

@Controller("communityController")
@RequestMapping("/community")
public class CommunityControllerImpl implements CommunityController {
	@Autowired
	private CommunityService communityService;
	
	@RequestMapping(value = "/recipe/recipeList.do")
	public ModelAndView recipeList(HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("utf-8");
		String viewName = (String) request.getAttribute("viewName");
		
		ModelAndView mav = new ModelAndView(viewName);
		String category = request.getParameter("category");
		String section = request.getParameter("section");
		String pageNum = request.getParameter("pageNum");
		Map pagingMap = new HashMap();
		pagingMap.put("category", category);
		pagingMap.put("section", section);
		pagingMap.put("pageNum", pageNum);
		
		
		List<RecipeVO> recipeList = communityService.selectRecipeList(pagingMap);
		List<RecipeVO> newRecipeList = communityService.selectNewRecipeList();
		mav.addObject("recipeList",recipeList);
		mav.addObject("newRecipeList",newRecipeList);
		mav.addAllObjects(pagingMap);
		
		System.out.println(mav);
		
		return mav;
	}

	
	@RequestMapping(value = "/recipe/recipeDetail.do")
	public ModelAndView recipeList(@RequestParam("recipeNo") int recipeNo,HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("utf-8");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		List<RecipeVO> newRecipeList = communityService.selectNewRecipeList();
		mav.addObject("newRecipeList",newRecipeList);
		RecipeVO recipeVO = communityService.selectRecipeByRecipeNo(recipeNo);
		mav.addObject("recipe",recipeVO);
		List<Map> ingredientList = communityService.selectingredientByRecipeNo(recipeNo);
		
		mav.addObject("ingredientList",ingredientList);
		
		System.out.println(mav);
		
		return mav;
	}

	@RequestMapping(value="/recipe/recipeModForm.do")
	public ModelAndView recipeForm(@RequestParam("recipeNo") int recipeNo, HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("utf-8");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		RecipeVO recipeVO = communityService.selectRecipeByRecipeNo(recipeNo);
		mav.addObject("recipe",recipeVO);
		
		List<Map> ingredientList = communityService.selectingredientByRecipeNo(recipeNo);
		mav.addObject("ingredientList",ingredientList);
		
		System.out.println(mav);
		
		return mav;
		
	}
	
	
	@RequestMapping(value = "/recipe/addRecipe.do", method = RequestMethod.POST )
	public ModelAndView addRecipe(@ModelAttribute("recipeVO") RecipeVO recipeVO,HttpServletRequest request ) throws IOException {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView();
		String[] ingredientNames = request.getParameterValues("name");
		String[] ingredientQtys = request.getParameterValues("qty");
		List<IngredientVO> ingredientList = new ArrayList<IngredientVO>();
		for (int i = 0; i < ingredientQtys.length; i++) {
			IngredientVO ingredientVO = new IngredientVO(ingredientNames[i],ingredientQtys[i]);
			ingredientList.add(ingredientVO);
		}
		
		
		boolean result = communityService.addRecipe(recipeVO,ingredientList);
		
		
		
		return mav;
	}
	

}
