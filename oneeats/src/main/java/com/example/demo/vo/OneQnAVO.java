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
	private int memberNo;
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreDate() {
		return creDate;
	}
	public void setCreDate(Date creDate) {
		this.creDate = creDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getParentNo() {
		return parentNo;
	}
	public void setParentNo(int parentNo) {
		this.parentNo = parentNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	@Override
	public String toString() {
		return "OneQnAVO [qnaNo=" + qnaNo + ", title=" + title + ", content=" + content + ", creDate=" + creDate
				+ ", status=" + status + ", parentNo=" + parentNo + ", memberNo=" + memberNo + "]";
	}
	
	
}
