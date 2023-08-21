package com.example.demo.community.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
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
		String _section = request.getParameter("section");
		String _pageNum = request.getParameter("pageNum");
		int pageNum;
		int section;
		if (_pageNum == null || _pageNum.length() <= 0) {
			pageNum = 1;
		} else {
			pageNum = Integer.parseInt(_pageNum);
		}
		if (_section == null || _section.length() <= 0) {
			section = 1;
		} else {
			section = Integer.parseInt(_section);
		}

		Map pagingMap = new HashMap();
		pagingMap.put("category", category);
		pagingMap.put("section", section);
		pagingMap.put("pageNum", pageNum);
		pagingMap.put("start", ((section - 1) * 10 + pageNum - 1) * 6);

		List<RecipeVO> recipeList = communityService.selectRecipeList(pagingMap);
		List<RecipeVO> newRecipeList = communityService.selectNewRecipeList();
		mav.addObject("recipeList", recipeList);
		mav.addObject("newRecipeList", newRecipeList);
		mav.addAllObjects(pagingMap);

		System.out.println(mav);

		return mav;
	}

	@RequestMapping(value = "/recipe/recipeDetail.do")
	public ModelAndView recipeList(@RequestParam("recipeNo") int recipeNo, HttpServletRequest request)
			throws IOException {
		request.setCharacterEncoding("utf-8");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		List<RecipeVO> newRecipeList = communityService.selectNewRecipeList(recipeNo);
		mav.addObject("newRecipeList", newRecipeList);

		RecipeVO recipeVO = communityService.selectRecipeByRecipeNo(recipeNo);
		mav.addObject("recipe", recipeVO);
		List<Map> ingredientList = communityService.selectingredientByRecipeNo(recipeNo);

		mav.addObject("ingredientList", ingredientList);

		System.out.println(mav);

		return mav;
	}

	@RequestMapping(value = "/recipe/recipeModForm.do")
	public ModelAndView recipeForm(@RequestParam("recipeNo") int recipeNo, HttpServletRequest request)
			throws IOException {
		request.setCharacterEncoding("utf-8");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		RecipeVO recipeVO = communityService.selectRecipeByRecipeNo(recipeNo);
		mav.addObject("recipe", recipeVO);

		List<Map> ingredientList = communityService.selectingredientByRecipeNo(recipeNo);
		mav.addObject("ingredientList", ingredientList);

		System.out.println(mav);

		return mav;

	}

	@RequestMapping(value = "/recipe/addRecipe.do", method = RequestMethod.POST)
	public ModelAndView addRecipe(MultipartHttpServletRequest request) throws IOException {
		request.setCharacterEncoding("utf-8");
		int newRecipeNo = communityService.selectNewRecipeNo();
		List fileList = GeneralFileUploader.upload(request, "/recipe/" + newRecipeNo);
		System.out.println("fileList : " + fileList);

		// map에 recipe 정보를 저장
		Map map = GeneralFileUploader.getParameterMap(request);
		map.put("recipeNo", newRecipeNo);
		map.put("cookingImg", fileList.get(0));

		// 설명문의 줄바꿈 처리
		String description = (String) map.get("description");
		System.out.println(description);
		description.replaceAll("\\r|\\n", "<br>");
		map.put("description", description);

		// 세션에서 로그인한 유저 정보를 불러와 map에 저장
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("loginUser");
		if (memberVO == null) {
			map.put("memberNo", 1);
		} else {
			map.put("memberNo", memberVO.getMemberNo());
		}

		// 재료들 정보 가져와서 ingredientList에 저장
		String[] ingredientNames = request.getParameterValues("name");
		String[] ingredientQtys = request.getParameterValues("qty");
		List<IngredientVO> ingredientList = new ArrayList<IngredientVO>();
		for (int i = 0; i < ingredientQtys.length; i++) {
			IngredientVO ingredientVO = new IngredientVO(newRecipeNo, ingredientNames[i], ingredientQtys[i]);
			ingredientList.add(ingredientVO);
		}
		System.out.println("ingredientList : " + ingredientList);

		// addRecipe
		boolean result = communityService.addRecipe(map, ingredientList);

		ModelAndView mav = new ModelAndView();

		// 등록 성공했을 경우 해당 레시피 상세 페이지로. 실패했을 경우 폼에.
		if (result) {
			System.out.println("레시피 등록 성공");
			mav.addObject("redirectMessage", "레시피를 등록했습니다.");
			mav.addObject("redirectPage",
					request.getContextPath() + "/community/recipe/recipeDetail.do?recipeNo=" + newRecipeNo);
			mav.setViewName("/alert");
		} else {
			System.out.println("레시피 등록 실패");
			mav.addObject("redirectMessage", "레시피 등록에 실패했습니다.");
			mav.addObject("redirectPage", request.getContextPath() + "/community/recipe/recipeList.do");
			mav.setViewName("/alert");
		}

		return mav;
	}

	@RequestMapping(value = "/recipe/modRecipe.do", method = RequestMethod.POST)
	public ModelAndView modRecipe(MultipartHttpServletRequest request) throws Exception {
		Map map = GeneralFileUploader.getParameterMap(request);
		String recipeNo = (String) map.get("recipeNo");
		String originalFileName = (String) map.get("originalFileName");
		map.put("cookingImg", originalFileName);
		System.out.println("originalFileName" + originalFileName);
		Iterator<String> files = request.getFileNames();
		if (files.hasNext()) {
			String fileName = (String) files.next();
			fileName.strip();
			MultipartFile mFile = request.getFile(fileName);
			String cookingImg = mFile.getOriginalFilename();
			cookingImg = cookingImg.strip();
			System.out.println(cookingImg);
			if (cookingImg != null && cookingImg.length() > 0) {
				GeneralFileUploader.upload(request, "/recipe/" + recipeNo);
				GeneralFileUploader.removeFile(originalFileName, "/recipe/" + recipeNo);
				map.put("cookingImg", cookingImg);
			}
			
		}

		String[] ingredientNames = request.getParameterValues("name");
		String[] ingredientQtys = request.getParameterValues("qty");
		List<IngredientVO> ingredientList = new ArrayList<IngredientVO>();
		for (int i = 0; i < ingredientQtys.length; i++) {
			IngredientVO ingredientVO = new IngredientVO(Integer.parseInt(recipeNo), ingredientNames[i],
					ingredientQtys[i]);
			ingredientList.add(ingredientVO);
		}
		System.out.println("ingredientList : " + ingredientList);

		boolean result = communityService.modRecipe(map, ingredientList, recipeNo);

		ModelAndView mav = new ModelAndView();

		if (result) {
			mav = redirectAlertMessage("레시피를 수정했습니다.",
					request.getContextPath() + "/community/recipe/recipeDetail.do?recipeNo=" + recipeNo);

		} else {
			mav = redirectAlertMessage("오류가 발생해 레시피를 수정하지 못했습니다.",
					request.getContextPath() + "/community/recipe/recipeDetail.do?recipeNo=" + recipeNo);
		}

		return mav;
	}

	@RequestMapping(value = "/recipe/deleteRecipe.do")
	public ModelAndView deleteRecipe(@ModelAttribute("member") MemberVO member, @RequestParam("recipeNo") int recipeNo,
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		try {
			RecipeVO recipeVO = communityService.selectRecipeByRecipeNo(recipeNo);
			communityService.deleteRecipe(recipeNo);
			GeneralFileUploader.removeFile(recipeVO.getCookingImg(), "/recipe/" + recipeNo);
			mav = redirectAlertMessage("레시피를 삭제했습니다", request.getContextPath() + "/community/recipe/recipeList.do");
		} catch (Exception e) {
			e.printStackTrace();
			mav = redirectAlertMessage("오류가 발생해 레시피를 삭제하지 못했습니다.",
					request.getContextPath() + "/community/recipe/recipeDetail.do?recipeNo=" + recipeNo);
		}

		return mav;

	}

	private ModelAndView redirectAlertMessage(String msg, String page) {
		ModelAndView mav = new ModelAndView("/alert");
		mav.addObject("redirectMessage", msg);
		mav.addObject("redirectPage", page);
		return mav;
	}
}
