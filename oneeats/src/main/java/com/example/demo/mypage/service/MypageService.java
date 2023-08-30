package com.example.demo.mypage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.example.demo.vo.CouponVO;
import com.example.demo.vo.DeliveryAddressVO;
import com.example.demo.vo.MemberVO;
import com.example.demo.vo.OrderVO;
import com.example.demo.vo.ReviewVO;
public interface MypageService {
	public List<OrderVO> selectOrderList() throws DataAccessException;
	
	public List<OrderVO> selectOrderByMemberNo(int memberNo);
	
	public List<OrderVO> selectOrderByOrderNo(int orderNo) throws Exception;
	
	public List<CouponVO> selectCouponByMemberNo(int memberNo) throws Exception;
	
	public void insertOrderList(List<OrderVO> orderList);
	
	public int selectNewOrderNo();
	
	public int[] selectSeqNoByOrderNo(int orderNo);

	public void updateDeliveryStatusToCancel(int order_seqNo);
	
//	public List<OrderVO> selectOrderList(Map pagingMap);
//
//	public List<Map> countOrderNums();
	
	public MemberVO listMyPage(String member_id) throws Exception;
	
	public void mypageintro(HashMap<String, String> memberMap);
	
	public List selectBookList(MemberVO memberInfo) throws DataAccessException;
	
	public int removeBookMark(int goodsNo) throws DataAccessException;
	
	public List<CouponVO> couponSearch(MemberVO memberInfo) throws DataAccessException;

	public List<DeliveryAddressVO> myAddress(int memberNo) throws DataAccessException;
	
	public void updateMember(MemberVO memberVO) throws DataAccessException;
	
	public List<ReviewVO> reviewList(int memberNo) throws DataAccessException;
	
	public CouponVO couponNum(int couponNo);
	
	public void couponInsert(CouponVO result);
}
