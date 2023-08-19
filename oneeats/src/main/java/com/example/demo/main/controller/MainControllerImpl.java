package com.example.demo.main.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.common.file.FileDownloadController;

import com.example.demo.main.service.MainService;
import com.example.demo.vo.GoodsVO;

@Controller("mainController")
public class MainControllerImpl implements MainController{
	@Autowired
	private MainService mainService;
	
	@Autowired
	private GoodsVO goodsVo;

	@RequestMapping(value= "/main/mainPage.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);

	//	String hobby = "900";
//		mav.addObject("price", hobby);
//		List<String> apple = new ArrayList();
//		
//		apple.add("과일");
//		apple.add("바나나");
//		apple.add("망고");
//		mav.addObject("apple", apple);
//		System.out.println(apple);
		/*
		 * System.out.println(); for (int i = 0; i <apple.size() ; i++) {
		 * System.out.println(apple.get(i)); }
		 */
		
		
//		for(String i : apple ) {
//			System.out.println(i);
//		}
//		

//		
//		GoodsVO testgoods = new GoodsVO();
//		testgoods.name ="맛잇는 호박";
//		mav.addObject("product", testgoods);
//		System.out.println(testgoods);
//		System.out.println(testgoods.name);
//		
		List<GoodsVO> goodsList = mainService.selectAllGoodsList();
		for(GoodsVO i : goodsList ) {
			System.out.println(i.name);
		}
		mav.addObject("goodsList", goodsList);
		
		List<GoodsVO> newGoodsList = mainService.orderByNew();
		for(GoodsVO i : newGoodsList ) {
		}
		mav.addObject("newGoodsList", newGoodsList);
//		session=request.getSession();
//
//		Map<String,List<GoodsVO>> MainList=mainService.listGoods();
//		mav.addObject("MainList", MainList);
//		

		return mav;
	}
}
