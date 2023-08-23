package com.example.demo.mypage.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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

import com.example.demo.common.alert.Alert;
import com.example.demo.mypage.service.MypageService;
import com.example.demo.vo.CouponVO;
import com.example.demo.vo.DeliveryAddressVO;
import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.MemberVO;
import com.example.demo.vo.OrderVO;

@Controller("mypageController")
public class MypageControllerImpl implements MypageController {
	@Autowired
	private MypageService mypageService;
	@Autowired
	private OrderVO orderVO;
	@Autowired
	private MemberVO memberVO;

	@Override
	@RequestMapping(value = "/mypage/orderList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView orderList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		String viewName = (String) request.getAttribute("viewName");
			
		List<OrderVO> orderList = mypageService.selectOrderList();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("orderList", orderList);
		System.out.println(mav);
		return mav;
	}

	@Override
	@RequestMapping(value = "/mypage/orderDetail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView orderDetail(@RequestParam(required = false, value = "orderNo") int orderNo,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String viewName = (String) request.getAttribute("viewName");
		List<OrderVO> orderDetail = mypageService.selectOrderByOrderNo(orderNo);
		orderVO = orderDetail.get(0);
		ModelAndView mav = new ModelAndView(viewName);
		mav.setViewName(viewName);
		mav.addObject("orderDetail", orderDetail);
		mav.addObject("order", orderVO);
		return mav;
	}

