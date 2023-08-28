package com.example.demo.admin.coupon.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.example.demo.vo.CouponVO;

@Mapper
@Repository("adminCouponDAO")
public interface AdminCouponDAO {

	List<CouponVO> selectAdminCouponByMemberNo(int memberNo);

	void insertAdminCoupon(CouponVO coupon);

	void deleteAdminCoupon(int couponNo);

}
