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
import com.example.demo.vo.MemberVO;
import com.example.demo.vo.OrderVO;

@Service("mypageService")
public class MypageServiceImpl implements MypageService{
	@Autowired
	private MypageDAO mypageDAO;

	@Override
	public List<OrderVO> selectOrderList() throws DataAccessException {
		return mypageDAO.selectOrderList();
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
	public List selectBookList() throws DataAccessException {
		System.out.println("selectBookList Service");
		List bookList = null;
		bookList = mypageDAO.selectBookList();
		return bookList;
	}
	
	@Override
	public int removeBookMark(String id) throws DataAccessException {
		return mypageDAO.deleteBookMark(id);
	}
	

}
