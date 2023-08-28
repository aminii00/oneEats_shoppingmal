package com.example.demo.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component("reviewVO")
public class ReviewVO {
	private int reviewNo;
	private String star;
	private String reviewImg;
	private String content;
	private int goodsNo;
	private int memberNo;
	private int goods_qty;
	private Date deliveryDate;
	private String goodsName;
	
	
	
	@Override
	public String toString() {
		return "ReviewVO [reviewNo=" + reviewNo + ", star=" + star + ", reviewImg=" + reviewImg + ", content=" + content
				+ ", goodsNo=" + goodsNo + ", memberNo=" + memberNo + ", goods_qty=" + goods_qty + ", deliveryDate="
				+ deliveryDate + ", goodsName=" + goodsName + "]";
	}
	public int getGoodsNo() {
		return goodsNo;
	}
	public void setGoodsNo(int goodsNo) {
		this.goodsNo = goodsNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getStar() {
		return star;
	}
	public void setStar(String star) {
		this.star = star;
	}
	public String getReviewImg() {
		return reviewImg;
	}
	public void setReviewImg(String reviewImg) {
		this.reviewImg = reviewImg;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getGoods_qty() {
		return goods_qty;
	}
	public void setGoods_qty(int goods_qty) {
		this.goods_qty = goods_qty;
	}
	public Date getDeliveryDate() {
		return deliveryDate;
	}
	public void setDeliveryDate(Date deliveryDate) {
		this.deliveryDate = deliveryDate;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	
	
}
