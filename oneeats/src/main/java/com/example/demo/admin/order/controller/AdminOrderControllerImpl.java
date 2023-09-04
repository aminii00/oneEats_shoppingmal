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
		
//		String category = request.getParameter("category");
//		String _section = request.getParameter("section");
//		String _pageNum = request.getParameter("pageNum");
//		String order_search_type = request.getParameter("order_search_type");
//		int pageNum;
//		int section;
//		if (_pageNum == null || _pageNum.length() <= 0) {
//			pageNum = 1;
//		} else {
//			pageNum = Integer.parseInt(_pageNum);
//		}
//		if (_section == null || _section.length() <= 0) {
//			section = 1;
//		} else {
//			section = Integer.parseInt(_section);
//		}
//		if (order_search_type !=null && order_search_type.length() < 1) {
//			order_search_type = "all";
//		}
//		Map pagingMap = GeneralFileUploader.getParameterMap(request);
//		pagingMap.put("category", category);
//		pagingMap.put("section", section);
//		pagingMap.put("order_search_type", order_search_type);
//		pagingMap.put("start", ((section-1) * 10 + pageNum - 1) * 10);
//	
//		List<OrderVO> orderList = mypageService.selectOrderList(pagingMap);		
					
		List<OrderVO> adminOrderList = adminOrderService.selectOrderByMemberType();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("adminOrderList", adminOrderList);
		
//		mav.addAllObjects(pagingMap);
//		
//		List<Map> resultMap = mypageService.countOrderNums();
//		long totalOrderNum = (long) resultMap.get(0).get("cnt");
//		long searchOrderNum = -1;
//		for (Map < String, Object> row : resultMap) {
//			String cate = (String) row.get("category");
//			long count = (long) row.get("cnt");
//			System.out.println("category=" + cate + ", count=" + count);
//			if (cate.equals(category)) {
//				searchOrderNum = count;
//			}
//		}
//		if (searchOrderNum < 0) {
//			searchOrderNum = totalOrderNum;
//		}
//		
//		mav.addObject("orderNumMap", resultMap);
//		mav.addObject("totalOrderNum", totalOrderNum);
//		mav.addObject("searchOrderNum", searchOrderNum);		
		
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
