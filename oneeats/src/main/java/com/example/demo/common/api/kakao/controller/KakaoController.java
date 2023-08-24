package com.example.demo.common.api.kakao.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.common.alert.Alert;
import com.example.demo.common.api.common.MsgEntity;
import com.example.demo.common.api.kakao.dto.KakaoDTO;
import com.example.demo.common.api.kakao.service.KakaoService;
import com.example.demo.member.service.MemberService;
import com.example.demo.vo.MemberVO;

@Controller
@RequestMapping("kakao")
public class KakaoController {

	@Autowired
	private KakaoService kakaoService;

	@Autowired
	private MemberService memberService;

	@GetMapping("/callback")
	public ModelAndView callback(HttpServletRequest request) throws Exception {
		KakaoDTO kakaoInfo = kakaoService.getKakaoInfo(request.getParameter("code"));

		// email을 참조해서 가입된 유저인지 판단한다.
		// 가입된 유저면 그대로 로그인, 가입되지 않은 유저면 회원가입창으로 이동.
		long hash = kakaoInfo.hash();
		System.out.println(kakaoInfo);
		
		MemberVO member = memberService.selectMemberById("kakao_"+hash);
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		if (member == null || member.getId().trim().length() < 1) {
			mav =  Alert.alertAndRedirect("카카오 계정으로 가입되지 않았습니다. <br> 회원가입 페이지로 이동합니다.", "/kakao/registerApi.do");
			session.setAttribute("kakaoInfo", kakaoInfo);
		} else {
			session = request.getSession();
			session.setAttribute("isLogOn", true);
			session.setAttribute("memberInfo", member);
			mav.setViewName("redirect:/main/mainPage.do");
		}

		return mav;
	}
	
	@RequestMapping("/registerApi.do")
	public ModelAndView registerApi(HttpSession session) {
		ModelAndView mav = new ModelAndView("/member/registerApi");
		KakaoDTO kakaoInfo = (KakaoDTO) session.getAttribute("kakaoInfo");
		session.removeAttribute("kakaoInfo");
		long hash = kakaoInfo.hash();
		mav.addObject("api_id","kakao_"+hash);
		mav.addObject("name", kakaoInfo.getNickname());
		mav.addObject("email", kakaoInfo.getEmail());
		return mav;
	}
}
