package com.example.demo.mypage.controller;

import java.util.ArrayList;
import java.util.Date;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.common.alert.Alert;
import com.example.demo.common.file.GeneralFileUploader;
import com.example.demo.mypage.service.MypageService;
import com.example.demo.vo.CouponVO;
import com.example.demo.vo.DeliveryAddressVO;
import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.MemberVO;
import com.example.demo.vo.OrderVO;
import com.example.demo.vo.ReviewVO;

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
		
//		String category = request.getParameter("category");
//		String _section = request.getParameter("section");
//		String _pageNum = request.getParameter("pageNum");
//		String order_search_type = request.getParameter("order_search_type");
//		int pageNum;
//		int section;
//		if (_pageNum == null || _pageNum.length() <= 0) {
//			pageNum = 1;
//		} else {
//			pageNum = Integer.parseInt(_pageNum);
//		}
//		if (_section == null || _section.length() <= 0) {
//			section = 1;
//		} else {
//			section = Integer.parseInt(_section);
//		}
//		if (order_search_type !=null && order_search_type.length() < 1) {
//			order_search_type = "all";
//		}
//		Map pagingMap = GeneralFileUploader.getParameterMap(request);
//		pagingMap.put("category", category);
//		pagingMap.put("section", section);
//		pagingMap.put("order_search_type", order_search_type);
//		pagingMap.put("start", ((section-1) * 10 + pageNum - 1) * 10);
//	
//		List<OrderVO> orderList = mypageService.selectOrderList(pagingMap);
		List<OrderVO> orderList = mypageService.selectOrderByMemberNo(memberNo);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("orderList", orderList);
//		mav.addAllObjects(pagingMap);
//		
//		List<Map> resultMap = mypageService.countOrderNums();
//		long totalOrderNum = (long) resultMap.get(0).get("cnt");
//		long searchOrderNum = -1;
//		for (Map < String, Object> row : resultMap) {
//			String cate = (String) row.get("category");
//			long count = (long) row.get("cnt");
//			System.out.println("category=" + cate + ", count=" + count);
//			if (cate.equals(category)) {
//				searchOrderNum = count;
//			}
//		}
//		if (searchOrderNum < 0) {
//			searchOrderNum = totalOrderNum;
//		}
//		
//		mav.addObject("orderNumMap", resultMap);
//		mav.addObject("totalOrderNum", totalOrderNum);
//		mav.addObject("searchOrderNum", searchOrderNum);
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
		String receiver_addressDetail = request.getParameter("receiver_addressDetail");
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
			temp.setPayment_type(payment_type);
			temp.setMemberNo(memberNo);

			orderList.add(temp);
		}

		try {
			mypageService.insertOrderList(orderList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.removeAttribute("cartList");

		ModelAndView mav = new ModelAndView("redirect:/mypage/orderList.do");
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
		int couponNo = Integer.parseInt(couponNo_);
		System.out.println("couponNo = "+couponNo);
		CouponVO result;
		try {
			result = mypageService.couponNum(couponNo);
			System.out.println("result = " + result);
			
			
		}catch(Exception e){
			mav = Alert.alertAndRedirect("쿠폰이 존재하지 않습니다.", request.getContextPath() + "/mypage/couponSearch.do");
		}
		result = mypageService.couponNum(couponNo);
		System.out.println("result = " + result);
		result.setMemberNo(memberNo);
		mypageService.couponInsert(result);
		
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
		mav = Alert.alertAndRedirect("수정이 완료되었습니다.", request.getContextPath() + "/mypage/mypageMemberModForm.do");
		return mav;
	}

	// 민아 리뷰
	@RequestMapping(value = "/mypage/mypageReviewList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView mypageReview(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("여기는 mypageReview Controller");
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
		System.out.println("1");
		int memberNo = memberInfo.getMemberNo();
		System.out.println("2");
		List<ReviewVO> reviewList = mypageService.reviewList(memberNo);
		System.out.println("3");
		System.out.println("reviewList = " + reviewList);
		mav.addObject("reviewList", reviewList);
		mav.setViewName("/mypage/mypageReview");
		return mav;
	}

}
