package com.example.demo.goods.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.goods.service.GoodsService;
import com.example.demo.vo.CartVO;
import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.HotDealVO;

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
				if (goodsNo == _goodsBean.getGoodsNo()) {
					already_existed = true;
					break;
				}
			}
			if (already_existed == false) {
				if (quickGoodsList.size()<6) {					
					quickGoodsList.add(goodsVO);
				}else {
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

		List<GoodsVO> goodsList = goodsService.selectAllGoodsList();
		mav.addObject("goodsList", goodsList);
		int totalGoodsNum = goodsService.selectTotalGoodsNumForAll();
		mav.addObject("totalGoodsNum", totalGoodsNum);

		List<HotDealVO> newHotdealList = goodsService.selectNewHotDealList();
		mav.addObject("newHotDealList", newHotdealList);
		return mav;
	}

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

		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("goods", goods);
		mav.addObject("totalReviewsNum", totalReviewsNum);
		mav.addObject("reviewAvg", reviewAvg);
		mav.addObject("goodsOptionList", goodsOptionList);

		return mav;
	}

}
