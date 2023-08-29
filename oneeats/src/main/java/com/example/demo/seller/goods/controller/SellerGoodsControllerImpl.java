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

	// 상품 목록
	@RequestMapping(value = "/seller/goods/sellerGoodsList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView sellerGoodsList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		String category = request.getParameter("category");
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
		Map pagingMap = new HashMap();
		pagingMap.put("category", category);
		pagingMap.put("pageNum", pageNum);
		pagingMap.put("section", section);
		pagingMap.put("goods_search_type", goods_search_type);
		pagingMap.put("start", ((section - 1) * 10 + pageNum - 1) * 10);
		
		List<GoodsVO> newGoodsList = sellerGoodsService.selectNewGoodsList(pagingMap);
		List<GoodsVO> goodsList = sellerGoodsService.selectGoodsList();

		mav.addObject("goodsList", goodsList);
		mav.addObject("newGoodsList", newGoodsList);
		mav.addAllObjects(pagingMap);
		
		List<Map> resultMap = sellerGoodsService.countGoodsNums();
		// 등록된 레시피가 몇 개인지
				long totalGoodsNum = (long) resultMap.get(0).get("cnt") ;
				// 현재 보고 있는 카테고리의 레시피가 몇 개인지
				long searchGoodsNum = -1;
				// Output the result
				for (Map<String, Object> row : resultMap) {
					String cate = (String) row.get("category");
					long count = (long) row.get("cnt");
					System.out.println("Category: " + cate + ", Count: " + count);
					if (cate.equals(category)) {
						searchGoodsNum = count;
					}
				}
				
				if (searchGoodsNum<0) {
					searchGoodsNum = totalGoodsNum;
				}
				
				
				
				mav.addObject("goodsNumMap", resultMap);
				mav.addObject("totalGoodsNum", totalGoodsNum);
				mav.addObject("searchGoodsNum",searchGoodsNum);
				
				
				
				System.out.println("resultMap:"+ resultMap);
				System.out.println("totalGoodsNum:"+ totalGoodsNum);
				System.out.println("searchGoodsNum:"+ searchGoodsNum);
				
				System.out.println("newGoodsList:" + newGoodsList);
				System.out.println("goodsList:" + goodsList);
				System.out.println("mav :"+mav);
				return mav;
	}

	@RequestMapping(value = "/seller/goods/sellerModForm.do")
	public ModelAndView sellerModForm(HttpServletRequest request) {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		// 세션에서 로그인한 유저 정보를 불러와 map에 저장
		HttpSession session = request.getSession();
		System.out.println(mav);
		return mav;
	}

	// 상품 등록
	@Override
	@RequestMapping(value = "/seller/goods/addSellerGoods.do", method = RequestMethod.POST)
	public ModelAndView addGoods(MultipartHttpServletRequest request) throws IOException {
		request.setCharacterEncoding("utf-8");
		int newGoodsNo = sellerGoodsService.selectNewGoodsNo();
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
		mav = Alert.alertAndRedirect("상품을 등록했습니다.",
				request.getContextPath() + "/goods/goodsDetail.do?goodsNo=" + newGoodsNo);
		return mav;
	}

	// 채연 - goodsList에서 수정 버튼 누르면 요기로옴

	/*
	 * @Override
	 * 
	 * @RequestMapping(value="/seller/goods/modSellerGoods.do", method=
	 * {RequestMethod.GET, RequestMethod.POST}) public ModelAndView
	 * modSellerGoodsForm(HttpServletRequest request, HttpServletResponse response)
	 * throws IOException{ String goodsNo1 = request.getParameter("goodsNo"); // 경로와
	 * 같이 던져준 goodsNo 가져오기 int goodsNo = Integer.parseInt(goodsNo1); // int로 형 변환
	 * 
	 * // goodsNo을 보내서 goodsVO 정보 가져오기 GoodsVO goodsVO =
	 * sellerGoodsService.selectGoodsVO(goodsNo); System.out.println("goodsVO = "
	 * +goodsVO);
	 * 
	 * List<OptionVO> option = (List<OptionVO>)
	 * sellerGoodsService.selectOptionVO(goodsNo); System.out.println(option);
	 * ModelAndView mav = new ModelAndView(); mav.addObject("option",option);
	 * mav.addObject("goods",goodsVO);
	 * mav.setViewName("/seller/goods/sellerGoodsModForm");
	 * 
	 * return mav; }
	 */

	@Override
	@RequestMapping(value = "/seller/goods/modSellerGoodsForm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView modSellerGoodsForm(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		System.out.println("modSellerGoodsForm Controller");
		String goodsNo1 = request.getParameter("goodsNo"); // 경로와 같이 던져준 goodsNo 가져오기
		int goodsNo = Integer.parseInt(goodsNo1); // int로 형 변환

		// goodsNo을 보내서 goodsVO 정보 가져오기
		GoodsVO goodsVO = sellerGoodsService.selectGoodsVO(goodsNo);
		System.out.println("goodsVO = " + goodsVO);

		List<OptionVO> option = (List<OptionVO>) sellerGoodsService.selectOptionVO(goodsNo);
		System.out.println(option);
		ModelAndView mav = new ModelAndView();
		mav.addObject("option", option);
		mav.addObject("goods", goodsVO);
		mav.setViewName("/seller/goods/sellerGoodsModForm");

		return mav;
	}

	// 북샵
	/*
	 * @Override
	 * 
	 * @RequestMapping(value="/seller/goods/modSellerGoods.do", method = {
	 * RequestMethod.GET, RequestMethod.POST }) public ResponseEntity
	 * modifyGoodsInfo( @RequestParam("goodsNo") String goodsNo,
	 * 
	 * @RequestParam("attribute") String attribute,
	 * 
	 * @RequestParam("value") String value, HttpServletRequest request,
	 * HttpServletResponse response) throws Exception { Map<String,String>
	 * goodsMap=new HashMap<String,String>(); goodsMap.put("goodsNo", goodsNo);
	 * System.out.println("나오나요0");
	 * 
	 * 
	 * goodsMap.put(attribute, value);
	 * 
	 * 
	 * 
	 * sellerGoodsService.modifyGoodsInfo(goodsMap); System.out.println("나오나요1");
	 * String message = null; ResponseEntity resEntity = null;
	 * System.out.println("나오나요2"); HttpHeaders responseHeaders = new HttpHeaders();
	 * message = "mod_success";
	 * 
	 * System.out.println("나오나요3"); resEntity =new ResponseEntity(message,
	 * responseHeaders, HttpStatus.OK); return resEntity; }
	 * 
	 */
	// 북샵

	/*
	 * @Override
	 * 
	 * @RequestMapping(value = "/seller/goods/modSellerGoods.do", method = {
	 * RequestMethod.GET, RequestMethod.POST }) public ModelAndView
	 * modSellerGoods(HttpServletRequest request, HttpServletResponse response)
	 * throws IOException {
	 * 
	 * request.setCharacterEncoding("utf-8"); int goodsNo =
	 * (Integer.parseInt(request.getParameter("goodsNo")));
	 * 
	 * GoodsVO goodsvo = sellerGoodsService.goodsItem(goodsNo);
	 * System.out.println("goodsvo:"+goodsvo);
	 * 
	 * 
	 * 
	 * sellerGoodsService.ModGoods(goodsvo);
	 * System.out.println("ModGoods:"+goodsvo);
	 * 
	 * sellerGoodsService.DeleteGoods(goodsvo);
	 * System.out.println("DeleteGoods:"+goodsvo);
	 * 
	 * 
	 * // 옵션정보 가져와서 각각의 VO에 저장 String[] optionNames =
	 * request.getParameterValues("option_name"); // 당근당근 optionX String[]
	 * System.out.println("optionNames: "+optionNames);//null
	 * 
	 * 
	 * String[] optionQtys = request.getParameterValues("option_qty"); String[]
	 * optionPrice = request.getParameterValues("option_price"); OptionVO[] options
	 * = new OptionVO[5]; for (int i = 0; i < options.length; i++) { OptionVO
	 * optionVO = new OptionVO(); options[i] = optionVO;
	 * 
	 * }
	 * 
	 * 
	 * ModelAndView mav = new ModelAndView(); for (int i = 0; i <
	 * optionNames.length; i++) { if (optionNames[i] != null) {
	 * options[i].setName(optionNames[i]);
	 * 
	 * 
	 * 
	 * options[i].setOption_qty(optionQtys[i]); options[i].setPrice(optionPrice[i]);
	 * options[i].setGoodsNo(goodsNo); System.out.println(options[i]); boolean
	 * result = sellerGoodsService.optionModGoods(options[i]); if (!result) {
	 * mav.addObject("redirectMessage", "상품 수정에 실패했습니다.");
	 * mav.addObject("redirectPage", request.getContextPath() +
	 * "/seller/goods/sellerGoodsForm.do"); mav.setViewName("/alert"); break; }
	 * 
	 * } else { System.out.println("상품 수정 실패"); break; }
	 * 
	 * } mav.addObject("goodsvo",goodsvo); System.out.println("상품 수정 성공"); mav =
	 * Alert.alertAndRedirect("상품을 수정했습니다.", request.getContextPath() +
	 * "/goods/goodsDetail.do?goodsNo=" + goodsNo); return mav; }
	 * 
	 * 
	 * 
	 */

//리스트 삭제
	@Override
	@RequestMapping(value = "/seller/goods/deleteSellerGoods.do", method = RequestMethod.GET)
	public ModelAndView deleteSellerGoods(@RequestParam("goodsNo") int goodsNo, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		sellerGoodsService.deleteSellerGoods(goodsNo);
		ModelAndView mav = new ModelAndView("redirect:/seller/goods/sellerGoodsList.do");
		return mav;
	}

}
