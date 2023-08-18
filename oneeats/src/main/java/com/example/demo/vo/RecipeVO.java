package com.example.demo.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("recipeVO")
public class RecipeVO {
	private int recipeNO;
	private String title;
	private String cooking_time;
	private String description;
	private String cookingImg;
	private String category;
	private String inbun;
	private Date creDate;
	private MemberVO memberVO;
}
