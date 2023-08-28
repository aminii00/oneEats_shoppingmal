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
public class MypageServiceImpl implements MypageService{
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
	public List<OrderVO> selectOrderByOrderNo(int orderNo) throws Exception{
		return mypageDAO.selectOrderByOrderNo(orderNo);
	}
	
	@Override
	public List<CouponVO> selectCouponByMemberNo(int memberNo) throws Exception{
		return mypageDAO.selectCouponByMemberNo(memberNo);
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

	@Override
	public MemberVO listMyPage(String member_id) throws Exception {
		System.out.println("listMyPageService");
		return mypageDAO.selectMypageList(member_id);
	}
	
	//민아 프로필편집
	@Override
	public void mypageintro(HashMap memberMap) {
		System.out.println("mypageintroService");
		 mypageDAO.mypageintroupdate(memberMap);

	}
	
	//민아 찜
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
	public List<CouponVO> couponSearch(MemberVO memberInfo) throws DataAccessException{
		List<CouponVO> couponVO = mypageDAO.couponSearch(memberInfo);
		return couponVO;
	}
	
	@Override
	public List<DeliveryAddressVO> myAddress(int memberNo) throws DataAccessException{
		List<DeliveryAddressVO> myAddressVO = mypageDAO.myAddress(memberNo);
		return myAddressVO;
	}
	
	//민아 회원정보 수정2
	@Override
	public void updateMember(MemberVO memberVO) throws DataAccessException{
		mypageDAO.updateMemberInfo(memberVO);
	}

	//민아 회원정보 수정2
		@Override
		public List<ReviewVO> reviewList(int memberNo) throws DataAccessException{
			List<ReviewVO> reviewList = mypageDAO.reviewList(memberNo);
			return reviewList;
		}
	
}
