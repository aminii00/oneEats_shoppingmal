package com.example.demo.seller.order.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.seller.order.service.SellerOrderService;
import com.example.demo.vo.OrderVO;

@Controller("sellerOrderController")
public class SellerOrderControllerImpl implements SellerOrderController{
	@Autowired
	private SellerOrderService sellerOrderService;

	@Override
	@RequestMapping(value = "/seller/order/sellerOrderList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView sellerOrderList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("여기는 sellerOrderList");
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		HttpSession session = request.getSession();
		String viewName = (String) request.getAttribute("viewName");
			
		List<OrderVO> sellerOrderList = sellerOrderService.selectOrderByMemberType();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("sellerOrderList", sellerOrderList);
		System.out.println(mav);
		return mav;
	}

	@Override
	@RequestMapping(value = "/seller/order/sellerOrderCancel.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView sellerOrderCancel(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("여기는 sellerOrderCancel");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String viewName = (String)request.getAttribute("viewName");
		int orderNo = (Integer.parseInt(request.getParameter("orderNo")));
		String delivery_status = request.getParameter("delivery_status");

		int[] order_seqNos = sellerOrderService.selectSeqNoByOrderNo(orderNo);
		for (int order_seqNo : order_seqNos) {
			sellerOrderService.updateDeliveryStatusToCancel(order_seqNo);
		}
		
		
		  int firstOrderSeqNo = order_seqNos.length > 0 ? order_seqNos[0] : 0;
		  sellerOrderService.updateDeliveryStatusToCancel(firstOrderSeqNo);
		 
		
		ModelAndView mav = new ModelAndView("redirect:/seller/order/sellerOrderList.do");
		return mav;
	}
	
	

}
