package com.example.demo.goods.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.common.file.GeneralFileUploader;
import com.example.demo.common.functions.GeneralFunctions;
import com.example.demo.goods.service.GoodsService;
import com.example.demo.vo.BookmarkVO;
import com.example.demo.vo.CartVO;
import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.HotDealVO;
import com.example.demo.vo.MemberVO;
import com.example.demo.vo.ReviewVO;

@Controller("goodsController")
public class GoodsControllerImpl implements GoodsController {
	@Autowired
	private GoodsService goodsService;

	private void addGoodsInQuick(int goodsNo, GoodsVO goodsVO, HttpSession session) {
		boolean already_existed = false;
		List<GoodsVO> quickGoodsList; // 최근 본 상품 저장 ArrayList
		quickGoodsList = (ArrayList<GoodsVO>) session.getAttribute("quickGoodsList");

		if (quickGoodsList != null) {
			for (int i = 0; i < quickGoodsList.size(); i++) {
				GoodsVO _goodsBean = (GoodsVO) quickGoodsList.get(i);
				if (_goodsBean == null) {
					quickGoodsList.remove(i);
				} else if (goodsNo == _goodsBean.getGoodsNo()) {
					already_existed = true;
					break;
				}
			}
			if (already_existed == false) {
				if (quickGoodsList.size() < 6) {
					quickGoodsList.add(goodsVO);
				} else {
					quickGoodsList.remove(0);
					quickGoodsList.add(goodsVO);
				}
			}

		} else {
			quickGoodsList = new ArrayList<GoodsVO>();
			quickGoodsList.add(goodsVO);

		}
		session.setAttribute("quickGoodsList", quickGoodsList);
		session.setAttribute("quickGoodsListNum", quickGoodsList.size());
	}

	@RequestMapping(value = "/goods/*.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView goods(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);

		List<GoodsVO> goodsList = goodsService.selectAllGoodsList();
		for (GoodsVO i : goodsList) {
		}
		mav.addObject("goodsList", goodsList);

		GoodsVO item = goodsService.selectNumGoodsList();
		mav.addObject("item", item);
		return mav;
	}

	@RequestMapping(value = "/goods/goodsList.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView goodsList(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);

		Map pagingMap = GeneralFileUploader.getParameterMap(request);
		String pageNum = (String) pagingMap.get("pageNum");
		String section = (String) pagingMap.get("section");
		if (pageNum == null || pageNum.trim().length() < 1) {
			pageNum = "1";
			pagingMap.put("pageNum", pageNum);
		}
		if (section == null || section.trim().length() < 1) {
			section = "1";
			pagingMap.put("section", section);
		}

		int start = ((Integer.parseInt(section) - 1) + Integer.parseInt(pageNum) - 1) * 12;
		pagingMap.put("start", start);

		List<GoodsVO> goodsList = goodsService.selectGoodsListWithPagingMap(pagingMap);
		mav.addObject("goodsList", goodsList);

		int totalGoodsNum = goodsService.selectGoodsTotalNumWithPagingMap(pagingMap);
		mav.addObject("totalGoodsNum", totalGoodsNum);

		List<HotDealVO> newHotdealList = goodsService.selectNewHotDealList();
		mav.addObject("newHotDealList", newHotdealList);

		mav.addAllObjects(pagingMap);
		System.out.println(mav);

		int maxPrice = goodsService.selectMaxPrice(pagingMap);
		mav.addObject("maxPrice", maxPrice);

		return mav;
	}
	
	
	//핫딜 리스트
	
