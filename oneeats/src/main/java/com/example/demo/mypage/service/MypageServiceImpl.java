package com.example.demo.mypage.service;

import java.util.ArrayList;
import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.example.demo.mypage.dao.MypageDAO;
import com.example.demo.vo.CouponVO;
import com.example.demo.vo.DeliveryAddressVO;
import com.example.demo.vo.MemberVO;
import com.example.demo.vo.OrderVO;
import com.example.demo.vo.ReviewVO;

@Service("mypageService")
public class MypageServiceImpl implements MypageService {
	@Autowired
	private MypageDAO mypageDAO;

	@Override
	public List<OrderVO> selectOrderList() throws DataAccessException {
		return mypageDAO.selectOrderList();
	}

	@Override
	public List<OrderVO> selectOrderByMemberNo(int memberNo) {
		return mypageDAO.selectOrderByMemberNo(memberNo);
	}

	@Override
	public List<OrderVO> selectOrderByOrderNo(int orderNo) throws Exception {
		return mypageDAO.selectOrderByOrderNo(orderNo);
	}

	@Override
	public List<CouponVO> selectCouponByMemberNo(int memberNo) throws Exception {
		return mypageDAO.selectCouponByMemberNo(memberNo);
	}

	@Override
	public CouponVO couponNull(CouponVO result) {
		CouponVO couponNull = mypageDAO.couponNull(result);
		return couponNull;
	}

	@Override
	public void insertOrderList(List<OrderVO> orderList) {
		mypageDAO.insertOrderList(orderList);
	}

	@Override
	public int selectNewOrderNo() {
		return mypageDAO.selectNewOrderNo();
	}

	@Override
	public int[] selectSeqNoByOrderNo(int orderNo) {
		return mypageDAO.selectSeqNoByOrderNo(orderNo);
	}

	@Override
	public void updateDeliveryStatusToCancel(int order_seqNo) {
		mypageDAO.updateDeliveryStatusToCancel(order_seqNo);
	}

//	@Override
//	public List<OrderVO> selectOrderList(Map pagingMap) {
//		return mypageDAO.selectOrderList(pagingMap);
//	}
//
//	@Override
//	public List<Map> countOrderNums() {
//		return mypageDAO.countOrderNums();
//	}

	@Override
	public MemberVO listMyPage(String member_id) throws Exception {
		System.out.println("listMyPageService");
		return mypageDAO.selectMypageList(member_id);
	}

	// 민아 프로필편집
	@Override
	public void mypageintro(HashMap memberMap) {
		System.out.println("mypageintroService");
		mypageDAO.mypageintroupdate(memberMap);

	}

	// 민아 찜
	@Override
	public List selectBookList(MemberVO memberInfo) throws DataAccessException {
		System.out.println("selectBookList Service");
		List bookList = null;
		bookList = mypageDAO.selectBookList(memberInfo);
		return bookList;
	}

	@Override
	public int removeBookMark(int goodsNo) throws DataAccessException {
		return mypageDAO.deleteBookMark(goodsNo);
	}

	@Override
	public List<CouponVO> couponSearch(MemberVO memberInfo) throws DataAccessException {
		List<CouponVO> couponVO = mypageDAO.couponSearch(memberInfo);
		return couponVO;
	}

	@Override
	public CouponVO couponNum(int couponNo) {
		CouponVO result = mypageDAO.couponNum(couponNo);
		return result;
	}

	@Override
	public void couponInsert(CouponVO result) {
		mypageDAO.couponInsert(result);
	}

	@Override
	public List<DeliveryAddressVO> myAddress(int memberNo) throws DataAccessException {
		List<DeliveryAddressVO> myAddressVO = mypageDAO.myAddress(memberNo);
		return myAddressVO;
	}

	// 민아 회원정보 수정2
	@Override
	public void updateMember(MemberVO memberVO) throws DataAccessException {
		mypageDAO.updateMemberInfo(memberVO);
	}

	// 민아 리뷰1
	@Override
	public List<OrderVO> reviewList(int memberNo) throws DataAccessException {
		List<OrderVO> reviewList = mypageDAO.reviewList(memberNo);
		return reviewList;
	}
	// 민아 리뷰2
		@Override
	public List<OrderVO> writeReview(int memberNo) throws DataAccessException{
			List<OrderVO> writeReview = mypageDAO.writeReview(memberNo);
			return writeReview;
		
	}



}
