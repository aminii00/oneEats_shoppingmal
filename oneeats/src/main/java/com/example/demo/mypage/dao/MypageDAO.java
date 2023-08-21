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

import com.example.demo.vo.MemberVO;
import com.example.demo.vo.OrderVO;

@Mapper
@Repository("mypageDAO")
public interface MypageDAO {

	public List<OrderVO> selectOrderList() throws DataAccessException;
	public List<OrderVO> selectOrderByOrderNo(int orderNo) throws DataAccessException;
	public void insertOrderList(List<OrderVO> orderList);
	public MemberVO selectMypageList(String member_id) throws DataAccessException;
	
	
	//민아 프로필 편집
	public void mypageintroupdate(HashMap memberMap) throws DataAccessException;
	
	//민아 찜
	public List selectBookList() throws DataAccessException;
	
}
