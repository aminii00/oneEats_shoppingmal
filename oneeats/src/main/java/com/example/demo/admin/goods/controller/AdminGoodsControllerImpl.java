
package com.example.demo.admin.goods.controller;

import java.io.IOException;
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

		OptionVO[] options = new OptionVO[5];
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
		ModelAndView mav = new ModelAndView(viewName);

		String _pageNum = request.getParameter("pageNum");
		String _section = request.getParameter("section");
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
		pagingMap.put("pageNum", pageNum);
		pagingMap.put("section", section);
		pagingMap.put("start", ((section - 1) * 10 + pageNum - 1) * 10);
		List<GoodsVO> newGoodsList = adminGoodsService.selectNewGoodsList(pagingMap);
		List<GoodsVO> goodsList = adminGoodsService.selectGoodsList();

		mav.addObject("goodsList", goodsList);
		mav.addObject("newGoodsList", newGoodsList);
		mav.addAllObjects(pagingMap);
		System.out.println(mav);
		System.out.println("newGoodsList:" + newGoodsList);
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
			
			HttpSession session = request.getSession();
			String viewName = (String) request.getAttribute("viewName");
			ModelAndView mav = new ModelAndView(viewName);

			String _pageNum = request.getParameter("pageNum");
			String _section = request.getParameter("section");
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
			pagingMap.put("pageNum", pageNum);
			pagingMap.put("section", section);
			pagingMap.put("start", ((section - 1) * 10 + pageNum - 1) * 10);
			List<GoodsVO> newGoodsList = adminGoodsService.selectNewSellerGoodsList(pagingMap);
			List<GoodsVO> goodsList = adminGoodsService.selectSellerGoodsList();		
			mav.addObject("goodsList", goodsList);
			mav.addObject("newGoodsList", newGoodsList);
			mav.addAllObjects(pagingMap);
			System.out.println(mav);
			System.out.println("newGoodsList:" + newGoodsList);
			return mav;
		}

		
		
		
	
}
