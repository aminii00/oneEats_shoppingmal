package com.example.demo.mypage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mypage.dao.MypageDAO;

@Service("mypageService")
public class MypageServiceImpl implements MypageService{

	@Autowired
	private MypageDAO mypageDAO;
}
