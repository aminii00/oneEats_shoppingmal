package com.example.demo.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("oneQnAVO")
public class OneQnAVO {
	private int qnaNo;
	private String title;
	private String content;
	private Date creDate;
	private String status;
	private int parentNo;
	private MemberVO memberVO;
}
