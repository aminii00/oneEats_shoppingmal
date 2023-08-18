package com.example.demo.vo;

import java.sql.Date;
import java.util.Map;

import org.springframework.stereotype.Component;

@Component("recipeVO")
public class RecipeVO {
	private int recipeNo;
	private String title;
	private String cooking_time;
	private String description;
	private String cookingImg;
	private String category;
	private String inbun;
	private Date creDate;
	
	// 레시피를 올린 사람의 정보
	private MemberVO memberVO;
	
	public int getRecipeNo() {
		return recipeNo;
	}
	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCooking_time() {
		return cooking_time;
	}
	public void setCooking_time(String cooking_time) {
		this.cooking_time = cooking_time;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCookingImg() {
		return cookingImg;
	}
	public void setCookingImg(String cookingImg) {
		this.cookingImg = cookingImg;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getInbun() {
		return inbun;
	}
	public void setInbun(String inbun) {
		this.inbun = inbun;
	}
	public Date getCreDate() {
		return creDate;
	}
	public void setCreDate(Date creDate) {
		this.creDate = creDate;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	
	
}
