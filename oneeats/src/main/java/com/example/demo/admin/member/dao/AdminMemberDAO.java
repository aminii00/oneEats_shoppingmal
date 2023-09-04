package com.example.demo.admin.member.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.example.demo.vo.MemberVO;

@Mapper
@Repository("adminMemberDAO")
public interface AdminMemberDAO {
	
	public void insertNewMember(MemberVO memberVO) throws DataAccessException;
	
	public int insertMemberNo() throws DataAccessException;

}
