package com.example.demo.seller.goods.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.common.alert.Alert;
import com.example.demo.common.file.GeneralFileUploader;
import com.example.demo.seller.goods.service.SellerGoodsService;
import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.MemberVO;
import com.example.demo.vo.OptionVO;
import com.example.demo.vo.OrderVO;

@Controller("sellerGoodsController")
public class SellerGoodsControllerImpl implements SellerGoodsController {
	
	@Autowired
	private SellerGoodsService sellerGoodsService;

	@RequestMapping(value = "/seller/goods/sellerGoodsForm.do")
	public ModelAndView sellerGoodsForm(HttpServletRequest request) {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		System.out.println(mav);

		return mav;
	}

	//상품 목록 
	@RequestMapping(value = "/seller/goods/sellerGoodsList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView sellerGoodsList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		String viewName = (String) request.getAttribute("viewName");
		List<GoodsVO> goodsList = sellerGoodsService.selectGoodsList();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("goodsList", goodsList);
		System.out.println(mav);
		return mav;
	}

	@RequestMapping(value = "/seller/goods/sellerModForm.do")
	public ModelAndView sellerModForm(HttpServletRequest request) {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		System.out.println(mav);
		return mav;
	}

	//상품 등록
	@Override
	@RequestMapping(value = "/seller/goods/addSellerGoods.do", method = RequestMethod.POST)
	public ModelAndView addGoods(MultipartHttpServletRequest request
			) throws IOException {
		request.setCharacterEncoding("utf-8");
		int newGoodsNo = sellerGoodsService.selectNewGoodsNo();
		List fileList = GeneralFileUploader.upload(request, "/goods/" + newGoodsNo);
		System.out.println("fileList : " + fileList);
		System.out.println("newGoodsNo = " + newGoodsNo);

		// map에 goods 정보를 저장
		Map map = GeneralFileUploader.getParameterMap(request);
		map.put("goodsNo", newGoodsNo);
		map.put("img1", fileList.get(0));
		map.put("img2", fileList.get(1));
		map.put("img3", fileList.get(2));
		map.put("img4", fileList.get(3));
		map.put("img5", fileList.get(4));
		
		System.out.println("map : "+map);
		// 세션에서 로그인한 유저 정보를 불러와 map에 저장
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("loginUser");
		if (memberVO == null) {
			map.put("memberNo", 1);
		} else {
			map.put("memberNo", memberVO.getMemberNo());
		}
		System.out.println(map.get("memberNo"));
		boolean result1 = sellerGoodsService.addGoods(map);
		

		
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
				boolean result = sellerGoodsService.optionaddGoods(options[i]);
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
		mav = Alert.alertAndRedirect("상품을 등록했습니다.", request.getContextPath() + "/goods/goodsDetail.do?goodsNo=" + newGoodsNo);
		return mav;
	}

	// 채연 - goodsList에서 수정 버튼 누르면 요기로옴

	/*
	@Override
	@RequestMapping(value="/seller/goods/modSellerGoods.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView modSellerGoodsForm(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String goodsNo1 = request.getParameter("goodsNo"); // 경로와 같이 던져준 goodsNo 가져오기
		int goodsNo = Integer.parseInt(goodsNo1);          // int로 형 변환
		
		// goodsNo을 보내서 goodsVO 정보 가져오기
		GoodsVO goodsVO = sellerGoodsService.selectGoodsVO(goodsNo); 
		System.out.println("goodsVO = " +goodsVO);
		
		List<OptionVO> option =  (List<OptionVO>) sellerGoodsService.selectOptionVO(goodsNo);
		System.out.println(option);
		ModelAndView mav = new ModelAndView();
		mav.addObject("option",option);
		mav.addObject("goods",goodsVO);
		mav.setViewName("/seller/goods/sellerGoodsModForm");
		
		return mav;
	}
	*/
	
	@Override
	@RequestMapping(value="/seller/goods/modSellerGoods.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView modSellerGoodsForm(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String goodsNo1 = request.getParameter("goodsNo"); // 경로와 같이 던져준 goodsNo 가져오기
		int goodsNo = Integer.parseInt(goodsNo1);          // int로 형 변환
		
		// goodsNo을 보내서 goodsVO 정보 가져오기
		GoodsVO goodsVO = sellerGoodsService.selectGoodsVO(goodsNo); 
		System.out.println("goodsVO = " +goodsVO);
		
		List<OptionVO> option =  (List<OptionVO>) sellerGoodsService.selectOptionVO(goodsNo);
		System.out.println(option);
		ModelAndView mav = new ModelAndView();
		mav.addObject("option",option);
		mav.addObject("goods",goodsVO);
		mav.setViewName("/seller/goods/sellerGoodsModForm");
		
		return mav;
	}
	
	
	
	
	

	
	
	
	/*@Override
	@RequestMapping(value="/seller/goods/modSellerGoods.do",method = RequestMethod.GET)
	public ModelAndView modSellerGoods(HttpServletRequest request, HttpServletResponse response) throws IOException{
		System.out.println("여기는 modSellerGoods");
		
		request.setCharacterEncoding("utf-8");
		String goodsNo1 = request.getParameter("goodsNo");
		int goodsNo = Integer.parseInt(goodsNo1);

		boolean result1 = sellerGoodsService.ModGoods(goodsNo); // addGodds 수정하기
		
		
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
				options[i].setGoodsNo(goodsNo);
				System.out.println(options[i]);
				boolean result = sellerGoodsService.optionModGoods(options[i]);
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
		mav = Alert.alertAndRedirect("상품을 등록했습니다.", request.getContextPath() + "/goods/goodsDetail.do?goodsNo=" + goodsNo);
		return mav;
	}*/
	

	
	
	
//리스트 삭제
	@Override
	@RequestMapping(value="/seller/goods/deleteSellerGoods.do",method = RequestMethod.GET)
	public ModelAndView deleteSellerGoods(@RequestParam("goodsNo") int goodsNo, 
			           HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		sellerGoodsService.deleteSellerGoods(goodsNo);
		ModelAndView mav = new ModelAndView("redirect:/seller/goods/sellerGoodsList.do");
		return mav;
	}

	

	

}
