package com.example.demo.mypage.service;

import java.util.HashMap;
import java.util.List;
import org.springframework.dao.DataAccessException;
import com.example.demo.vo.MemberVO;
public interface MypageService {
	public List selectOrderList() throws DataAccessException;

	public MemberVO listMyPage(String member_id) throws Exception;

	public void mypageintro(HashMap<String, String> memberMap);
	
	public List selectBookList() throws DataAccessException;
	

}
