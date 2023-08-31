package com.example.demo.community.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import com.example.demo.common.alert.Alert;
import com.example.demo.common.file.GeneralFileUploader;
import com.example.demo.community.service.CommunityService;
import com.example.demo.vo.IngredientVO;
import com.example.demo.vo.MemberVO;
import com.example.demo.vo.MostQnAVO;
import com.example.demo.vo.NoticeVO;
import com.example.demo.vo.OneQnAVO;
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
		String recipe_search_type = request.getParameter("recipe_search_type");
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
		if (recipe_search_type != null && recipe_search_type.length() < 1) {
			recipe_search_type = "all";
		}
		Map pagingMap = GeneralFileUploader.getParameterMap(request);
		pagingMap.put("category", category);
		pagingMap.put("section", section);
		pagingMap.put("pageNum", pageNum);
		pagingMap.put("recipe_search_type", recipe_search_type);
		pagingMap.put("start", ((section - 1) * 10 + pageNum - 1) * 6);
		System.out.println("section=" + section);
		System.out.println("pageNum=" + pageNum);

		List<RecipeVO> recipeList = communityService.selectRecipeList(pagingMap);
		List<RecipeVO> newRecipeList = communityService.selectNewRecipeList();
		mav.addObject("recipeList", recipeList);
		mav.addObject("newRecipeList", newRecipeList);
		mav.addAllObjects(pagingMap);
		System.out.println("recipList=" + recipeList);
		System.out.println("newRecipeList=" + newRecipeList);

		List<Map> resultMap = communityService.countRecipeNums();
		// 등록된 레시피가 몇 개인지
		long totalRecipeNum = (long) resultMap.get(0).get("cnt");
		// 현재 보고 있는 카테고리의 레시피가 몇 개인지
		long searchRecipeNum = -1;
		// Output the result
		for (Map<String, Object> row : resultMap) {
			String cate = (String) row.get("category");
			long count = (long) row.get("cnt");
			System.out.println("Category: " + cate + ", Count: " + count);
			if (cate.equals(category)) {
				searchRecipeNum = count;
			}
		}

		if (searchRecipeNum < 0) {
			searchRecipeNum = totalRecipeNum;
		}

		mav.addObject("recipeNumMap", resultMap);
		mav.addObject("totalRecipeNum", totalRecipeNum);
		mav.addObject("searchRecipeNum", searchRecipeNum);
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

	// 민아 공지사항리스트
	@Override
	@RequestMapping(value = "/notice/noticeList.do")
	public ModelAndView noticeList(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("여기는 community noticeList Controller");
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		System.out.println("viewName = " + viewName);
		List<NoticeVO> noticeList = communityService.noticeList();
		System.out.println("noticeList = " + noticeList);
		mav.addObject("noticeList", noticeList);
		mav.setViewName(viewName);
		return mav;

	}

	// 공지사항 디테일
	@Override
	@RequestMapping(value = "/notice/noticeDetail.do")
	public ModelAndView noticeDetail(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		String noticeNo1 = request.getParameter("noticeNo");
		int noticeNo = Integer.parseInt(noticeNo1);
		int noticeNoBefore = noticeNo - 1; // 이전
		int noticeNoAfter = noticeNo + 1; // 다음
		NoticeVO noticeVO = communityService.noticeDetail(noticeNo);
		NoticeVO noticeVOBefore = communityService.noticeDetail(noticeNoBefore);
		NoticeVO noticeVOAfter = communityService.noticeDetail(noticeNoAfter);

		System.out.println("noticeVO = " + noticeVO);
		System.out.println("noticeBefore = " + noticeVOBefore);
		System.out.println("noticeVOAfter = " + noticeVOAfter);
		mav.addObject("notice", noticeVO);
		mav.addObject("noticeBefore", noticeVOBefore);
		mav.addObject("noticeAfter", noticeVOAfter);
		mav.setViewName(viewName);
		return mav;

	}

	// 민아 1:1 문의
	@Override
	@RequestMapping(value = "/oneQnA/oneQnAList.do")
	public ModelAndView oneQnA(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		List<OneQnAVO> oneQnAList = communityService.oneQnAList();
		System.out.println("oneQnAList 1:1문의 = " + oneQnAList);
		String viewName = (String) request.getAttribute("viewName");
		mav.addObject("oneQnAList", oneQnAList);
		mav.setViewName(viewName);
		return mav;
	}

	// 민아 1:1 문의 detail
	@Override
	@RequestMapping(value = "/oneQnA/oneQnADetail.do")
	public ModelAndView oneQnADetail(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		String qnaNo_ = request.getParameter("qnaNo");
		int qnaNo = Integer.parseInt(qnaNo_);
		OneQnAVO oneQnADetail = communityService.oneQnADetail(qnaNo);
		mav.addObject("oneQnAList", oneQnADetail);
		mav.setViewName(viewName);
		return mav;
	}

	private ModelAndView redirectAlertMessage(String msg, String page) {
		ModelAndView mav = new ModelAndView("/alert");
		mav.addObject("redirectMessage", msg);
		mav.addObject("redirectPage", page);
		return mav;
	}

	@Override
	@RequestMapping(value="/mostQnA/mostQnAList.do")
	public ModelAndView mostQnAList(HttpServletRequest request) throws IOException {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		request.setCharacterEncoding("utf-8");
		Map pagingMap = GeneralFileUploader.getParameterMap(request);
		String pageNum = (String) pagingMap.get("pageNum");
		String section = (String) pagingMap.get("section");
		String category = (String) pagingMap.get("category");
		if (pageNum == null || pageNum.trim().length() < 1) {
			pageNum = "1";
			pagingMap.put("pageNum", pageNum);
		}
		if (section == null || section.trim().length() < 1) {
			section = "1";
			pagingMap.put("section", section);
		}
		if (category == null || category.trim().length() < 1) {
			category = "all";
			pagingMap.put("category", category);
		}
		try {
			int start = ((Integer.parseInt(section)-1)+Integer.parseInt(pageNum)-1)*10;
			pagingMap.put("start", start);
			List<MostQnAVO> mostQnAList = communityService.selectMostQnAListWithPagingMap(pagingMap);
			mav.addAllObjects(pagingMap);
			mav.addObject("mostQnAList", mostQnAList);
			int totalMostQnANum = communityService.selectMostQnAListTotalNumWithCategory(category);
			mav.addObject("totalMostQnANum",totalMostQnANum);
			
			System.out.println(mav);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;

	}

}
