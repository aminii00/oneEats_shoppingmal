package com.example.demo.mypage.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.example.demo.vo.CouponVO;
import com.example.demo.vo.MemberVO;
import com.example.demo.vo.OrderVO;

@Mapper
@Repository("mypageDAO")
public interface MypageDAO {
	//민지 주문내역
	public List<OrderVO> selectOrderList() throws DataAccessException;
	
	//민지 주문상세(orderNo 기준)
	public List<OrderVO> selectOrderByOrderNo(int orderNo) throws DataAccessException;
	
	//민지 주문하기
	public void insertOrderList(List<OrderVO> orderList);
	
	//민지 쿠폰목록(memberNo 기준)
	public List<CouponVO> selectCouponByMemberNo(int memberNo) throws DataAccessException;
	
	public MemberVO selectMypageList(String member_id) throws DataAccessException;
	
	//민아 프로필 편집
	public void mypageintroupdate(HashMap memberMap) throws DataAccessException;
	
	//민아 찜
	public List selectBookList(MemberVO memberInfo) throws DataAccessException;
	
	//민아 찜 삭제
	public int deleteBookMark(String id) throws DataAccessException;
	
	//민아 쿠폰
	public List<CouponVO> couponSearch(MemberVO memberInfo) throws DataAccessException;
}
