package com.example.demo.admin.order.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.example.demo.vo.OrderVO;

@Mapper
@Repository("adminOrderDAO")
public interface AdminOrderDAO {

	List<OrderVO> selectOrderList();

	int[] selectSeqNoByOrderNo(int orderNo);

	void updateDeliveryStatusToCancel(int order_seqNo);

	List<OrderVO> selectOrderByMemberType();
	
//	public List<OrderVO> selectOrderList(Map pagingMap);
//
//	public List<Map> countOrderNums();

}
