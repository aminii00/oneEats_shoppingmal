package com.example.demo.mypage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.example.demo.vo.CouponVO;
import com.example.demo.vo.DeliveryAddressVO;
import com.example.demo.vo.MemberVO;
import com.example.demo.vo.OrderVO;
import com.example.demo.vo.PointHistoryVO;
import com.example.demo.vo.ReviewVO;
public interface MypageService {
	
	public void deleteMember(MemberVO member);
	
	public List<OrderVO> selectOrderList() throws DataAccessException;
	
	public List<OrderVO> selectOrderByMemberNo(int memberNo);
	
	public List<OrderVO> selectOrderByOrderNo(int orderNo) throws Exception;
	
	public List<CouponVO> selectCouponByMemberNo(int memberNo) throws Exception;
	
	public void insertOrderList(List<OrderVO> orderList);
	
	public int selectNewOrderNo();
	
	public int[] selectSeqNoByOrderNo(int orderNo);

	public void updateDeliveryStatusToCancel(int order_seqNo);
	
	public List<Map> selectOrderBySearchType(Map<String, Object> map);
	
	public MemberVO listMyPage(String member_id) throws Exception;
	
	public void mypageintro(HashMap<String, String> memberMap);
	
	public List selectBookList(MemberVO memberInfo) throws DataAccessException;
	
	public int removeBookMark(int goodsNo) throws DataAccessException;
	
	public List<CouponVO> couponSearch(MemberVO memberInfo) throws DataAccessException;
	public List<PointHistoryVO> pointSearch(MemberVO memberInfo) throws DataAccessException;

	public List<DeliveryAddressVO> myAddress(int memberNo) throws DataAccessException;
	
	public void deleteAddress(int deliveryNo);
	
	public void updateMember(MemberVO memberVO) throws DataAccessException;
	
	public List<OrderVO> reviewList(int memberNo) throws DataAccessException;
	
	public List<OrderVO> writeReview(int memberNo) throws DataAccessException;
	
	public CouponVO couponNum(String couponCode);
	
	public CouponVO couponNull(CouponVO result);
	
	public void couponInsert(CouponVO result);

	public void insertTempOrderList(List<OrderVO> orderList);

	public void updateTempOrderList(Map payInfoMap);

	public void insertAddressWithMap(Map condMap);

	public void updateDeliveryAddressWithMap(Map condMap);

	public void swapDeliveryAddress(Map condMap, DeliveryAddressVO targetDeliveryAddress);

	public void updateMemberAddressWithMap(Map condMap);

	public void deleteDeliveryAddressWithMap(Map condMap);
	
}
