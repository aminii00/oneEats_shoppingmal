package com.example.demo.member.controller;

import java.sql.Date;
import java.util.Map;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.common.alert.Alert;
import com.example.demo.common.file.GeneralFileUploader;
import com.example.demo.member.service.MemberService;
import com.example.demo.vo.MemberVO;

@Controller("memberController")
public class MemberControllerImpl implements MemberController {

	@Autowired
	private MemberService memberService;

	@Override
	@RequestMapping(value = "/member/login.do", method = RequestMethod.POST)
	public ModelAndView login(@RequestParam Map<String, String> loginMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		System.out.println(loginMap);
		MemberVO memberVO = memberService.login(loginMap);
		System.out.println("memberVO = " + memberVO);

		if (memberVO != null && memberVO.getId() != null) {
			HttpSession session = request.getSession();
			session = request.getSession();
			session.setAttribute("isLogOn", true);
			session.setAttribute("memberInfo", memberVO);
			mav.setViewName("redirect:/main/mainPage.do");

		} else {
			System.out.println("로그인 X");
			mav = Alert.alertAndRedirect("아이디나 비밀번호가 틀립니다. 다시 시도해 주세요",
					request.getContextPath() + "/member/loginForm.do");
		}
		return mav;
	}

	@Override
	@RequestMapping(value = "/member/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		session.setAttribute("isLogOn", false);
		session.removeAttribute("memberInfo");
		mav.setViewName("redirect:/main/mainPage.do");
		return mav;
	}

	@Override
	@RequestMapping(value = "/member/register.do", method = RequestMethod.POST)
	public ModelAndView Register(HttpServletRequest request) throws Exception {
		System.out.println("여기는 register.do");
		request.setCharacterEncoding("utf-8");

		ModelAndView mav = new ModelAndView();
		int memberNo = memberService.registerInfoNo(); // 새로운 No
		Map memberMap = GeneralFileUploader.getParameterMap(request);
		memberMap.put("memberNo", memberNo);
		System.out.println(memberMap);
		String _birth = (String) memberMap.get("birth");
		String sms_agreement = (String) memberMap.get("sms_agreement");
		String email_agreement = (String) memberMap.get("email_agreement");
		if (_birth == null || _birth.trim().length() < 1) {
			memberMap.put("birth", null);
		}
		if (email_agreement == null || email_agreement.trim().length() < 1) {
			memberMap.put("email_agreement", "no");
		}
		if (sms_agreement == null || sms_agreement.trim().length() < 1) {
			memberMap.put("sms_agreement", "no");
		}

		try {
			memberService.insertMemberWithMap(memberMap);
		} catch (Exception e) {
			e.printStackTrace();

		}

		mav = Alert.alertAndRedirect("회원가입이 완료되었습니다.", request.getContextPath() + "/member/loginForm.do");
		return mav;
	}

	// 민아 아이디 찾기
	@Override
	@RequestMapping(value = "/member/idSearch.do", method = RequestMethod.POST)
	public ModelAndView idSearch(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("memberVO") MemberVO memberVO, RedirectAttributes rAttr) throws Exception {
		System.out.println("idSearch Controller");
		ModelAndView mav = new ModelAndView();
		String id = memberService.idSearch(memberVO);

		if (id == null) {
			mav = Alert.alertAndRedirect("비밀번호가 틀립니다.", request.getContextPath() + "/member/idSearchForm.do");
		}
		System.out.println("id = " + id);
		mav.addObject("id", id);
		mav.setViewName("/member/idForm");
		return mav;
	}

