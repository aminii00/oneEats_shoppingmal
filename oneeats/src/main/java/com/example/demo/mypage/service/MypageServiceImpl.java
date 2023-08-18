package com.example.demo.mypage.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mypage.dao.MypageDAO;
import com.example.demo.vo.MemberVO;

@Service("mypageService")
public class MypageServiceImpl implements MypageService{

	@Autowired
	private MypageDAO mypageDAO;
	
	@Override
	public MemberVO listMyPage(String member_id) throws Exception {
		System.out.println("listMyPageService");
		return mypageDAO.selectMypageList(member_id);
	}
	
	public void mypageintro(HashMap memberMap) {
		System.out.println("mypageintroService");
		 mypageDAO.mypageintroupdate(memberMap);
	}

}
