package com.example.demo.member.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.example.demo.vo.MemberVO;

@Mapper
@Repository("memberDAO")
public interface MemberDAO {
	
	public MemberVO login(Map loginMap) throws DataAccessException;

	public void registerMemberInfo(HashMap memberMap) throws DataAccessException;
	
	public void insertNewMember(MemberVO memberVO) throws DataAccessException;
	
	public int insertMemberNo() throws DataAccessException;
	
	public String idSearch(MemberVO memberVO) throws DataAccessException;
	
	public void insertSellerNewMember(MemberVO memberVO) throws DataAccessException;
	
	public MemberVO pwSearch(MemberVO memberVO) throws DataAccessException;
	
	public int updatePw(MemberVO memberVO)  throws DataAccessException;
	
}
