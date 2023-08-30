package com.example.demo.seller.hotdeal.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.common.alert.Alert;
import com.example.demo.common.file.GeneralFileUploader;
import com.example.demo.seller.hotdeal.service.SellerHotDealService;
import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.HotDealVO;
import com.example.demo.vo.MemberVO;
import com.example.demo.vo.OptionVO;

@Controller("sellerHotDealController")
public class SellerHotDealControllerImpl implements SellerHotDealController {
	@Autowired
	private SellerHotDealService sellerHotDealService;
	
	@RequestMapping(value = "/seller/hotdeal/sellerHotDealForm.do")
	public ModelAndView sellerHotDealForm(HttpServletRequest request) {
		
		String goodsNo1 = request.getParameter("goodsNo");
		int goodsNo = Integer.parseInt(goodsNo1);
		GoodsVO goodsVO = sellerHotDealService.selectGoodsVO(goodsNo);
		System.out.println("goodsVO = " + goodsVO);
		
		String viewName  =  (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("goods", goodsVO);
		mav.setViewName(viewName);
		return mav;
	}
	


	@Override
	@RequestMapping(value = "/seller/hotdeal/sellerHotDealAdd.do", method = RequestMethod.POST)
	public ModelAndView addHotdeals(HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("utf-8");
		System.out.println("hotdeal등록하기");
		ModelAndView mav = new ModelAndView();
		try {
		int newHotDealNo = sellerHotDealService.selectNewHotDealNo();
		Map map = new HashMap(); 
		map.put("hotdealNo", newHotDealNo);
		String name = (String) map.get("name");
		String discounted_price = (String) map.get("discounted_price");
		String goods_qty = (String) map.get("goods_qty");
		String finishDate = (String) map.get("finishDate");
		String creDate = (String) map.get("creDate");
		String category = (String) map.get("category");
		String description = (String) map.get("description");

		map.put(name, name);
		map.put(discounted_price, discounted_price);
		map.put(goods_qty, goods_qty);
		map.put(finishDate, finishDate);
		map.put(creDate, creDate);
		map.put(category, category);
		map.put(description, description);
		
		
		sellerHotDealService.addHotDeal(map);
		mav = Alert.alertAndRedirect("핫딜을 등록하셨습니다.", request.getContextPath() + "/HotDeal/HotDealDetail.do");

	} catch (Exception e) {
		mav = Alert.alertAndRedirect("오류가 일어나 등록하지 못 했습니다.",
				request.getContextPath() + "/seller/hotdeal/sellerHotDealForm.do");
	}

	return mav;
}
}		
		
/*
 * 
 * System.out.println("newHotDealNo = " + newHotDealNo);
 * 
 * 
 * map.put("hotdealNo", newHotDealNo);
 * 
 * String name = request.getParameter("name"); String discounted_price =
 * request.getParameter("discounted_price"); String goods_qty =
 * request.getParameter("goods_qty"); String finishDate =
 * request.getParameter("finishDate"); String creDate =
 * request.getParameter("creDate"); String category =
 * request.getParameter("category"); String description =
 * request.getParameter("description");
 * 
 * HotDealVO hotDealVO = new HotDealVO(); hotDealVO.setName(name);
 * hotDealVO.setName(discounted_price); hotDealVO.setName(goods_qty);
 * hotDealVO.setName(finishDate); hotDealVO.setName(creDate);
 * hotDealVO.setName(category); hotDealVO.setName(description);
 * 
 * sellerHotDealService.addHotDeal(hotDealVO); System.out.println("map : " +
 * map);
 * 
 * ModelAndView mav = new ModelAndView();
 * 
 * System.out.println("상품 등록 성공"); mav = Alert.alertAndRedirect("상품을 등록했습니다.",
 * request.getContextPath() + "/HotDeal/HotDealDetail.do?hotdealNo=" +
 * newHotDealNo); return mav; }
 */
	
	
	
	
	

