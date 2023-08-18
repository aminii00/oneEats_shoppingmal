package com.example.demo.mypage.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

public interface MypageService {
	public List selectOrderList() throws DataAccessException;

}
