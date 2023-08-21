package com.example.demo.mypage.service;

import java.util.HashMap;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.example.demo.mypage.dao.MypageDAO;
import com.example.demo.vo.MemberVO;

@Service("mypageService")
public class MypageServiceImpl implements MypageService{

	@Autowired
	private MypageDAO mypageDAO;

	@Override
	public List selectOrderList() throws DataAccessException {
		List orderList = null;
		orderList = mypageDAO.selectOrderList();
		return orderList;

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
	

}
