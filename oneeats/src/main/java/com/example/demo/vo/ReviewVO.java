package com.example.demo.vo;

import org.springframework.stereotype.Component;

@Component("reviewVO")
public class ReviewVO {
	private int reviewNo;
	private String star;
	private String reviewImg;
	private String content;
	private int goodsNo;
	private int memberNo;
	
	
	
	@Override
	public String toString() {
		return "ReviewVO [reviewNo=" + reviewNo + ", star=" + star + ", reviewImg=" + reviewImg + ", content=" + content
				+ ", goodsNo=" + goodsNo + ", memberNo=" + memberNo + "]";
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
	
	
}
