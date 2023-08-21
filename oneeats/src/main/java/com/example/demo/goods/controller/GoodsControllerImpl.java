package com.example.demo.goods.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

@RequestMapping(value= "/goods/*.do" ,method={RequestMethod.POST,RequestMethod.GET})
public ModelAndView goodsList(HttpServletRequest request, HttpServletResponse response) throws Exception{
	HttpSession session;
//jsp이름따라서 만들기 위해서
	ModelAndView mav=new ModelAndView();
	String viewName=(String)request.getAttribute("viewName");
	mav.setViewName(viewName);

	List<GoodsVO> goodsList = goodsService.selectAllGoodsList();
	for(GoodsVO i : goodsList ) {
	}
	mav.addObject("goodsList", goodsList);
	
	GoodsVO item = goodsService.selectNumGoodsList();
	mav.addObject("item", item);
	return mav;
}



@RequestMapping(value= "/goods/goodsDetail.do" ,method={RequestMethod.POST,RequestMethod.GET})
public ModelAndView goods(
	      RedirectAttributes rAttr, HttpServletRequest request,
	      HttpServletResponse response) throws Exception{
	HttpSession session;
	// mapper에 값 비교 위해서
	String goodsNo1 = request.getParameter("goodsNo");
	System.out.println(goodsNo1);
	int goodsNo =  Integer.parseInt(goodsNo1);
	System.out.println(goodsNo);
	List<GoodsVO> goods = (List<GoodsVO>) goodsService.goodsDetail(goodsNo);
	ModelAndView mav=new ModelAndView();
	

	mav.addObject("goods", goods);
	mav.setViewName("/goods/goodsDetail");
	return mav;
}



}

