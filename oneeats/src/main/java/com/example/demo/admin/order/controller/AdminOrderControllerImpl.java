package com.example.demo.admin.order.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.admin.order.service.AdminOrderService;
import com.example.demo.vo.MemberVO;
import com.example.demo.vo.OrderVO;

@Controller("adminOrderController")
public class AdminOrderControllerImpl implements AdminOrderController {
	@Autowired
	private AdminOrderService adminOrderService;
	
	@Override
	@RequestMapping(value = "/admin/order/adminOrderList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView adminOrderList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("여기는 adminOrderList");
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		HttpSession session = request.getSession();
		String viewName = (String) request.getAttribute("viewName");
			
		List<OrderVO> adminOrderList = adminOrderService.selectOrderList();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("adminOrderList", adminOrderList);
		System.out.println(mav);
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/admin/order/adminOrderCancel.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView adminOrderCancel(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("여기는 adminOrderCancel");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String viewName = (String)request.getAttribute("viewName");
		int orderNo = (Integer.parseInt(request.getParameter("orderNo")));
		String delivery_status = request.getParameter("delivery_status");

		int[] order_seqNos = adminOrderService.selectSeqNoByOrderNo(orderNo);
		for (int order_seqNo : order_seqNos) {
			adminOrderService.updateDeliveryStatusToCancel(order_seqNo);
		}
		
		
		  int firstOrderSeqNo = order_seqNos.length > 0 ? order_seqNos[0] : 0;
		  adminOrderService.updateDeliveryStatusToCancel(firstOrderSeqNo);
		 
		
		ModelAndView mav = new ModelAndView("redirect:/admin/order/adminOrderList.do");
		return mav;
	}
}
