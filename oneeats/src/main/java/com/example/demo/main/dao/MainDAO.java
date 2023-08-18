package com.example.demo.main.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.example.demo.vo.GoodsVO;

@Mapper
@Repository("mainDAO")
public interface MainDAO {
	public List<GoodsVO> selectGoodsList(String goodsStatus ) throws DataAccessException;

	public List<GoodsVO> selectAllGoodsList();
}
