package com.example.demo.mypage.controller;

import java.util.List;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.servlet.ModelAndView;

import com.example.demo.mypage.service.MypageService;
import com.example.demo.vo.OrderVO;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.vo.MemberVO;


@Controller("mypageController")
public class MypageControllerImpl implements MypageController {
	@Autowired
	private MypageService mypageService;
	@Autowired
	private OrderVO orderVO;
	
	@RequestMapping(value = "/mypage/orderList.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView orderList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		String viewName = (String) request.getAttribute("viewName");
		List orderList = mypageService.selectOrderList();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("orderList", orderList);
		System.out.println(mav);
		return mav;
	}
	private MemberVO memberVO;

	@Override
	@RequestMapping(value="/mypage/myPageMain.do" ,method = RequestMethod.GET)
	public ModelAndView myPageMain(@RequestParam(required = false,value="message")  String message,
			   HttpServletRequest request, HttpServletResponse response)  throws Exception {
		System.out.println("여기는 myPageMain.do");
		HttpSession session=request.getSession();
		session=request.getSession();
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		memberVO=(MemberVO)session.getAttribute("memberInfo");
		String member_id="mina";
		// String member_id=memberVO.getId();
		MemberVO myList =mypageService.listMyPage(member_id);
		System.out.println(myList);
		mav.addObject("myList", myList);
		mav.setViewName("/mypage/mypageProfileModForm");
		return mav;
		
	}
	
	@RequestMapping(value="/mypage/mypageintro.do" ,method={RequestMethod.POST})
	public ModelAndView deleteMember(HttpServletRequest request, HttpServletResponse response)  throws Exception {
		String nickname = request.getParameter("nickname");
		String intro = request.getParameter("intro");
		System.out.println(intro);
		String id= request.getParameter("id");
		HashMap<String,String> memberMap=new HashMap<String,String>();
		
		memberMap.put("nickname", nickname);
		memberMap.put("intro", intro);
		memberMap.put("id", "mina");
		mypageService.mypageintro(memberMap);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("memberMap", memberMap);
		mav.setViewName("/mypage/mypageProfileModForm");
		return mav;
		
	}
	
	@RequestMapping(value="/mypage/*Form.do", method=RequestMethod.GET)
	private ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception{
		System.out.println("*Form.do");
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	
}
