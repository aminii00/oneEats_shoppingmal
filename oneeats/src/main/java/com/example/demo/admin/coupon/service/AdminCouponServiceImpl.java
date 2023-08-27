package com.example.demo.admin.coupon.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.admin.coupon.dao.AdminCouponDAO;
import com.example.demo.vo.CouponVO;

@Service("adminCouponService")
public class AdminCouponServiceImpl implements AdminCouponService {
	@Autowired
	private AdminCouponDAO adminCouponDAO;

	@Override
	public List<CouponVO> adminCouponByMemberNo(int memberNo) {
		return adminCouponDAO.adminCouponByMemberNo(memberNo);
	}

	@Override
	public void insertAdminCoupon(int memberNo) {
		adminCouponDAO.insertAdminCoupon(memberNo);
		
	}	
	
}
