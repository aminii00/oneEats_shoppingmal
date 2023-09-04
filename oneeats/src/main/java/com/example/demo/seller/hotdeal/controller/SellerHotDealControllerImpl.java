package com.example.demo.seller.hotdeal.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.common.alert.Alert;
import com.example.demo.seller.hotdeal.service.SellerHotDealService;
import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.HotDealVO;

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

		String viewName = (String) request.getAttribute("viewName");
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
		int newHotDealNo = sellerHotDealService.selectNewHotDealNo();
//		Map map = new HashMap(); 
//		map.put("hotdealNo", newHotDealNo);
//	
//		System.out.println("newHotDealNo = " + newHotDealNo);
//
//		 map.put("hotdealNo", newHotDealNo);
		HotDealVO hotDealVO = new HotDealVO();
		hotDealVO.setHotdealNo(newHotDealNo);
		String name = request.getParameter("name");
		hotDealVO.setName(name);
		String discounted_price = request.getParameter("discounted_price");
		hotDealVO.setDiscounted_price(discounted_price);
		String goods_qty = request.getParameter("goods_qty");
		hotDealVO.setGoods_qty(goods_qty);
		String finishDate = request.getParameter("finishDate");
		hotDealVO.setFinishDate(finishDate);
		String category = request.getParameter("category");
		hotDealVO.setCategory(category);
		String description = request.getParameter("description");
		hotDealVO.setDescription(description);
		String goodsNo_ = request.getParameter("goodsNo");
		int goodsNo = Integer.parseInt(goodsNo_);
		hotDealVO.setGoodsNo(goodsNo);

		System.out.println("hotdealVO = " + hotDealVO);
		sellerHotDealService.addHotDeal(hotDealVO);

		System.out.println("상품 등록 성공");
		mav = Alert.alertAndRedirect("상품을 등록했습니다.", request.getContextPath() + "/goods/hotdealDetail.do?hotdealNo="+newHotDealNo);
		
		return mav;

	}

	

@RequestMapping(value = "/goods/hotdealDetail.do", method = { RequestMethod.POST, RequestMethod.GET })
public ModelAndView goodsDetail(@RequestParam("hotdealNo") int hotdealNo, HttpServletRequest request) throws Exception {
	System.out.println("hotdealDetail");
	String viewName = (String) request.getAttribute("viewName");
System.out.println("hotdealNo = " +hotdealNo);
	HotDealVO hotdeal = sellerHotDealService.selectHotDealByHotDealNo(hotdealNo);
	System.out.println("hotdeal = " + hotdeal);
	HttpSession session = request.getSession();
	ModelAndView mav = new ModelAndView(viewName);
	mav.addObject("hotdeal", hotdeal);
	int goodsNo = hotdeal.getGoodsNo();
	
	GoodsVO goodsVO = sellerHotDealService.SearchGoods(goodsNo);
	System.out.println("goods = " +goodsVO);
	mav.addObject("goods",goodsVO);
	mav.setViewName(viewName);
	
	return mav;
	
}


	// 상품 목록
		@RequestMapping(value = "/seller/hotdeal/sellerHotDealList.do", method = { RequestMethod.GET, RequestMethod.POST })
		public ModelAndView sellerHotDealList(HttpServletRequest request, HttpServletResponse response) throws Exception {
			request.setCharacterEncoding("utf-8");
			response.setContentType("html/text;charset=utf-8");
			String viewName = (String) request.getAttribute("viewName");
			ModelAndView mav = new ModelAndView(viewName);
			String category = request.getParameter("category");
			String _pageNum = request.getParameter("pageNum");
			String _section = request.getParameter("section");
			String hotdeal_search_type = request.getParameter("hotdeal_search_type");
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
			if (hotdeal_search_type !=null && hotdeal_search_type.length()<1) {
				hotdeal_search_type = "all";
			}	
			Map pagingMap = new HashMap();
			pagingMap.put("category", category);
			pagingMap.put("pageNum", pageNum);
			pagingMap.put("section", section);
			pagingMap.put("hotdeal_search_type", hotdeal_search_type);
			pagingMap.put("start", ((section - 1) * 10 + pageNum - 1) * 10);
			
			List<HotDealVO> hotdealList = sellerHotDealService.selectHotDealList(pagingMap);
			List<HotDealVO> newHotDealList = sellerHotDealService.selectNewHotDealList();

			mav.addObject("HotDealList",hotdealList);
			mav.addObject("newHotDealList", newHotDealList);
			mav.addAllObjects(pagingMap);
			
			List<Map> resultMap = sellerHotDealService.countHotDealNums();
			// 등록된 상품가 몇 개인지
					long totalHotDealNum = (long) resultMap.get(0).get("cnt") ;
					// 현재 보고 있는 카테고리의상품이 몇 개인지
					long searchHotDealNum = -1;
					String type ="관리자";
					if("관리자".equals(type)) {
					// Output the result
					for (Map<String, Object> row : resultMap) {
						String cate = (String) row.get("category");
						long count = (long) row.get("cnt");
						System.out.println("Category: " + cate + ", Count: " + count);
						if (cate.equals(category)) {
							searchHotDealNum = count;
						}
					}
					
					if (searchHotDealNum<0) {
						searchHotDealNum = totalHotDealNum;
					}
					}
					mav.addObject(" hotdealNumMap", resultMap);
					mav.addObject("totalHotDealNum", totalHotDealNum);
					mav.addObject("searchHotDealNum",searchHotDealNum);

					System.out.println("mav :"+mav);
					return mav;
		}

}

