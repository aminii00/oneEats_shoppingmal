package com.example.demo.main.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.common.alert.Alert;
import com.example.demo.main.service.MainService;
import com.example.demo.vo.CartVO;
import com.example.demo.vo.CouponVO;
import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.MemberVO;
import com.example.demo.vo.RecipeVO;

@Controller("mainController")
public class MainControllerImpl implements MainController {
	@Autowired
	private MainService mainService;

	@Autowired
	private GoodsVO goodsVo;

	@RequestMapping(value = "/main/mainPage.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session;
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);

		List<GoodsVO> goodsList = mainService.selectAllGoodsList();
		for (GoodsVO i : goodsList) {
		}
		mav.addObject("goodsList", goodsList);

		List<GoodsVO> newGoodsList = mainService.orderByNew();
		for (GoodsVO i : newGoodsList) {
		}
		mav.addObject("newGoodsList", newGoodsList);

		List<RecipeVO> newRecipeList = mainService.selectAllRecipesList();
		for (RecipeVO i : newRecipeList) {
		}
		mav.addObject("newRecipeList", newRecipeList);

		return mav;
	}

	@RequestMapping(value = "/main/cart.do")
	public ModelAndView cart(HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("utf-8");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		String previousPage = request.getHeader("Referer");
		mav.addObject("previousPage", previousPage);

		return mav;
	}

	// ajax로 cartList를 session에 저장하기 위한 코드
	@ResponseBody
	@PostMapping(value = "/storeValue.do")
	public String storeValueInSession(HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("utf-8");
		String result = "success";
		HttpSession session = request.getSession();
		try {
			String[] optionNos = request.getParameterValues("optionNo");
			String[] goodsQtys = request.getParameterValues("goodsQty");
			List<CartVO> cartList = new ArrayList<CartVO>();

			if (session.getAttribute("cartList") != null) {
				cartList = (List<CartVO>) session.getAttribute("cartList");
				session.removeAttribute("cartList");
			}

			// cartList에 하나씩 추가
			for (int i = 0; i < optionNos.length; i++) {
				CartVO tempcart = mainService.selectOptionByNo(Integer.parseInt(optionNos[i]));
				tempcart.setGoodsQty(Integer.parseInt(goodsQtys[i]));
				tempcart.setDiscountPrice();
				cartList.add(tempcart);
			}
			System.out.println("cartList" + cartList);

			session.setAttribute("cartList", cartList);
		} catch (Exception e) {
			result = "fail";
			e.printStackTrace();
		}

		return result;
	}

	
	@RequestMapping(value = "/orderNow.do",method = RequestMethod.POST)
	public ModelAndView storeValueInSessio2n(HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView();
		try {
			String[] optionNos = request.getParameterValues("optionNo");
			String[] goodsQtys = request.getParameterValues("goodsQty");
			List<CartVO> orderNowGoodsList = new ArrayList<CartVO>();
			String shippingFee = request.getParameter("shippingFee");
			String paymentPrice = request.getParameter("payment_price");
			String discountPrice = request.getParameter("discount_price");

			// cartList에 하나씩 추가
			for (int i = 0; i < optionNos.length; i++) {
				CartVO tempcart = mainService.selectOptionByNo(Integer.parseInt(optionNos[i]));
				tempcart.setGoodsQty(Integer.parseInt(goodsQtys[i]));
				tempcart.setDiscountPrice();
				orderNowGoodsList.add(tempcart);
			}
			mav.addObject("shippingFee",shippingFee);
			mav.addObject("payment_price",paymentPrice);
			mav.addObject("discount_price",discountPrice);
			System.out.println("orderNowGoodsList" + orderNowGoodsList);
			mav.addObject("selectGoodsList",orderNowGoodsList);
		    HttpSession session = request.getSession();
		    MemberVO loginMember = (MemberVO) session.getAttribute("memberInfo");
			List<CouponVO> couponList = mainService.selectCouponByMemberNo(loginMember.getMemberNo());
			mav.addObject("couponList", couponList);
			mav.setViewName("/mypage/orderConfirm");
		} catch (Exception e) {
			e.printStackTrace();
			String previousPage = request.getHeader("Referer");
			mav = Alert.alertAndRedirect("페이지 이동에 실패했습니다.", previousPage);
		}
		
		return mav;
	}
}
