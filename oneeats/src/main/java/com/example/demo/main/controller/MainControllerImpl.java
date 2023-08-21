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
import com.example.demo.vo.RecipeVO;



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
		
		List<GoodsVO> goodsList = mainService.selectAllGoodsList();
		for(GoodsVO i : goodsList ) {
		}
		mav.addObject("goodsList", goodsList);
		
		
		
		List<GoodsVO> newGoodsList = mainService.orderByNew();
		for(GoodsVO i : newGoodsList ) {
		}
		mav.addObject("newGoodsList", newGoodsList);
		
		
	
		List<RecipeVO> newRecipeList = mainService.selectAllRecipesList();
		for(RecipeVO i : newRecipeList ) {
		}
		mav.addObject("newRecipeList", newRecipeList);

		return mav;
	}

}
