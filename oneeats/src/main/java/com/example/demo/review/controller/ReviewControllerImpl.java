package com.example.demo.review.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.common.alert.Alert;
import com.example.demo.review.service.ReviewService;
import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.MemberVO;
import com.example.demo.vo.OrderVO;
import com.example.demo.vo.ReviewVO;

@Controller("reviewController")
public class ReviewControllerImpl implements ReviewController{
	@Autowired 
	private ReviewService reviewService;
	
	@RequestMapping(value = "/review/goodsReview.do")
	public ModelAndView goodsReview(HttpServletRequest request) {
		String viewName =  (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		System.out.println(mav);
		return mav;
	}
	
	@RequestMapping(value = "/review/writeReview.do")
	public ModelAndView writeReview(HttpServletRequest request) {
		System.out.println("여기는 writeReview Controller ");
		ModelAndView mav = new ModelAndView();
		String order_seqNo_ = request.getParameter("order_seqNo");
		int order_seqNo = Integer.parseInt(order_seqNo_);
		OrderVO orderVO= new OrderVO();
		orderVO.setOrder_seqNo(order_seqNo);
		HttpSession session = request.getSession();
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
		int memberNo = memberInfo.getMemberNo();
		orderVO.setMemberNo(memberNo);
		OrderVO order = reviewService.SearchGoods(orderVO);
		System.out.println("order= "+order);
		mav.addObject("order",order);
		mav.addObject("member",memberInfo);
		mav.setViewName("/review/writeReview");
		return mav;
	}
	
	@RequestMapping(value = "/review/reviewInsert.do")
	public ModelAndView reviewInsert(HttpServletRequest request) {
		System.out.println("여기는 reviewInsert Controller ");
		ModelAndView mav = new ModelAndView();
		String goodsNo_ = request.getParameter("goodsNo");// goodsNo 가져오기
		int goodsNo = Integer.parseInt(goodsNo_);
		HttpSession session = request.getSession();
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo"); //memberNo가져오기
		int memberNo = memberInfo.getMemberNo();
		String content = request.getParameter("content");
		String reviewImg = request.getParameter("reviewImg");
		String star = request.getParameter("star");
		int newReviewNo = reviewService.newReviewNo();
		ReviewVO reviewVO = new ReviewVO();
		reviewVO.setReviewNo(newReviewNo);
		reviewVO.setStar(star);
		reviewVO.setGoodsNo(goodsNo);
		reviewVO.setMemberNo(memberNo);
		reviewVO.setContent(content);
		reviewVO.setReviewImg(reviewImg);
		reviewService.reviewInsert(reviewVO);
		//등록되엇습니당
		mav = Alert.alertAndRedirect("등록되었습니다.", request.getContextPath() + "/mypage/mypageReviewList.do");
		return mav;
	}
}
