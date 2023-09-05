
package com.example.demo.admin.goods.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.admin.goods.service.AdminGoodsService;
import com.example.demo.common.alert.Alert;
import com.example.demo.common.file.GeneralFileUploader;
import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.MemberVO;
import com.example.demo.vo.OptionVO;
import com.example.demo.vo.RecipeVO;

@Controller("adminGoodsController")
public class AdminGoodsControllerImpl implements AdminGoodsController {

	@Autowired
	private AdminGoodsService adminGoodsService;

	@RequestMapping(value = "/admin/goods/adminGoodsForm.do")
	public ModelAndView sellerGoodsForm(HttpServletRequest request) {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		System.out.println(mav);

		return mav;
	}

	// 상품 등록
	@Override
	@RequestMapping(value = "/admin/goods/addAdminGoods.do", method = RequestMethod.POST)
	public ModelAndView addGoods(MultipartHttpServletRequest request) throws IOException {
		request.setCharacterEncoding("utf-8");
		int newGoodsNo = adminGoodsService.selectNewGoodsNo();
		List fileList = GeneralFileUploader.upload(request, "/goods/" + newGoodsNo);
		System.out.println("fileList : " + fileList);
		System.out.println("newGoodsNo = " + newGoodsNo);

		// map에 goods 정보를 저장
		Map map = GeneralFileUploader.getParameterMap(request);
		map.put("goodsNo", newGoodsNo);
		for (int i = 0; i < fileList.size(); i++) {
			map.put("img" + (i + 1), fileList.get(i));
		}
		System.out.println("map : " + map);
		// 세션에서 로그인한 유저 정보를 불러와 map에 저장
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		if (memberVO == null) {
			map.put("memberNo", 1);
		} else {
			map.put("memberNo", memberVO.getMemberNo());
		}
		System.out.println(map.get("memberNo"));
		boolean result1 = adminGoodsService.addGoods(map);

		// 옵션정보 가져와서 각각의 VO에 저장
		String[] optionNames = request.getParameterValues("option_name"); // 당근당근 optionX
		String[] optionQtys = request.getParameterValues("option_qty");
		String[] optionPrice = request.getParameterValues("option_price");

		OptionVO[] options = new OptionVO[optionNames.length];
		for (int i = 0; i < options.length; i++) {
			OptionVO optionVO = new OptionVO();
			options[i] = optionVO;

		}

		ModelAndView mav = new ModelAndView();
		for (int i = 0; i < optionNames.length; i++) {
			if (optionNames[i] != null) {
				options[i].setName(optionNames[i]);
				options[i].setOption_qty(optionQtys[i]);
				options[i].setPrice(optionPrice[i]);
				options[i].setGoodsNo(newGoodsNo);
				System.out.println(options[i]);
				boolean result = adminGoodsService.optionaddGoods(options[i]);
				if (!result) {
					mav.addObject("redirectMessage", "상품 등록에 실패했습니다.");
					mav.addObject("redirectPage", request.getContextPath() + "/seller/goods/sellerGoodsForm.do");
					mav.setViewName("/alert");
					break;
				}

			} else {
				System.out.println("상품 등록 실패");
				break;
			}

		}

		System.out.println("상품 등록 성공");
		mav = Alert.alertAndRedirect("상품을 등록했습니다.",
				request.getContextPath() + "/goods/goodsDetail.do?goodsNo=" + newGoodsNo);
		return mav;
	}

	// 상품 목록
	@RequestMapping(value = "/admin/goods/adminGoodsList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView sellerGoodsList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		String viewName = (String) request.getAttribute("viewName");
		String _pageNum = request.getParameter("pageNum");
		String _section = request.getParameter("section");
		String goods_search_type = request.getParameter("goods_search_type");
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
		if (goods_search_type != null && goods_search_type.length() < 1) {
			goods_search_type = "all";
		}
		Map pagingMap = GeneralFileUploader.getParameterMap(request);
		pagingMap.put("pageNum", pageNum);
		pagingMap.put("section", section);
		pagingMap.put("goods_search_type", goods_search_type);
		pagingMap.put("start", ((section - 1) * 10 + pageNum - 1) * 10);
		
		List<GoodsVO> goodsList = adminGoodsService.selectGoodsList(pagingMap);
		List<GoodsVO> newGoodsList = adminGoodsService.selectNewGoodsList();
		int totalGoodsNum = adminGoodsService.selectTotalGoodsNum();
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("goodsList", goodsList);
		mav.addObject("newGoodsList", newGoodsList);
		mav.addAllObjects(pagingMap);
		mav.addObject("totalGoodsNum", totalGoodsNum);
		System.out.println("mav :" + mav);
				return mav;
	}

