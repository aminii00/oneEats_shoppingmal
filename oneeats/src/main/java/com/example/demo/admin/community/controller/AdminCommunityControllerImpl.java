package com.example.demo.admin.community.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.admin.community.service.AdminCommunityService;
import com.example.demo.common.alert.Alert;
import com.example.demo.vo.MemberVO;
import com.example.demo.vo.NoticeVO;

@Controller("adminCommunityController")
@RequestMapping("/admin/community")
public class AdminCommunityControllerImpl implements AdminCommunityController {

	@Autowired
	private AdminCommunityService adminCommunityService;

	@Override
	@RequestMapping("/review/adminReviewList.do")
	public ModelAndView adminReviewList(HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("utf-8");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}

	// 민아 관리자 공지사항
	@RequestMapping("/notice/adminNoticeList.do")
	public ModelAndView adminNoticeList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("여기는 community noticeList Controller");
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		System.out.println("viewName = " + viewName);
		List<NoticeVO> noticeList = adminCommunityService.adminNoticeList();
		System.out.println("noticeList = " + noticeList);
		mav.addObject("noticeList", noticeList);
		mav.setViewName(viewName);
		return mav;
	}

	// adminNoticeModForm
	// 민아 관리자 공지사항 - 수정
	@RequestMapping("/notice/adminNoticeMod.do")
	public ModelAndView adminNoticeMod(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("여기는 community adminNoticeMod Controller");
		ModelAndView mav = new ModelAndView();
		String noticeNo_ = request.getParameter("noticeNo");
		int noticeNo = Integer.parseInt(noticeNo_);
		NoticeVO noticeVO = adminCommunityService.adminNoticeDetail(noticeNo);
		System.out.println("noticeVO = " + noticeVO);
		mav.addObject("notice", noticeVO);
		mav.setViewName("/admin/community/notice/adminNoticeModForm");
		return mav;
	}

	// 민아 관리자 공지사항 - 수정
	@RequestMapping("/notice/adminNotideDetailMod.do")
	public ModelAndView adminNotideDetailupdate(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("noticeVO") NoticeVO noticeVO) throws Exception {
		System.out.println("여기는 community adminNotideDetailMod Controller");
		ModelAndView mav = new ModelAndView();
		adminCommunityService.adminNotideDetailupdate(noticeVO);
		mav.addObject("notice", noticeVO);
		mav = Alert.alertAndRedirect("수정이 완료되었습니다.",
				request.getContextPath() + "/admin/community/notice/adminNoticeList.do");
		return mav;
	}

	// 민아 관리자 공지사항 - 삭제
	@RequestMapping("/notice/admindeleteNotice.do")
	public ModelAndView deleteNotice(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("여기는 community admindeleteNotice Controller");
		ModelAndView mav = new ModelAndView();
		String noticeNo_ = request.getParameter("noticeNo");
		int noticeNo = Integer.parseInt(noticeNo_);
		adminCommunityService.deleteNotice(noticeNo);
		mav = Alert.alertAndRedirect("삭제가 완료되었습니다.",
				request.getContextPath() + "/admin/community/notice/adminNoticeList.do");
		return mav;
	}
	
	// 민아 관리자 공지사항 - 삭제
		@RequestMapping("/notice/adminNoticeAddList.do")
		public ModelAndView adminNoticeAddList(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("noticeVO") NoticeVO noticeVO) throws Exception {
			System.out.println("여기는 community adminNoticeAddList Controller");
			ModelAndView mav = new ModelAndView();
			int noticeNo = adminCommunityService.newNum();
			System.out.println("noticeNo = " +noticeNo);
			noticeVO.setNoticeNo(noticeNo);
			adminCommunityService.addNotice(noticeVO);
			mav = Alert.alertAndRedirect("작성이 완료되었습니다.",
					request.getContextPath() + "/admin/community/notice/adminNoticeList.do");
			return mav;
		}

}
