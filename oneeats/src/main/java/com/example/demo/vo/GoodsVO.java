package com.example.demo.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("goodsVO")
public class GoodsVO {
	private int goodsNo;
	private String name;
	private String price;
	private String rapping;
	private String manufacturer;
	private String weight;
	private Date expDate;
	private String description;
	private String harvest;
	private Date creDate;
	private String img1;
	private String img2;
	private String img3;
	private String img4;
	private String img5;
	private String category;
	private String type;
	private int memberNo;
	public int getGoodsNo() {
		return goodsNo;
	}
	public void setGoodsNo(int goodsNo) {
		this.goodsNo = goodsNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getRapping() {
		return rapping;
	}
	public void setRapping(String rapping) {
		this.rapping = rapping;
	}
	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public Date getExpDate() {
		return expDate;
	}
	public void setExpDate(Date expDate) {
		this.expDate = expDate;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getHarvest() {
		return harvest;
	}
	public void setHarvest(String harvest) {
		this.harvest = harvest;
	}
	public Date getCreDate() {
		return creDate;
	}
	public void setCreDate(Date creDate) {
		this.creDate = creDate;
	}
	public String getImg1() {
		return img1;
	}
	public void setImg1(String img1) {
		this.img1 = img1;
	}
	public String getImg2() {
		return img2;
	}
	public void setImg2(String img2) {
		this.img2 = img2;
	}
	public String getImg3() {
		return img3;
	}
	public void setImg3(String img3) {
		this.img3 = img3;
	}
	public String getImg4() {
		return img4;
	}
	public void setImg4(String img4) {
		this.img4 = img4;
	}
	public String getImg5() {
		return img5;
	}
	public void setImg5(String img5) {
		this.img5 = img5;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	@Override
	public String toString() {
		return "GoodsVO [goodsNo=" + goodsNo + ", name=" + name + ", price=" + price + ", rapping=" + rapping
				+ ", manufacturer=" + manufacturer + ", weight=" + weight + ", expDate=" + expDate + ", description="
				+ description + ", harvest=" + harvest + ", creDate=" + creDate + ", img1=" + img1 + ", img2=" + img2
				+ ", img3=" + img3 + ", img4=" + img4 + ", img5=" + img5 + ", category=" + category + ", type=" + type
				+ ", memberNo=" + memberNo + "]";
	}
	
	
	
	
}
