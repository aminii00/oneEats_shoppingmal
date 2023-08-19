package com.example.demo.main.service;

import java.util.List;
import java.util.Map;

import com.example.demo.vo.GoodsVO;

public interface MainService {
	
	public Map<String,List<GoodsVO>> listGoods() throws Exception;

	public List<GoodsVO> selectAllGoodsList();

	public List<GoodsVO> orderByNew();
}
