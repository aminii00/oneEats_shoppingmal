package com.example.demo.admin.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.example.demo.admin.order.dao.AdminOrderDAO;
import com.example.demo.vo.OrderVO;

@Service("adminOrderService")
public class AdminOrderServiceImpl implements AdminOrderService {
	@Autowired
	private AdminOrderDAO adminOrderDAO;

	@Override
	public List<OrderVO> selectOrderList(){
		return adminOrderDAO.selectOrderList();
	}

	@Override
	public int[] selectSeqNoByOrderNo(int orderNo) {
		return adminOrderDAO.selectSeqNoByOrderNo(orderNo);
	}

	@Override
	public void updateDeliveryStatusToCancel(int order_seqNo) {
		adminOrderDAO.updateDeliveryStatusToCancel(order_seqNo);
		
	}
	
	
	
}
