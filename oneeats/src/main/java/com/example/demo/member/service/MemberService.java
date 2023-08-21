package com.example.demo.member.service;

import java.util.HashMap;

import org.springframework.dao.DataAccessException;

import com.example.demo.vo.MemberVO;

public interface MemberService {
	public void registerInfo(MemberVO memberVO) throws Exception;
	public int registerInfoNo() throws Exception;
	public MemberVO login(MemberVO memberVO) throws DataAccessException;
	public String idSearch(MemberVO memberVO) throws Exception;
}
