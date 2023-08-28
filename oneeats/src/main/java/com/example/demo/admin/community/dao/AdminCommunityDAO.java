package com.example.demo.admin.community.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.example.demo.vo.NoticeVO;
import com.example.demo.vo.RecipeVO;

@Mapper
@Repository("adminCommunityDAO")
public interface AdminCommunityDAO {
	public List<RecipeVO> sellectAllRecipe();
	
	public List<NoticeVO> adminNoticeList();
	
	public NoticeVO adminNoticeDetail(int noticeNo);
	
	public void adminNotideDetailupdate(NoticeVO noticeVO);
	
	 public void deleteNotice(int noticeNo);
	 
	 public int newNum();
	 
	 public void addNotice(NoticeVO noticeVO);
}
