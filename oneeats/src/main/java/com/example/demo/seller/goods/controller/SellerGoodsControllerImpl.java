package com.example.demo.seller.goods.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.common.file.GeneralFileUploader;
import com.example.demo.seller.goods.service.SellerGoodsService;
import com.example.demo.vo.MemberVO;
import com.example.demo.vo.OptionVO;

@Controller("sellerGoodsController")
public class SellerGoodsControllerImpl implements SellerGoodsController{
	private static final String ARTICLE_IMAGE_REPO = "C:\\board\\article_image";
	@Autowired
	private SellerGoodsService sellerGoodsService;
	
	@RequestMapping(value = "/seller/goods/sellerGoodsForm.do")
	public ModelAndView sellerGoodsForm(HttpServletRequest request) {
		String viewName =  (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		System.out.println(mav);
		return mav;
	}
	
	@RequestMapping(value = "/seller/goods/sellerGoodsList.do")
	public ModelAndView sellerGoodsList(HttpServletRequest request) {
		String viewName =  (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		System.out.println(mav);
		return mav;
	}
	
	@RequestMapping(value = "/seller/goods/sellerModForm.do")
	public ModelAndView sellerModForm(HttpServletRequest request) {
		String viewName =  (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		System.out.println(mav);
		return mav;
	}
	
	
//	@Override
//	@RequestMapping(value="/seller/goods/sellerGoodsForm.do" ,method = RequestMethod.POST)
//	@ResponseBody
//
//	public ResponseEntity addGoods(MultipartHttpServletRequest multipartRequest, 
//			HttpServletResponse response) throws Exception {
//		multipartRequest.setCharacterEncoding("utf-8");
//		response.setContentType("html/text;charset=utf-8");
//		Map<String,Object> goodsMap = new HashMap<String, Object>();
//		Map<String,Object> optionMap = new HashMap<String, Object>();
//		Enumeration enu=multipartRequest.getParameterNames();
//		while(enu.hasMoreElements()){
//			String name=(String)enu.nextElement();
//			String value=multipartRequest.getParameter(name);
//			goodsMap.put(name,value);
//			
//		}
//
//		String img= upload(multipartRequest);
//
//		goodsMap.put("img",img);
//		String goodsNo = (String)goodsMap.get("goodsNo");
//		
//		System.out.println("goodsMap"+goodsMap);
//		String message;
//		ResponseEntity resEnt=null;
//		HttpHeaders responseHeaders = new HttpHeaders();
//		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
//		try {
//	
//			sellerGoodsService.addGoods(goodsMap);
//			sellerGoodsService.addOption(goodsMap);
//
//			
//			if(img!=null && img.length()!=0) {
//				File srcFile = new File(ARTICLE_IMAGE_REPO+ "\\" + "temp"+ "\\" + img);
//				File destDir = new File(ARTICLE_IMAGE_REPO+"\\"+goodsNo);
//				FileUtils.moveFileToDirectory(srcFile, destDir,true);
//			}
//			message = "<script>";
//			message += " alert('상품을 등록하였습니다.');";
//			message += " location.href='"+multipartRequest.getContextPath()+"/goods/goodsDetail.do'; ";
//			message +=" </script>";
//		    resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
//		}catch(Exception e) {
//			File srcFile = new File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+img);
//			srcFile.delete();
//			
//			message = " <script>";
//			message +=" alert('오류가 발생했습니다. 다시 시도해 주세요'`);');";
//			message +=" location.href='"+multipartRequest.getContextPath()+"/seller/goods/sellerGoodsForm.do'; ";
//			message +=" </script>";
//			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
//			e.printStackTrace();
//		}
//		return resEnt;
//	}
//
//	private String upload(MultipartHttpServletRequest multipartRequest) throws Exception{
//		String img= null;
//		Iterator<String> fileNames = multipartRequest.getFileNames();
//		
//		while(fileNames.hasNext()){
//			String fileName = fileNames.next();
//			MultipartFile mFile = multipartRequest.getFile(fileName);
//			img=mFile.getOriginalFilename();
//			File file = new File(ARTICLE_IMAGE_REPO +"\\"+"temp"+"\\" + fileName);
//			if(mFile.getSize()!=0){ //File Null Check
//				if(!file.exists()){ //경로상에 파일이 존재하지 않을 경우
//					file.getParentFile().mkdirs();  //경로에 해당하는 디렉토리들을 생성
//					mFile.transferTo(new File(ARTICLE_IMAGE_REPO +"\\"+"temp"+ "\\"+img)); //임시로 저장된 multipartFile을 실제 파일로 전송
//				}
//			}
//			
//		}
//		return img;
//	}
	@RequestMapping(value = "/seller/goods/addSellerGoods.do", method = RequestMethod.POST)
	public ModelAndView addGoods(MultipartHttpServletRequest request) throws IOException {
		request.setCharacterEncoding("utf-8");
		int newGoodsNo = sellerGoodsService.selectNewGoodsNo();
		System.out.println("newGoodsNo = " +newGoodsNo);
		/*
		 * List fileList = GeneralFileUploader.upload(request, "/goods/" + newGoodsNo);
		 * System.out.println("fileList : " + fileList);
		 */
	    // map에 goods 정보를 저장
	    Map map = GeneralFileUploader.getParameterMap(request);
	    map.put("goodsNo", newGoodsNo);
//	    map.put("Img1", fileList.get(0));

	    // 세션에서 로그인한 유저 정보를 불러와 map에 저장
	    HttpSession session = request.getSession();
	    MemberVO memberVO = (MemberVO) session.getAttribute("loginUser");
	    if (memberVO == null) {
	        map.put("memberNo", 1);
	    } else {
	        map.put("memberNo", memberVO.getMemberNo());
	    }
		System.out.println(map.get("memberNo"));
	    // 옵션정보 가져와서 OptionList에 저장
	    String[] optionNames = request.getParameterValues("option_name"); // 당근당근 optionXX
	  
	    String[] optionQtys = request.getParameterValues("option_qty");
	    String[] optionPrice = request.getParameterValues("option_price");
	   
	   //여기 
	    
	    List<OptionVO> optionList = new ArrayList<OptionVO>();
	    for (int i = 0; i < optionQtys.length; i++) {
	    	OptionVO optionVO = new OptionVO(newGoodsNo, optionNames[i], optionQtys[i], optionPrice[i]);
	    	optionList.add(optionVO);
	    }
	    System.out.println("optionList : " + optionList);

	    System.out.println(map);
	     	
	     	//여기 

	    // addGoods
	    boolean result = sellerGoodsService.addGoods(map, optionList);

	    ModelAndView mav = new ModelAndView();

	    // 등록 성공했을 경우 해당 상품 상세 페이지로. 실패했을 경우 폼에.
	    if (result) {
	        System.out.println("상품 등록 성공");
	        mav.addObject("redirectMessage", "상품을 등록했습니다.");
	        mav.addObject("redirectPage",
	                request.getContextPath() + "/goods/goodsDetail.do?goodsNo=" + newGoodsNo);
	        mav.setViewName("/alert");
	    } else {
	        System.out.println("상품 등록 실패");
	        mav.addObject("redirectMessage", "상품 등록에 실패했습니다.");
	        mav.addObject("redirectPage", request.getContextPath() + "/seller/goods/sellerGoodsForm.do");
	        mav.setViewName("/alert");
	    }

	    return mav;
	}


}
	

	
