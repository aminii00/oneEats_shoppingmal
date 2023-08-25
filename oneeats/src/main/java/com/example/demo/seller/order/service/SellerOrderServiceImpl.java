package com.example.demo.seller.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.seller.order.dao.SellerOrderDAO;
import com.example.demo.vo.OrderVO;

@Service("sellerOrderService")
public class SellerOrderServiceImpl implements SellerOrderService{
	@Autowired
	private SellerOrderDAO sellerOrderDAO;

	@Override
	public List<OrderVO> selectOrderList() {
		return sellerOrderDAO.selectOrderList();
	}

	@Override
	public int[] selectSeqNoByOrderNo(int orderNo) {
		return sellerOrderDAO.selectSeqNoByOrderNo(orderNo);
	}

	@Override
	public void updateDeliveryStatusToCancel(int order_seqNo) {
		sellerOrderDAO.updateDeliveryStatusToCancel(order_seqNo);
		
	}
	
	

	
}