	@Override
	@RequestMapping(value = "/mypage/orderConfirm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView orderConfirm(int memberNo, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		System.out.println("여기는 orderConfirm");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String viewName = (String) request.getAttribute("viewName");

		String[] goodsNos = request.getParameterValues("goodsNo");
		String[] goodsQtys = request.getParameterValues("goodsQty");
		String[] goodsInbun = request.getParameterValues("goodsInbun");
		String[] optionNos = request.getParameterValues("optionNo");
		String shippingFee = request.getParameter("shippingFee");
		String payment_price = request.getParameter("payment_price");
		String discount_price = request.getParameter("discount_price");

		List<CouponVO> couponList = mypageService.selectCouponByMemberNo(memberNo);

		List<OrderVO> selectGoodsList = new ArrayList();
		for (int i = 0; i < goodsNos.length; i++) {
			OrderVO temp = new OrderVO();
			temp.setGoodsNo(Integer.parseInt(goodsNos[i]));
			temp.setGoods_qty(Integer.parseInt(goodsQtys[i]));
			temp.setGoods_inbun(goodsInbun[i]);
			temp.setOptionNo(Integer.parseInt(optionNos[i]));
			temp.setShippingfee(Integer.parseInt(shippingFee));
			temp.setPayment_price(Integer.parseInt(payment_price));
			temp.setDiscount_price(Integer.parseInt(discount_price));
			selectGoodsList.add(temp);
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("payment_price", payment_price);
		mav.addObject("shippingFee", shippingFee);
		mav.addObject("discount_price", discount_price);
		mav.addObject("selectGoodsList", selectGoodsList);
		mav.addObject("couponList", couponList);
		session.setAttribute("selectGoodsList", selectGoodsList);
		return mav;
	}

	@Override
	@RequestMapping(value = "/mypage/newOrder.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView newOrder(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("여기는 newOrder");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("memberInfo");
		int memberNo = member.getMemberNo();
		String viewName = (String) request.getAttribute("viewName");

		int orderNo = mypageService.selectNewOrderNo();
		String orderer_name = request.getParameter("orderer_name");
		String orderer_phone = request.getParameter("orderer_phone");
		String receiver_name = request.getParameter("receiver_name");
		String receiver_address = request.getParameter("receiver_address");
		String receiver_phone = request.getParameter("receiver_phone");
		String receiver_comment = request.getParameter("receiver_comment");
		String used_point = request.getParameter("used_point");
		String used_couponId = request.getParameter("used_couponId");
		String point_price = request.getParameter("point_price");
		String total_price = request.getParameter("total_price");
		String payment_type = request.getParameter("payment_type");
		
		List<OrderVO> selectGoodsList = (List<OrderVO>) session.getAttribute("selectGoodsList");
		List<OrderVO> orderList = new ArrayList();
		System.out.println("selectGoodsList" + selectGoodsList);
		int result = 0;
		for (int i = 0; i < selectGoodsList.size(); i++) {
			OrderVO temp = selectGoodsList.get(i);
			temp.setOrderNo(orderNo);
			temp.setOrderer_name(orderer_name);
			temp.setOrderer_phone(orderer_phone);
			temp.setReciever_name(receiver_name);
			temp.setReciever_address(receiver_address);
			temp.setReciever_phone(receiver_phone);
			temp.setReciever_comment(receiver_comment);
			temp.setUsed_point(Integer.parseInt(used_point));
			temp.setUsed_couponId(Integer.parseInt(used_couponId));
			temp.setPoint_price(Integer.parseInt(point_price));
			temp.setTotal_price(Integer.parseInt(total_price));
			temp.setPayment_type(payment_type);
			temp.setMemberNo(memberNo);

			orderList.add(temp);
		}

		mypageService.insertOrderList(orderList);
		session.setAttribute("orderList", orderList);
		ModelAndView mav = new ModelAndView("redirect:/mypage/orderList.do");
		
		
		
		return mav;
	}
	
	@RequestMapping(value = "/mypage/orderCancel.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView orderCancel(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("여기는 orderCancel");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String viewName = (String)request.getAttribute("viewName");
		
		int orderNo = (Integer.parseInt(request.getParameter("orderNo")));
		List<OrderVO> orderCancel = mypageService.selectOrderByOrderNo(orderNo);
		orderVO = orderCancel.get(0);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("orderCancel", orderCancel);
		mav.addObject("order", orderVO);
		session.setAttribute("orderCancel", orderCancel);
		return mav;
	}	

	@RequestMapping(value = "/mypage/orderCancelResult.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView orderCancelResult(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("여기는 orderCancelResult");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("memberInfo");
		int memberNo = member.getMemberNo();
		String viewName = (String)request.getAttribute("viewName");
		int orderNo = (Integer.parseInt(request.getParameter("orderNo")));
		String delivery_status = request.getParameter("delivery_status");

		int[] order_seqNos = mypageService.selectSeqNoByOrderNo(orderNo);
		for (int order_seqNo : order_seqNos) {
			mypageService.updateDeliveryStatusToCancel(order_seqNo);
		}

		ModelAndView mav = new ModelAndView("redirect:/mypage/orderList.do");
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/mypage/myPageMain.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView myPageMain(@RequestParam(required = false, value = "message") String message,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("여기는 myPageMain.do");
		HttpSession session = request.getSession();
		session = request.getSession();
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		memberVO = (MemberVO) session.getAttribute("memberInfo");
		String member_id = "mina";
		// String member_id=memberVO.getId();
		MemberVO myList = mypageService.listMyPage(member_id);
		System.out.println(myList);
		mav.addObject("myList", myList);
		mav.setViewName("/mypage/mypageProfileModForm");
		return mav;
	}

	// 민아 프로필편집 2
	@Override
	@RequestMapping(value = "/mypage/mypageintro.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView deleteMember(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("여기는 mypageintro.do");
		String nickname = request.getParameter("nickname");
		String intro = request.getParameter("intro");
		System.out.println(intro);
		String id = request.getParameter("id");
		HashMap<String, String> memberMap = new HashMap<String, String>();

		memberMap.put("nickname", nickname);
		memberMap.put("intro", intro);
		memberMap.put("id", "mina");
		mypageService.mypageintro(memberMap);

		ModelAndView mav = new ModelAndView();
		mav.addObject("memberMap", memberMap);
		mav.setViewName("/mypage/mypageProfileModForm");
		return mav;

	}

	// 민아 찜 (진행중 ...)
	@Override
	@RequestMapping(value = "/mypage/bookmarkList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView bookList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("여기는 Controller bookmarkList.do");
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		String viewName = (String) request.getAttribute("viewName");

		HttpSession session = request.getSession();
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
		System.out.println("memberInfo = " + memberInfo);
		List bookList = mypageService.selectBookList(memberInfo);

		System.out.println(bookList);
		ModelAndView mav = new ModelAndView();
		mav.addObject("bookList", bookList);
		mav.setViewName("/mypage/mypageBookmarkList");
		System.out.println(mav);
		return mav;
	}

	// 민아 찜 삭제하기(진행중 ...)
	@Override
	@RequestMapping(value = "/mypage/deleteBook.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView deleteBook(@RequestParam("id") String id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("여기는 Controller deleteBook.do");
		request.setCharacterEncoding("utf-8");
		mypageService.removeBookMark(id);
		ModelAndView mav = new ModelAndView("redirect:/mypage/bookmarkList.do");
		return mav;
	}

	// 민아 쿠폰, 적립금 조회
	@Override
	@RequestMapping(value = "/mypage/couponSearch.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView couponSearch(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("여기는 Controller couponSearch.do");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
		System.out.println("memberInfo = " + memberInfo);
		List<CouponVO> couponDetail = mypageService.couponSearch(memberInfo);
		System.out.println("couponDetail = " + couponDetail);
		ModelAndView mav = new ModelAndView();
		mav.addObject("couponDetail", couponDetail);
		mav.setViewName("/mypage/mypageCouponPoint");
		return mav;
	}

	// 민아 배송지관리 - 출력
	@Override
	@RequestMapping(value = "/mypage/myAddress.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView myAddress(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("여기는 Controller myAddress.do");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
		int MemberNo = memberInfo.getMemberNo();
		System.out.println("MemberNo = " + MemberNo);
		List<DeliveryAddressVO> myAddress = mypageService.myAddress(MemberNo);
		ModelAndView mav = new ModelAndView();
		mav.addObject("myAddress", myAddress);
		mav.setViewName("/mypage/mypageAddress");
		return mav;
	}

	@RequestMapping(value = "/mypage/*Form.do", method = { RequestMethod.GET, RequestMethod.POST })
	private ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("*Form.do");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	// 민아 회원정보수정1
	@Override
	@RequestMapping(value = "/mypage/mypageMemberMod.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView mypageMemberMod(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("여기는 Controller myAddress.do");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
		String id = memberInfo.getId();
		ModelAndView mav = new ModelAndView();
		mav.addObject("id", id);
		mav.setViewName("/mypage/mypageMemberModForm");
		return mav;
	}
	
	// 민아 회원정보수정1
		@Override
		@RequestMapping(value = "/mypage/mypageMemberModInfo.do", method = { RequestMethod.GET, RequestMethod.POST })
		public ModelAndView mypageMemberModInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
			System.out.println("여기는 Controller myAddress.do");
			request.setCharacterEncoding("utf-8");
			HttpSession session = request.getSession();
			MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
			String inputPwd = request.getParameter("inputPwd");
			ModelAndView mav = new ModelAndView();
			System.out.println(inputPwd +", "+memberInfo.getPwd());
			if (memberInfo.getPwd().equals(inputPwd)) {
				mav.addObject("memberInfo", memberInfo);
				mav.setViewName("/mypage/mypageMemberInfoModForm");
			}else{
				mav = Alert.alertAndRedirect("비밀번호가 틀립니다. 다시 시도해 주세요", request.getContextPath()+"/member/mypageMemberMod.do");
			}
			
			return mav;
		}

}
