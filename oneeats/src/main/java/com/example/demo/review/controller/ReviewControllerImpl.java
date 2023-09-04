package com.example.demo.review.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.common.alert.Alert;
import com.example.demo.common.file.GeneralFileUploader;
import com.example.demo.review.service.ReviewService;
import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.MemberVO;
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
		String goodsNo_ = request.getParameter("goodsNo");
		int goodsNo = Integer.parseInt(goodsNo_);
		GoodsVO goodsVO= new GoodsVO();
		goodsVO.setGoodsNo(goodsNo);
		GoodsVO goods = reviewService.SearchGoods(goodsVO);
		System.out.println("goods= "+goods);
		mav.addObject("goods",goods);
		mav.setViewName("/review/writeReview");
		return mav;
	}
	
	@RequestMapping(value = "/review/reviewInsert.do")
	public ModelAndView reviewInsert(MultipartHttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		String goodsNo_ = request.getParameter("goodsNo");// goodsNo 가져오기
		int goodsNo = Integer.parseInt(goodsNo_);
		HttpSession session = request.getSession();
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo"); //memberNo가져오기
		int memberNo = memberInfo.getMemberNo();
		String content = request.getParameter("content");
		String reviewImg = GeneralFileUploader.getFileName(request);
		String star = request.getParameter("star");
		int newReviewNo = reviewService.newReviewNo();
		ReviewVO reviewVO = new ReviewVO();
		reviewVO.setReviewNo(newReviewNo);
		reviewVO.setGoodsNo(goodsNo);
		reviewVO.setMemberNo(memberNo);
		reviewVO.setContent(content);
		reviewVO.setReviewImg(reviewImg);
		reviewVO.setStar(star);
		
		System.out.println(reviewVO);
		
		// 최근 한달 내에 이 상품의 리뷰를 썼었는지 확인. 안 썼다면 포인트 추가.
		boolean isReviewed = reviewService.isReviewed(reviewVO);
		if (isReviewed==false) {
			reviewService.updateMemberPoint(reviewVO);
		}
		
		

		
		int reviewNo = reviewService.reviewInsert(reviewVO);
		List fileList = GeneralFileUploader.upload(request, "/review/" + reviewNo);
		//등록되엇습니당
		mav = Alert.alertAndRedirect("등록되었습니다.", request.getContextPath() + "/mypage/mypageReviewList.do");
		return mav;
	}
}
