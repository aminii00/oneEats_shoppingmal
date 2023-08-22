package com.example.demo.vo;

import org.springframework.stereotype.Component;

// 카트에 담은 상품을 표시하기 위한 VO
@Component
public class CartVO {
	private int goodsNo;
	private int goodsQty;
	private String goodsName;
	// 상품 메인 이미지만 저장
	private String goodsImg;
	
	// 원래(상품을 하나씩 살때)보다 얼마나 할인 받았는지
	private int discountPrice;
	
	// 옵션 테이블에서 가져오는 값들. optionQty는 당근 3개 들이의 3개
	private int optionNo;
	private int optionQty;
	private int optionPrice;
	private String optionInbun;
	
	
	public int getOptionPrice() {
		return optionPrice;
	}
	public void setOptionPrice(int optionPrice) {
		this.optionPrice = optionPrice;
	}

	public int getOptionNo() {
		return optionNo;
	}
	public void setOptionNo(int optionNo) {
		this.optionNo = optionNo;
	}
	
	
	public int getGoodsNo() {
		return goodsNo;
	}
	public void setGoodsNo(int goodsNo) {
		this.goodsNo = goodsNo;
	}
	public int getGoodsQty() {
		return goodsQty;
	}
	public void setGoodsQty(int goodsQty) {
		this.goodsQty = goodsQty;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getGoodsImg() {
		return goodsImg;
	}
	public void setGoodsImg(String goodsImg) {
		this.goodsImg = goodsImg;
	}
	
	public int getDiscountPrice() {
		return discountPrice;
	}
	public void setDiscountPrice(int discountPrice) {
		this.discountPrice = discountPrice;
	}

	public int getOptionQty() {
		return optionQty;
	}
	public void setOptionQty(int optionQty) {
		this.optionQty = optionQty;
	}
	public String getOptionInbun() {
		return optionInbun;
	}
	public void setOptionInbun(String optionInbun) {
		this.optionInbun = optionInbun;
	}
	@Override
	public String toString() {
		return "CartVO [goodsNo=" + goodsNo + ", goodsQty=" + goodsQty + ", goodsName=" + goodsName + ", goodsImg="
				+ goodsImg + ", discountPrice=" + discountPrice + ", optionNo=" + optionNo + ", optionQty=" + optionQty
				+ ", optionPrice=" + optionPrice + ", optionInbun=" + optionInbun + "]";
	}
	
}
