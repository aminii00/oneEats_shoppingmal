package com.example.demo.admin.order.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.example.demo.vo.OrderVO;

public interface AdminOrderService {

	List<OrderVO> selectOrderList();

	int[] selectSeqNoByOrderNo(int orderNo);

	void updateDeliveryStatusToCancel(int order_seqNo);

	List<OrderVO> selectOrderByMemberType();

}
