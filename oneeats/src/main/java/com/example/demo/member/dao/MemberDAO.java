package com.example.demo.member.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.example.demo.vo.MemberVO;

@Mapper
@Repository("memberDAO")
public interface MemberDAO {

	public void registerMemberInfo(HashMap memberMap) throws DataAccessException;
	
	public void insertNewMember(MemberVO memberVO) throws DataAccessException;
	
	public int insertMemberNo() throws DataAccessException;
	
	public MemberVO login(MemberVO memberVO) throws DataAccessException;
	
	public String idSearch(MemberVO memberVO) throws DataAccessException;
}
