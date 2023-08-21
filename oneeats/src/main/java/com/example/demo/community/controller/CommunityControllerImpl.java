package com.example.demo.community.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.common.file.GeneralFileUploader;
import com.example.demo.community.service.CommunityService;
import com.example.demo.vo.IngredientVO;
import com.example.demo.vo.MemberVO;
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
	public ModelAndView addRecipe(MultipartHttpServletRequest request) throws IOException {
		request.setCharacterEncoding("utf-8");
		int newRecipeNo = communityService.selectNewRecipeNo();
		List fileList = GeneralFileUploader.upload(request,"/recipe/"+newRecipeNo);
		System.out.println("fileList : "+fileList);
		
		// map에 recipe 정보를 저장
		Map map = GeneralFileUploader.getParameterMap(request);
		map.put("recipeNo", newRecipeNo);
		map.put("cookingImg", fileList.get(0));
		
		
		// 세션에서 로그인한 유저 정보를 불러와 map에 저장
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("loginUser");
		if (memberVO == null) {
			map.put("memberNo", 1);
		}else {
			map.put("memberNo", memberVO.getMemberNo());
		}
		
		// 재료들 정보 가져와서 ingredientList에 저장
		String[] ingredientNames = request.getParameterValues("name");
		String[] ingredientQtys = request.getParameterValues("qty");
		List<IngredientVO> ingredientList = new ArrayList<IngredientVO>();
		for (int i = 0; i < ingredientQtys.length; i++) {
			IngredientVO ingredientVO = new IngredientVO(newRecipeNo,ingredientNames[i],ingredientQtys[i]);
			ingredientList.add(ingredientVO);
		}
		System.out.println("ingredientList : "+ingredientList);
		
		
		// addRecipe
		boolean result = communityService.addRecipe(map,ingredientList);
		
		
		ModelAndView mav = new ModelAndView();
		
		
		// 등록 성공했을 경우 해당 레시피 상세 페이지로. 실패했을 경우 폼에.
		if (result) {
			System.out.println("레시피 등록 성공");
			mav.setViewName("redirect:/community/recipe/recipeDetail.do?recipeNo="+newRecipeNo);
		}else {
			System.out.println("레시피 등록 실패");
			mav.addObject("result","fail");
			mav.setViewName("redirect:/community/recipe/recipeForm.do");
		}
		
		return mav;
	}
	

}
