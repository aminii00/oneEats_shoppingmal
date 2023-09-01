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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.common.alert.Alert;
import com.example.demo.common.api.toss.dto.TossDTO;
import com.example.demo.common.file.GeneralFileUploader;
import com.example.demo.mypage.service.MypageService;
import com.example.demo.vo.CouponVO;
import com.example.demo.vo.DeliveryAddressVO;
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
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("memberInfo");
		int memberNo = member.getMemberNo();
		String viewName = (String) request.getAttribute("viewName");

		List<OrderVO> orderList = mypageService.selectOrderByMemberNo(memberNo);
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
	public ModelAndView orderConfirm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("여기는 orderConfirm");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();

		MemberVO member = (MemberVO) session.getAttribute("memberInfo");
		if (member == null || member.getId().length() < 1) {
			mav = Alert.alertAndRedirect("로그인이 필요한 페이지입니다.", request.getContextPath() + "/member/loginForm.do");
			return mav;
		}

		try {
			int memberNo = member.getMemberNo();
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

			mav.setViewName(viewName);
			mav.addObject("payment_price", payment_price);
			mav.addObject("shippingFee", shippingFee);
			mav.addObject("discount_price", discount_price);
			mav.addObject("selectGoodsList", selectGoodsList);
			mav.addObject("couponList", couponList);
			session.setAttribute("selectGoodsList", selectGoodsList);
		} catch (Exception e) {
			e.printStackTrace();
			String previousPage = request.getHeader("Referer");
			mav = Alert.alertAndRedirect("주문 정보를 받아오지 못 했습니다.", previousPage);
		}

		return mav;
	}

	@Override
	@RequestMapping(value = "/mypage/newOrder.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView newOrder(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("여기는 newOrder");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("memberInfo");
		ModelAndView mav = new ModelAndView();

		try {
			Map payInfoMap = new HashMap();
			int memberNo = member.getMemberNo();
			int orderNo = (int) session.getAttribute("tempOrderNo");
			TossDTO tossInfo = (TossDTO) session.getAttribute("tossInfo");
			String payment_type = tossInfo.getPaymentType();
			long totalAmount = tossInfo.getTotalAmount();
			payInfoMap.put("memberNo", memberNo);
			payInfoMap.put("orderNo", orderNo);
			payInfoMap.put("payment_type", payment_type);
			payInfoMap.put("total_price", totalAmount);
			
			mypageService.updateTempOrderList(payInfoMap);
			mav = new ModelAndView("redirect:/mypage/orderList.do");
			session.removeAttribute("cartList");
			session.removeAttribute("selectGoodsList");
			session.removeAttribute("tempOrderNo");
		} catch (Exception e) {
			e.printStackTrace();
			mav = Alert.alertAndRedirect("오류가 발생하였습니다.", "redirect:/mypage/orderConfirm.do");
		}

		return mav;
	}

	@RequestMapping(value = "/mypage/orderCancel.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView orderCancel(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("여기는 orderCancel");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String viewName = (String) request.getAttribute("viewName");

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

	@RequestMapping(value = "/mypage/orderCancelResult.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView orderCancelResult(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("여기는 orderCancelResult");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("memberInfo");
		int memberNo = member.getMemberNo();
		String viewName = (String) request.getAttribute("viewName");
		int orderNo = (Integer.parseInt(request.getParameter("orderNo")));
		String delivery_status = request.getParameter("delivery_status");

		int[] order_seqNos = mypageService.selectSeqNoByOrderNo(orderNo);
		for (int order_seqNo : order_seqNos) {
			mypageService.updateDeliveryStatusToCancel(order_seqNo);
		}

		int firstOrderSeqNo = order_seqNos.length > 0 ? order_seqNos[0] : 0;
		mypageService.updateDeliveryStatusToCancel(firstOrderSeqNo);

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
		String member_id = memberVO.getId();
		// String member_id=memberVO.getId();
		MemberVO myList = mypageService.listMyPage(member_id);
		System.out.println("myList = " + myList);
		mav.addObject("myList", myList);
		mav.setViewName("/mypage/mypageProfileModForm");
		return mav;
	}

	// 민아 프로필편집 2
	@Override
	@RequestMapping(value = "/mypage/mypageintro.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView mypageintro(MultipartHttpServletRequest request) throws Exception {
		System.out.println("여기는 mypageintro.do");
		String nickname = request.getParameter("nickname");
		String intro = request.getParameter("intro");
		System.out.println(intro);
		HttpSession session = request.getSession();
		session = request.getSession();
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
		int memberNo = memberInfo.getMemberNo();
		String id = memberInfo.getId();
		List fileList = GeneralFileUploader.upload(request, "/member/" + memberNo);
		String profileImg = (String) fileList.get(0);
		System.out.println("fileList : " + fileList);
		System.out.println("profileImg : " + profileImg);

		HashMap<String, String> memberMap = new HashMap<String, String>();
		memberMap.put("profileImg", profileImg);
		memberMap.put("nickname", nickname);
		memberMap.put("intro", intro);
		memberMap.put("id", id);
		System.out.println("memberMap = " + memberMap);
		mypageService.mypageintro(memberMap);

		ModelAndView mav = new ModelAndView();
		mav.addObject("memberMap", memberMap);
		mav = Alert.alertAndRedirect("저장되었습니다.", request.getContextPath() + "/mypage/myPageMain.do");
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
	public ModelAndView deleteBook(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("여기는 Controller deleteBook.do");
		request.setCharacterEncoding("utf-8");
		String goodsNo_ = request.getParameter("goodsNo");
		int goodsNo = Integer.parseInt(goodsNo_);
		mypageService.removeBookMark(goodsNo);
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

	@RequestMapping(value = "/mypage/couponNum.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView couponNum(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("여기는 Controller couponNum.do");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
		int memberNo = memberInfo.getMemberNo();

		String couponNo_ = request.getParameter("couponNo");
		if (couponNo_.isEmpty()) {
			mav = Alert.alertAndRedirect("쿠폰번호를 입력해주세요.", request.getContextPath() + "/mypage/couponSearch.do");
			return mav;
		}
		int couponNo = Integer.parseInt(couponNo_);
		System.out.println("couponNo = " + couponNo);
		CouponVO couponVO = mypageService.couponNum(couponNo);
		System.out.println("couponVO = " + couponVO);
		if (couponVO == null) {
			mav = Alert.alertAndRedirect("쿠폰이 존재하지 않습니다.", request.getContextPath() + "/mypage/couponSearch.do");
			return mav;
		}
		couponVO.setMemberNo(memberNo);
		CouponVO couponNull = mypageService.couponNull(couponVO);
		if (couponNull != null) {
			mav = Alert.alertAndRedirect("이미 등록 되어있는 쿠폰입니다.", request.getContextPath() + "/mypage/couponSearch.do");
			return mav;
		}
		mypageService.couponInsert(couponVO);

		mav = Alert.alertAndRedirect("등록되었습니다.", request.getContextPath() + "/mypage/couponSearch.do");
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
		System.out.println("myaddress = " + myAddress);
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
		System.out.println(inputPwd + ", " + memberInfo.getPwd());
		if (memberInfo.getPwd().equals(inputPwd)) {
			mav.addObject("memberInfo", memberInfo);
			mav.setViewName("/mypage/mypageMemberInfoModForm");
		} else {
			mav = Alert.alertAndRedirect("비밀번호가 틀립니다. 다시 시도해 주세요",
					request.getContextPath() + "/member/mypageMemberMod.do");
		}

		return mav;
	}

	// 민아 회원정보 수정2
	@RequestMapping(value = "/mypage/memberInfoMod.do", method = RequestMethod.POST)
	public ModelAndView memberInfoMod(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("memberVO") MemberVO memberVO) throws Exception {
		System.out.println("memberInfoMod Controller");
		ModelAndView mav = new ModelAndView();
		String sms_agreement = request.getParameter("sms_agreement");
		String email_agreement = request.getParameter("email_agreement");
		String birth = request.getParameter("birth");

		if (email_agreement == null || email_agreement.trim().length() < 1) {
			memberVO.setEmail_agreement("no");
		}
		if (sms_agreement == null || sms_agreement.trim().length() < 1) {
			memberVO.setSms_agreement("no");
		}
		if (birth == null || birth.trim().length() < 1) {
			memberVO.setBirth(null);
		}
		mypageService.updateMember(memberVO);
		mav = Alert.alertAndRedirect("수정이 완료되었습니다.", request.getContextPath() + "/mypage/mypageMemberMod.do");
		return mav;
	}

	// 민아 리뷰
	@RequestMapping(value = "/mypage/mypageReviewList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView mypageReview(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("여기는 mypageReview Controller");
		// 리뷰를 들어가면 1.작성가능리뷰 2.작성한 리뷰 리스트들이 출력 됨.
		HttpSession session = request.getSession();
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
		int memberNo = memberInfo.getMemberNo();
		// 1. 작성가능 리뷰 가져오기 (배송완료인 상품들)
		List<OrderVO> reviewList = mypageService.reviewList(memberNo);
		System.out.println("reviewList = " + reviewList);
		// 2. 작성완료 리뷰 가져오기 (리뷰작성완료인 상품들)
		List<OrderVO> writeReview = mypageService.writeReview(memberNo);
		System.out.println("writeReview = " + writeReview);
		ModelAndView mav = new ModelAndView();
		mav.addObject("reviewList", reviewList);
		mav.addObject("writeReview", writeReview);
		mav.setViewName("/mypage/mypageReview");
		return mav;
	}

	// ajax로 주문자 정보나 사용한 쿠폰 id를 db에 저장해놓기 위한 코드
	@ResponseBody
	@PostMapping(value = "/storeOrderInfo.do")
	public String storeOrderInfo(HttpServletRequest request) {
		String result = "";
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("memberInfo");
		int orderNo = mypageService.selectNewOrderNo();
		try {
			int memberNo = member.getMemberNo();
			String orderer_name = request.getParameter("orderer_name");
			String orderer_phone = request.getParameter("orderer_phone");
			String receiver_name = request.getParameter("receiver_name");
			String receiver_address = request.getParameter("receiver_address");
			String receiver_addressDetail = request.getParameter("receiver_addressDetail");
			String receiver_phone = request.getParameter("receiver_phone");
			String receiver_comment = request.getParameter("receiver_comment");
			String used_point = request.getParameter("used_point");
			String used_couponId = request.getParameter("used_couponId");
			String point_price = request.getParameter("point_price");
			String total_price = request.getParameter("total_price");

			List<OrderVO> selectGoodsList = (List<OrderVO>) session.getAttribute("selectGoodsList");
			List<OrderVO> orderList = new ArrayList();
			System.out.println("selectGoodsList" + selectGoodsList);
			for (int i = 0; i < selectGoodsList.size(); i++) {
				OrderVO temp = selectGoodsList.get(i);
				temp.setOrderNo(orderNo);
				temp.setOrderer_name(orderer_name);
				temp.setOrderer_phone(orderer_phone);
				temp.setReceiver_name(receiver_name);
				temp.setReceiver_address(receiver_address + "&nbsp" + receiver_addressDetail);
				temp.setReceiver_phone(receiver_phone);
				temp.setReceiver_comment(receiver_comment);
				temp.setUsed_point(Integer.parseInt(used_point));
				temp.setUsed_couponId(Integer.parseInt(used_couponId));
				temp.setPoint_price(Integer.parseInt(point_price));
				temp.setTotal_price(Integer.parseInt(total_price));
				temp.setMemberNo(memberNo);

				orderList.add(temp);
			}
			// 일단 데이터베이스에 저장해뒀다가 결제가 완료되면 다시 끌고 옴
			mypageService.insertTempOrderList(orderList);
			session.setAttribute("tempOrderNo", orderNo);
			result = "success";

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;

	}

}