	// 민아 비밀번호 찾기
	@Override
	@RequestMapping(value = "/member/pwdSearch.do", method = RequestMethod.POST)
	public ModelAndView PwdSearch(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("memberVO") MemberVO memberVO, RedirectAttributes rAttr) throws Exception {
		System.out.println("pwSearch Controller");
		ModelAndView mav = new ModelAndView();
		try {
			MemberVO member = memberService.pwSearch(memberVO);
			System.out.println("memberVO = " + member.getId());
			HttpSession session = request.getSession();
			// 세션에 회원정보 보관
			session.setAttribute("member", member);
			mav.setViewName("redirect:/member/newPwSearchForm.do");
		} catch (NullPointerException e) {
			System.out.println("비밀번호 찾기 - 정보 X");
			mav = Alert.alertAndRedirect("아이디나 비밀번호가 틀립니다. 다시 시도해 주세요",
					request.getContextPath() + "/member/pwSearchForm.do");
			e.printStackTrace();
		}
		return mav;
	}

	// 민아 비밀번호 - 업데이트
	@Override
	@RequestMapping(value = "/member/updatePw.do", method = RequestMethod.POST)
	public ModelAndView updatePw(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("updatePw Controller");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String pwd = request.getParameter("pwd");
		MemberVO member = (MemberVO) session.getAttribute("member");
		member.setPwd(pwd);
		System.out.println("member = " + member);
		int result = memberService.updatePw(member);
		ModelAndView mav = new ModelAndView("redirect:/member/loginForm.do");
		return mav;

	}

	// 민아 사업자 회원가입-사업자
	@Override
	@RequestMapping(value = "/member/sellerRegister_one.do", method = RequestMethod.POST)
	public ModelAndView sellerRegister_one(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		System.out.println("sellerRegister_one.do");

		String busNo1 = request.getParameter("busNo");

		int busNo = Integer.parseInt(busNo1);
		HttpSession session = request.getSession();
		// 세션에 로그인 회원정보 보관
		session.setAttribute("busNo", busNo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/member/sellerRegisterAgreeForm.do");
		return mav;
	}

	// 민아 사업자 회원가입 약관동의
	@Override
	@RequestMapping(value = "/member/sellerRegister_two.do", method = RequestMethod.POST)
	public ModelAndView sellerRegister_two(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		System.out.println("sellerRegister_two.do");
		String sms_agreement = request.getParameter("sms_agreement");
		String email_agreement = request.getParameter("email_agreement");

		int memberNo = memberService.registerInfoNo();
		Map memberMap = GeneralFileUploader.getParameterMap(request);
		if (email_agreement == null || email_agreement.trim().length() < 1) {
			email_agreement = "no";
		}

		if (sms_agreement == null || sms_agreement.trim().length() < 1) {
			sms_agreement = "no";
		}

		HttpSession session = request.getSession();
		// 세션에 로그인 회원정보 보관
		session.setAttribute("sms_agreement", sms_agreement);
		session.setAttribute("email_agreement", email_agreement);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/member/sellerRegisterInfoForm.do");
		return mav;
	}

	// 민아 사업자 회원가입 드디어 insert
	@Override
	@RequestMapping(value = "/member/sellerRegisterLast.do", method = RequestMethod.POST)
	public ModelAndView sellerRegisterLast(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		System.out.println("sellerRegisterLast.do");
		HttpSession session = request.getSession();
		int busNo = (int) session.getAttribute("busNo");
		String sms_agreement = (String) session.getAttribute("sms_agreement");
		String email_agreement = (String) session.getAttribute("email_agreement");
		String birth = request.getParameter("birth");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String address_detail = request.getParameter("address_detail");

		if (birth == null || birth.trim().length() < 1) {
			birth = null;
		}

		if (email == null || email.trim().length() < 1) {
			email = null;
		}

		if (address == null || address.trim().length() < 1) {
			address = null;
		}

		if (address_detail == null || address_detail.trim().length() < 1) {
			address_detail = null;
		}

		/*
		 * System.out.println("busNo = " +busNo); memberVO.setBusNo(busNo);
		 * memberVO.setSms_agreement(sms_agreement);
		 * memberVO.setEmail_agreement(email_agreement);
		 * 
		 * System.out.println(memberVO); int MemberNo = memberService.registerInfoNo();
		 * memberVO.setMemberNo(MemberNo); memberService.sellerRegisterInfo(memberVO);
		 */
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/member/sellerRegisterLastForm.do");
		return mav;
	}

}
