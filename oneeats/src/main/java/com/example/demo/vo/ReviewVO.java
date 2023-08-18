package com.example.demo.vo;

import org.springframework.stereotype.Component;

@Component("reviewVO")
public class ReviewVO {
	private int reviewNo;
	private String star;
	private String reviewImg;
	private String content;
	
	// 리뷰를 남긴 멤버의 정보
	private MemberVO memberVO;
	
	// 리뷰 대상 상품의 정보
	private GoodsVO goodsVO;
	
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
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public GoodsVO getGoodsVO() {
		return goodsVO;
	}
	public void setGoodsVO(GoodsVO goodsVO) {
		this.goodsVO = goodsVO;
	}
	
	
}