	@RequestMapping(value = "/goods/hotDealList.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView hotDealList(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);

		Map pagingMap = GeneralFileUploader.getParameterMap(request);
		String pageNum = (String) pagingMap.get("pageNum");
		String section = (String) pagingMap.get("section");
		if (pageNum == null || pageNum.trim().length() < 1) {
			pageNum = "1";
			pagingMap.put("pageNum", pageNum);
		}
		if (section == null || section.trim().length() < 1) {
			section = "1";
			pagingMap.put("section", section);
		}

		int start = ((Integer.parseInt(section) - 1) + Integer.parseInt(pageNum) - 1) * 12;
		pagingMap.put("start", start);

		List<HotDealVO> hotDealList = goodsService.selectHotDealListWithPagingMap(pagingMap);
		mav.addObject("hotDealList", hotDealList);

		int totalHotDealNum = goodsService.selectHotDealTotalNumWithPagingMap(pagingMap);
		mav.addObject("totalHotDealNum", totalHotDealNum);

		List<HotDealVO> newHotdealList = goodsService.selectNewHotDealList();
		mav.addObject("newHotDealList", newHotdealList);

		mav.addAllObjects(pagingMap);
		System.out.println(mav);

		int maxPrice = goodsService.selectMaxPrice(pagingMap);
		mav.addObject("maxPrice", maxPrice);

		return mav;
	}
	
	
	
	
	
	
	
	
	
	//
	@RequestMapping(value = "/goods/goodsDetail.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView goodsDetail(@RequestParam("goodsNo") int goodsNo, HttpServletRequest request) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		GoodsVO goods = goodsService.selectGoodsByGoodsNo(goodsNo);

		HttpSession session = request.getSession();
		// 상품 상세 페이지를 들릴 때마다 최근 본 상품에 저장 상품을 저장
		addGoodsInQuick(goodsNo, goods, session);

		// 리뷰 개수
		int totalReviewsNum = goodsService.selectTotalReviewsNum(goodsNo);
		// 별점 평균
		float reviewAvg = goodsService.selectReviewAverage(goodsNo);
		// 상품의 옵션 리스트
		List<CartVO> goodsOptionList = goodsService.selectOptionsByGoodsNo(goodsNo);

		List<ReviewVO> newReviewList = goodsService.selectNewReviewsByGoodsNo(goodsNo);

		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("goods", goods);
		mav.addObject("totalReviewsNum", totalReviewsNum);
		mav.addObject("reviewAvg", reviewAvg);
		mav.addObject("goodsOptionList", goodsOptionList);
		mav.addObject("newReviewList", newReviewList);
		mav.addObject("section", 1);
		mav.addObject("pageNum", 1);
		return mav;

	}

	// ajax로 페이징에 따라 리뷰를 불러옴
	@ResponseBody
	@RequestMapping("/goods/nextReviews.do")
	public String nextReviews(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map map = GeneralFileUploader.getParameterMap(request);
		Map pagingMap = GeneralFunctions.getPagingMap(map);
		List<ReviewVO> reviewList = goodsService.selectReviewsWithPagingMap(pagingMap);

		String result = "";

		for (int i = 0; i < reviewList.size(); i++) {
			ReviewVO review = reviewList.get(i);
			result += "<div class=\'property-input1\'>";
			result += "<div class=\"property-gdtail-flex\">";
			result += "<div class=\"property-gdtail-flex1\">";
			result += "<span class=\"property-gdtail-font\">";
			result += review.getMemberId();
			result += "</span></div>";
			result += "<div class=\"property-gdtail-flex1\">\r\n" + "                          <span\r\n"
					+ "                            class=\"property-gdtail-font\"\r\n"
					+ "                            style=\"padding-top: 11px\"\r\n" + "                            >";
			float star = Float.parseFloat(review.getStar());
			for (int j = 0; j < star; j++) {
				result += "★";
			}
			if (star < Math.ceil(star)) {
				result += "☆";
			}
			result += "</span></div></div>";
			result += "<article class=\"property-gdtail-flex2\">\r\n" + "                        <div>\r\n"
					+ "                          <div class=\"property-gdtail-flex3\">\r\n"
					+ "                            <h3 class=\"property-gdtail-font1\">\r\n"
					+ "                              [";
			result += review.getGoodsName();
			result += "]\r\n" + "                            </h3>\r\n" + "                          </div>";
			result += "<p class=\"text-left\" style=\"padding: 15px 0 0 0\">";
			result += review.getContent();
			result += "<br />\r\n";

			if (review.getGoodsImg() != null && review.getGoodsImg().trim().length() > 0) {
				result += "                            <img\r\n" + "                              style=\"\r\n"
						+ "                                padding-top: 8px;\r\n"
						+ "                                width: 60px;\r\n"
						+ "                                height: 60px;\r\n" + "                              \"\r\n"
						+ "                              src=\"${contextPath}/download.do?imageFileName="
						+ review.getGoodsImg() + "&path=reviewNo" + review.getReviewNo()
						+ "                              class=\"expand_img\"\r\n"
						+ "                              alt=\"리뷰 사진\"\r\n" + "                            />";
			}

			result += "</p>\r\n" + "                          <footer class=\"css-1fkegtf\">\r\n"
					+ "                            <div>\r\n"
					+ "                              <span class=\"css-14kcwq8\">2023.08.12</span>\r\n"
					+ "                            </div>\r\n"
					+ "                            <button class=\"property-btn1\">\r\n"
					+ "                              <span class=\"ico property-img\"></span\r\n"
					+ "                              ><span>도움돼요</span>\r\n"
					+ "                            </button>\r\n" + "                          </footer>\r\n"
					+ "                        </div>\r\n" + "                      </article>\r\n"
					+ "                    </div>";
		}

		return result;

	}

