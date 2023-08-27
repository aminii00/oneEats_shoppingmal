package com.example.demo.admin.coupon.service;

import java.util.List;

import com.example.demo.vo.CouponVO;
import com.example.demo.vo.OrderVO;

public interface AdminCouponService {

	List<CouponVO> adminCouponByMemberNo(int memberNo);

	void insertAdminCoupon(int memberNo);

}
