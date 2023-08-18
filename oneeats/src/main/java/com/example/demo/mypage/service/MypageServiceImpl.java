package com.example.demo.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.example.demo.mypage.dao.MypageDAO;

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

}
