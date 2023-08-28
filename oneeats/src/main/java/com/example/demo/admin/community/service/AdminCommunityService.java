package com.example.demo.admin.community.service;

import java.util.List;

import com.example.demo.vo.NoticeVO;

public interface AdminCommunityService {
	public List<NoticeVO> adminNoticeList();
	
	public NoticeVO adminNoticeDetail(int noticeNo);
	
	public void adminNotideDetailupdate(NoticeVO noticeVO);
	
	 public void deleteNotice(int noticeNo);
	 
	 public int newNum();
	 
	 public void addNotice(NoticeVO noticeVO);
}