	//리스트 삭제
		@Override
		@RequestMapping(value = "/admin/goods/deleteAdminGoods.do", method = RequestMethod.GET)
		public ModelAndView deleteAdminGoods(@RequestParam("goodsNo") int goodsNo, HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			request.setCharacterEncoding("utf-8");
			adminGoodsService.deleteAdminGoods(goodsNo);
			ModelAndView mav = new ModelAndView("redirect:/admin/goods/adminGoodsList.do");
			return mav;
		}
		
	//관리자 상품 삭제
		@Override
		@RequestMapping(value = "/admin/goods/deleteAdminSellerGoods.do", method = RequestMethod.GET)
		public ModelAndView deleteAdminSellerGoods(@RequestParam("goodsNo") int goodsNo, HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			request.setCharacterEncoding("utf-8");
			adminGoodsService.deleteAdminGoods(goodsNo);
			ModelAndView mav = new ModelAndView("redirect:/admin/goods/adminSellerGoodsList.do");
			return mav;
		}

	//상품 수정 창
		@RequestMapping(value = "/admin/goods/AdminGoodsModForm.do")
		public ModelAndView modForm(@RequestParam("goodsNo") int goodsNo, HttpServletRequest request)
				throws IOException {
			request.setCharacterEncoding("utf-8");
			String viewName = (String) request.getAttribute("viewName");
			ModelAndView mav = new ModelAndView(viewName);
			GoodsVO goodsVO = adminGoodsService.selectGoodsByGoodsNo(goodsNo);
			mav.addObject("goods", goodsVO);

			List<Map> optionsList = adminGoodsService.selectOptionsBygoodsNo(goodsNo);
			mav.addObject("optionsList", optionsList);

			System.out.println(mav);

			return mav;

		}


		
		//관리자 사업자 목록창
		@RequestMapping(value = "/admin/goods/adminSellerGoodsList.do", method = { RequestMethod.GET, RequestMethod.POST })
		public ModelAndView adminSellerGoodsList(HttpServletRequest request, HttpServletResponse response) throws Exception {
			request.setCharacterEncoding("utf-8");
			response.setContentType("html/text;charset=utf-8");
			String viewName = (String) request.getAttribute("viewName");
			String _pageNum = request.getParameter("pageNum");
			String _section = request.getParameter("section");
			String goods_search_type = request.getParameter("goods_search_type");
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
			if (goods_search_type !=null && goods_search_type.length()<1) {
				goods_search_type = "all";
			}	
			Map pagingMap = GeneralFileUploader.getParameterMap(request);
			pagingMap.put("pageNum", pageNum);
			pagingMap.put("section", section);
			pagingMap.put("goods_search_type", goods_search_type);
			pagingMap.put("start", ((section - 1) * 10 + pageNum - 1) * 10);
			
			List<GoodsVO> goodsList = adminGoodsService.selectSellerGoodsList(pagingMap);
			List<GoodsVO> newGoodsList = adminGoodsService.selectNewSellerGoodsList();
			int totalGoodsNum = adminGoodsService.selectTotalGoodsNum();
			
			ModelAndView mav = new ModelAndView(viewName);
			mav.addObject("goodsList", goodsList);
			mav.addObject("newGoodsList", newGoodsList);
			mav.addAllObjects(pagingMap);
			mav.addObject("totalGoodsNum", totalGoodsNum);
			System.out.println("mav :" + mav);
			return mav;
			
		}
		
