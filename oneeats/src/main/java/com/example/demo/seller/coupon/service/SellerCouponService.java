package com.example.demo.seller.coupon.service;

import java.util.List;

import com.example.demo.vo.CouponVO;

public interface SellerCouponService {

	List<CouponVO> selectSellerCouponByMemberNo(int memberNo);

	void insertSellerCoupon(CouponVO coupon);

	void deleteSellerCoupon(int couponNo);

}