	// 찜 버튼을 눌렀을 때 ajax로 불러오기 위한 매핑
	@ResponseBody
	@PostMapping("/goods/bookmark.do")
	public String goodsBookmark(HttpServletRequest request) {
		String result = "";
		String _goodsNo = request.getParameter("num");
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("memberInfo");
		if (member == null || member.getId().length() < 1) {
			return "login";
		}
		System.out.println("goodsBookmark.do");
		boolean isExist = false;
		try {
			int memberNo = member.getMemberNo();
			int goodsNo = Integer.parseInt(_goodsNo);
			BookmarkVO bookmarkVO = new BookmarkVO();
			bookmarkVO.setGoodsNo(goodsNo);
			bookmarkVO.setMemberNo(memberNo);
			isExist = goodsService.isExistBookmark(bookmarkVO);

			goodsService.insertNewBookmark(bookmarkVO);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
			result = "fail";
		}
		System.out.println(isExist);
		if (isExist) {
			return "duplicated";
		}
		System.out.println(result);
		return result;
	}

	@RequestMapping("/goods/search.do")
	public ModelAndView goodsSearch(HttpServletRequest request) throws IOException {
		
		ModelAndView mav = new ModelAndView("/goods/goodsHotDealList");
		request.setCharacterEncoding("utf-8");
		Map searchMap = GeneralFileUploader.getParameterMap(request);
		
		
		String pageNum = (String) searchMap.get("pageNum");
		String section = (String) searchMap.get("section");
		if (pageNum == null || pageNum.trim().length() < 1) {
			pageNum = "1";
			searchMap.put("pageNum", pageNum);
		}
		if (section == null || section.trim().length() < 1) {
			section = "1";
			searchMap.put("section", section);
		}

		int start = ((Integer.parseInt(section) - 1) + Integer.parseInt(pageNum) - 1) * 12;
		searchMap.put("start", start);

		System.out.println(searchMap);
		List<GoodsVO> goodsList = goodsService.selectGoodsListWithSearchFilter(searchMap);
		List<HotDealVO> hotDealList = goodsService.selectHotDealListWithSearchFilter(searchMap);
		int totalGoodsNum = goodsService.selectGoodsTotalNumWithSearchFilter(searchMap);

		mav.addObject("goodsList", goodsList);
		mav.addObject("totalGoodsNum", totalGoodsNum);
		mav.addObject("hotDealList", hotDealList);

		mav.addAllObjects(searchMap);
		System.out.println("Search mav:" +mav);

		int maxPrice = goodsService.selectMaxPriceWithSearchFilter(searchMap);
		mav.addObject("maxPrice", maxPrice);

		return mav;
	}
}
