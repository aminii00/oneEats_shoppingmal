package com.example.demo.vo;


import org.springframework.stereotype.Component;

@Component("optionVO")
public class OptionVO {
	private int optionNo;
	private String name;
	private String option_qty;
	private String option_inbun;
	private String price;
	private int goodsNo;
	
	
	public int getOptionNo() {
		return optionNo;
	}
	public void setOptionNo(int optionNo) {
		this.optionNo = optionNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOption_qty() {
		return option_qty;
	}
	public void setOption_qty(String option_qty) {
		this.option_qty = option_qty;
	}
	public String getOption_inbun() {
		return option_inbun;
	}
	public void setOption_inbun(String option_inbun) {
		this.option_inbun = option_inbun;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public int getGoodsNo() {
		return goodsNo;
	}
	public void setGoodsNo(int goodsNo) {
		this.goodsNo = goodsNo;
	}
	
	
	
	
}