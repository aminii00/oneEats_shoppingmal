package com.example.demo.mypage.service;

import java.util.HashMap;
import java.util.List;

import com.example.demo.vo.MemberVO;

public interface MypageService {
	public MemberVO listMyPage(String member_id) throws Exception;

	public void mypageintro(HashMap<String, String> memberMap);
}
