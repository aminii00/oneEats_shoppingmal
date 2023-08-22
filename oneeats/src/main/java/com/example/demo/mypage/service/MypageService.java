package com.example.demo.mypage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.example.demo.vo.CouponVO;
import com.example.demo.vo.MemberVO;
import com.example.demo.vo.OrderVO;
public interface MypageService {
	public List<OrderVO> selectOrderList() throws DataAccessException;
	
	public List<OrderVO> selectOrderByOrderNo(int orderNo) throws Exception;
	
	public List<CouponVO> selectCouponByMemberNo(int memberNo) throws Exception;
	
	public void insertOrderList(List<OrderVO> orderList);
	
	public MemberVO listMyPage(String member_id) throws Exception;
	
	public void mypageintro(HashMap<String, String> memberMap);
	
	public List selectBookList() throws DataAccessException;
	
	public int removeBookMark(String id) throws DataAccessException;
}