		@RequestMapping(value = "/admin/goods/adminGoodsModForm.do", method = { RequestMethod.GET, RequestMethod.POST })
		public ModelAndView sellerGoodsModForm(HttpServletRequest request, HttpServletResponse response)
				throws IOException {
			System.out.println("여기는 adminGoodsModForm");
			request.setCharacterEncoding("utf-8");
			HttpSession session = request.getSession();
			String viewName = (String) request.getAttribute("viewName");
			
			int goodsNo = (Integer.parseInt(request.getParameter("goodsNo")));
			System.out.println("goodsNo="+goodsNo);
			GoodsVO sellerGoods = adminGoodsService.selectGoodsByGoodsNo(goodsNo);
			System.out.println("sellerGoods=" + sellerGoods);
			List<OptionVO> options = adminGoodsService.selectOptionByGoodsNo(goodsNo);
			System.out.println("options="+options);

			ModelAndView mav = new ModelAndView();
			mav.setViewName(viewName);
			mav.addObject("sellerGoods", sellerGoods);
			mav.addObject("options", options);
			return mav;
		}
		
		@RequestMapping(value = "/admin/goods/adminGoodsMod.do", method = { RequestMethod.GET, RequestMethod.POST })
		public ModelAndView sellerGoodsMod(HttpServletRequest request, HttpServletResponse response)
				throws IOException {
			System.out.println("여기는 adminGoodsMod");
			request.setCharacterEncoding("utf-8");
			String viewName = (String) request.getAttribute("viewName");
			String[] goods_No_= request.getParameterValues("goodsNo");
			int[] goodsNo_ = new int[goods_No_.length];
			for (int i=0; i<goodsNo_.length; i++) {
				goodsNo_[i] = Integer.parseInt(goods_No_[i]);
			}
			int goodsNo = goodsNo_[0];
			System.out.println("goodsNo="+goodsNo);
			
			String category = request.getParameter("category");
			String name = request.getParameter("name");
			String price = request.getParameter("price");
			String rapping = request.getParameter("rapping");
			String manufacturer = request.getParameter("manufacturer");
			String weight = request.getParameter("weight");
			String expDate = request.getParameter("expDate");
			String description = request.getParameter("description");
			String[] option_names = request.getParameterValues("option_name");
			String[] option_qtys = request.getParameterValues("option_qty");
			String[] option_prices = request.getParameterValues("option_price");
			System.out.println("option_names="+Arrays.toString(option_names));
			System.out.println("expDate="+expDate);
			System.out.println("rapping="+rapping);
			
			int[] optionNos = adminGoodsService.selectOptionNoByGoodsNo(goodsNo);
			for (int optionNo : optionNos) {
				adminGoodsService.deleteOption(optionNo);
			}

			GoodsVO sellerGoods = new GoodsVO();
			sellerGoods.setCategory(category);
			sellerGoods.setName(name);
			sellerGoods.setPrice(price);
			sellerGoods.setRapping(rapping);
			sellerGoods.setManufacturer(manufacturer);
			sellerGoods.setWeight(weight);
			sellerGoods.setExpDate(expDate);
			sellerGoods.setDescription(description);
			sellerGoods.setGoodsNo(goodsNo);
			System.out.println("sellerGoods="+sellerGoods);
			
			List<OptionVO> selectOptions = new ArrayList();
			for (int i=0; i<option_names.length; i++) {
				OptionVO temp = new OptionVO();
				temp.setName(option_names[i]);
				temp.setOption_qty(option_qtys[i]);
				temp.setPrice(option_prices[i]);
				temp.setGoodsNo(goodsNo);
				selectOptions.add(temp);
			}
			System.out.println("selectOptions"+selectOptions);
			

			adminGoodsService.updateSellerGoods(sellerGoods);
			for (OptionVO optionVO : selectOptions) {
				adminGoodsService.insertOptionForMod(optionVO);
			}

			ModelAndView mav = new ModelAndView("redirect:/admin/goods/adminGoodsList.do");
			return mav;
		}

		
		
		
		
		
}

