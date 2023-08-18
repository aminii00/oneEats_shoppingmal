package com.example.demo.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("hotDealVO")
public class HotDealVO {
	private int hotdealNo;
	private String name;
	private String discounted_price;
	private String goods_qty;
	private Date finishDate;
	private String description;
	private Date creDate;
	private String category;
	private int goodsNo;
	
	public int getGoodsNo() {
		return goodsNo;
	}
	public void setGoodsNo(int goodsNo) {
		this.goodsNo = goodsNo;
	}
	public int getHotdealNo() {
		return hotdealNo;
	}
	public void setHotdealNo(int hotdealNo) {
		this.hotdealNo = hotdealNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDiscounted_price() {
		return discounted_price;
	}
	public void setDiscounted_price(String discounted_price) {
		this.discounted_price = discounted_price;
	}
	public String getGoods_qty() {
		return goods_qty;
	}
	public void setGoods_qty(String goods_qty) {
		this.goods_qty = goods_qty;
	}
	public Date getFinishDate() {
		return finishDate;
	}
	public void setFinishDate(Date finishDate) {
		this.finishDate = finishDate;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getCreDate() {
		return creDate;
	}
	public void setCreDate(Date creDate) {
		this.creDate = creDate;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	@Override
	public String toString() {
		return "HotDealVO [hotdealNo=" + hotdealNo + ", name=" + name + ", discounted_price=" + discounted_price
				+ ", goods_qty=" + goods_qty + ", finishDate=" + finishDate + ", description=" + description
				+ ", creDate=" + creDate + ", category=" + category + ", goodsNo=" + goodsNo + "]";
	}
	
	
	
	
}
