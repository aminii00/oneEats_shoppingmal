package com.example.demo.admin.coupon.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.admin.coupon.service.AdminCouponService;
import com.example.demo.vo.CouponVO;
import com.example.demo.vo.MemberVO;

@Controller("adminCouponController")
public class AdminCouponControlllerImpl implements AdminCouponController {
	@Autowired
	AdminCouponService adminCouponService;
	
	@Override
	@RequestMapping(value = "/admin/coupon/adminCouponList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView adminCouponList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("memberInfo");
		int memberNo = member.getMemberNo();
		String viewName = (String) request.getAttribute("viewName");
			
		List<CouponVO> adminCouponList = adminCouponService.adminCouponByMemberNo(memberNo);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("adminCouponList", adminCouponList);
		System.out.println(mav);
		return mav;
	}
	
	@RequestMapping(value = "/admin/coupon/adminCouponForm.do", method = { RequestMethod.GET, RequestMethod.POST })
	private ModelAndView adminCouponForm(HttpServletRequest request,HttpServletResponse response) throws Exception {
		System.out.println("여기는 adminCouponForm");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value="/admin/coupon/adminAddCoupon.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView adminAddCoupon(HttpServletRequest request,HttpServletResponse response) throws Exception {
		System.out.println("여기는 adminAddCoupon");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("memberInfo");
		int memberNo = member.getMemberNo();
		String viewName = (String)request.getAttribute("viewName");
		
		adminCouponService.insertAdminCoupon(memberNo);
		
		
		ModelAndView mav = new ModelAndView("redirect:/admin/coupon/adminCouponList.do");
		return mav;
	}
	
}
