package com.example.demo.admin.community.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.admin.community.service.AdminCommunityService;
import com.example.demo.common.alert.Alert;
import com.example.demo.common.file.GeneralFileUploader;
import com.example.demo.common.functions.GeneralFunctions;
import com.example.demo.vo.MemberVO;
import com.example.demo.vo.MostQnAVO;
import com.example.demo.vo.NoticeVO;
import com.example.demo.vo.OneQnAVO;

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


	// 민아 관리자 1:1문의 리스트
	@RequestMapping("/oneQnA/adminOneQnAList.do")
	public ModelAndView oneQnADetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("여기는 community oneQnADetail Controller");
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		List<OneQnAVO> oneQnAList = adminCommunityService.oneQnAList();
		System.out.println("oneQnAList= " + oneQnAList);
		mav.addObject("oneQnAList", oneQnAList);
		mav.setViewName(viewName);
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
	public ModelAndView adminNoticeAddList(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("noticeVO") NoticeVO noticeVO) throws Exception {
		System.out.println("여기는 community adminNoticeAddList Controller");
		ModelAndView mav = new ModelAndView();
		int noticeNo = adminCommunityService.newNum();
		System.out.println("noticeNo = " + noticeNo);
		noticeVO.setNoticeNo(noticeNo);
		adminCommunityService.addNotice(noticeVO);
		mav = Alert.alertAndRedirect("작성이 완료되었습니다.",
				request.getContextPath() + "/admin/community/notice/adminNoticeList.do");
		return mav;
	}

	@RequestMapping("/mostQnA/adminMostQnAList.do")
	public ModelAndView adminMostQnAList(HttpServletRequest request) throws IOException {

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		request.setCharacterEncoding("utf-8");
		Map pagingMap = GeneralFileUploader.getParameterMap(request);
		String pageNum = (String) pagingMap.get("pageNum");
		String section = (String) pagingMap.get("section");
		String category = (String) pagingMap.get("category");
		if (pageNum == null || pageNum.trim().length() < 1) {
			pageNum = "1";
			pagingMap.put("pageNum", pageNum);
		}
		if (section == null || section.trim().length() < 1) {
			section = "1";
			pagingMap.put("section", section);
		}
		if (category == null || category.trim().length() < 1) {
			category = "all";
			pagingMap.put("category", category);
		}
		try {
			int start = ((Integer.parseInt(section) - 1) + Integer.parseInt(pageNum) - 1) * 10;
			pagingMap.put("start", start);
			List<MostQnAVO> mostQnAList = adminCommunityService.selectMostQnAListWithPagingMap(pagingMap);
			mav.addAllObjects(pagingMap);
			mav.addObject("mostQnAList", mostQnAList);
			int totalMostQnANum = adminCommunityService.selectMostQnAListTotalNumWithCategory(category);
			mav.addObject("totalMostQnANum", totalMostQnANum);

			System.out.println(mav);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;

	}

	@RequestMapping(value = "/mostQnA/addMostQnA.do", method = RequestMethod.POST)
	public ModelAndView addMostQnA(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Map condMap = GeneralFileUploader.getParameterMap(request);

		// 설명문의 줄바꿈 처리
		String content = (String) condMap.get("content");
		System.out.println(content);
		content.replaceAll("\\r|\\n", "<br>");
		condMap.put("content", content);

		try {
			adminCommunityService.insertNewMostQnAWithMap(condMap);
			mav = Alert.alertAndRedirect("자주하는 질문을 추가했습니다.",
					request.getContextPath() + "/admin/community/mostQnA/adminMostQnAList.do");

		} catch (Exception e) {
			e.printStackTrace();
			String previousPage = request.getHeader("Referer");
			mav = Alert.alertAndRedirect("자주하는 질문을 추가하지 못 했습니다.", previousPage);
		}

		return mav;

	}

	@RequestMapping(value = "/mostQnA/adminMostQnAModForm.do")
	public ModelAndView adminMostQnAModForm(HttpServletRequest request) throws IOException {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		request.setCharacterEncoding("utf-8");

		String qnaNo = request.getParameter("qnaNo");
		MostQnAVO mostQnA = adminCommunityService.selectMostQnAByNo(qnaNo);
		mav.addObject("mostQnA", mostQnA);
		System.out.println(mav);
		return mav;
	}

	@RequestMapping(value = "/mostQnA/modMostQnA.do", method = RequestMethod.POST)
	public ModelAndView adminModMostQnA(HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView();
		Map condMap = GeneralFileUploader.getParameterMap(request);

		// 설명문의 줄바꿈 처리
		String content = (String) condMap.get("content");
		System.out.println(content);
		content.replaceAll("\\r|\\n", "<br>");
		condMap.put("content", content);
		try {
			adminCommunityService.updateMostQnAWithMap(condMap);
			mav = Alert.alertAndRedirect("수정했습니다.",
					request.getContextPath() + "/admin/community/mostQnA/adminMostQnAList.do");
		} catch (Exception e) {
			e.printStackTrace();
			mav = GeneralFunctions.getAlertPreviousRedirect(request, "수정하지 못 했습니다.");
		}

		return mav;

	}

	@RequestMapping(value = "/mostQnA/deleteQnA.do")
	public ModelAndView deleteMostQnA(HttpServletRequest request, @RequestParam("qnaNo") int qnaNo) {
		ModelAndView mav = new ModelAndView();
		String previousPage = request.getHeader("Referer");
		try {
			adminCommunityService.deleteMostQnA(qnaNo);
			mav = Alert.alertAndRedirect("삭제했습니다.", previousPage);
		} catch (Exception e) {
			e.printStackTrace();
			mav = Alert.alertAndRedirect("삭제하지 못 했습니다.", previousPage);
		}

		return mav;
	}
}
