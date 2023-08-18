package com.example.demo.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("couponVO")
public class CouponVO {
	private int couponNo;
	private String name;
	private String discount_price;
	private String condition;
	private Date expDate;
	private Date creDate;
	public int getCouponNo() {
		return couponNo;
	}
	public void setCouponNo(int couponNo) {
		this.couponNo = couponNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDiscount_price() {
		return discount_price;
	}
	public void setDiscount_price(String discount_price) {
		this.discount_price = discount_price;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	public Date getExpDate() {
		return expDate;
	}
	public void setExpDate(Date expDate) {
		this.expDate = expDate;
	}
	public Date getCreDate() {
		return creDate;
	}
	public void setCreDate(Date creDate) {
		this.creDate = creDate;
	}
	@Override
	public String toString() {
		return "CouponVO [couponNo=" + couponNo + ", name=" + name + ", discount_price=" + discount_price
				+ ", condition=" + condition + ", expDate=" + expDate + ", creDate=" + creDate + "]";
	}
	
	
}
