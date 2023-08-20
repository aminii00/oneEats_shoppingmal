package com.example.demo.goods.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.example.demo.goods.service.GoodsService;
import com.example.demo.vo.GoodsVO;

@Controller("goodsController")
public class GoodsControllerImpl implements GoodsController {
	@Autowired
	private GoodsService goodsService;

private void addGoodsInQuick(String goodsNo,GoodsVO goodsVO,HttpSession session){
	boolean already_existed=false;
	List<GoodsVO> quickGoodsList; //최근 본 상품 저장 ArrayList
	quickGoodsList=(ArrayList<GoodsVO>)session.getAttribute("quickGoodsList");
	
	if(quickGoodsList!=null){
		if(quickGoodsList.size() < 4){ //미리본 상품 리스트에 상품개수가 세개 이하인 경우
			for(int i=0; i<quickGoodsList.size();i++){
				GoodsVO _goodsBean=(GoodsVO)quickGoodsList.get(i);
				if(goodsNo.equals(_goodsBean.getGoodsNo())){
					already_existed=true;
					break;
				}
			}
			if(already_existed==false){
				quickGoodsList.add(goodsVO);
			}
		}
		
	}else{
		quickGoodsList =new ArrayList<GoodsVO>();
		quickGoodsList.add(goodsVO);
		
	}
	session.setAttribute("quickGoodsList",quickGoodsList);
	session.setAttribute("quickGoodsListNum", quickGoodsList.size());
}
}

