package com.example.demo.vo;

import org.springframework.stereotype.Component;

@Component("bookmarkVO")
public class BookmarkVO {
	private int memberNo;
	private int goodsNo;
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getGoodsNo() {
		return goodsNo;
	}
	public void setGoodsNo(int goodsNo) {
		this.goodsNo = goodsNo;
	}
	@Override
	public String toString() {
		return "BookmarkVO [memberNo=" + memberNo + ", goodsNo=" + goodsNo + "]";
	}
	
	
}
