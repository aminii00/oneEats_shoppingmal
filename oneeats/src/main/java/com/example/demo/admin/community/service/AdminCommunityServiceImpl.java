package com.example.demo.admin.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.admin.community.dao.AdminCommunityDAO;
import com.example.demo.vo.NoticeVO;

@Service("adminCommunityService")
public class AdminCommunityServiceImpl implements AdminCommunityService {

 @Autowired 
 private AdminCommunityDAO adminCommunityDAO;
 
 @Override
	public List<NoticeVO> adminNoticeList(){
		List<NoticeVO> noticeList = adminCommunityDAO.adminNoticeList();
		return noticeList;
	}
 @Override
 public NoticeVO adminNoticeDetail(int noticeNo) {
	 NoticeVO noticeVO = adminCommunityDAO.adminNoticeDetail(noticeNo);
	 return noticeVO;
 }
 

 @Override
 public void adminNotideDetailupdate(NoticeVO noticeVO) {
	  adminCommunityDAO.adminNotideDetailupdate(noticeVO);
 }
 
 @Override
 public void deleteNotice(int noticeNo) {
	  adminCommunityDAO.deleteNotice(noticeNo);
 }
 
 @Override
 public int newNum() {
	int noticeNo= adminCommunityDAO.newNum();
	return noticeNo;
 }
 @Override
 public void addNotice(NoticeVO noticeVO) {
	 adminCommunityDAO.addNotice(noticeVO);
 }
}
