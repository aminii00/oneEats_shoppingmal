package com.example.demo.mypage.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("mypageDAO")
public interface MypageDAO {
	public List selectOrderList() throws DataAccessException;
}
